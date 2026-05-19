import { useRef, useEffect, useState, useCallback } from "react";
import * as faceapi from 'face-api.js';
import { Camera, CameraOff, RefreshCw, ScanFace, CheckCircle2, XCircle } from "lucide-react";
import { Button } from "@/components/ui/button";
import { loadFaceDetectionModels, getFaceDescriptor, serializeDescriptor, deserializeDescriptor, verifyFaceMatches } from "@/lib/faceDetection";

type CaptureMode = "register" | "verify";

interface FaceCaptureProps {
  mode: CaptureMode;
  onCapture: (descriptor: number[]) => void;
  onCancel: () => void;
  existingDescriptor?: number[];
  isOpen: boolean;
}

export function FaceCapture({ mode, onCapture, onCancel, existingDescriptor, isOpen }: FaceCaptureProps) {
  const videoRef = useRef<HTMLVideoElement>(null);
  const canvasRef = useRef<HTMLCanvasElement>(null);
  const [isCameraReady, setIsCameraReady] = useState(false);
  const [isProcessing, setIsProcessing] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [modelsLoading, setModelsLoading] = useState(true);
  const [faceDetected, setFaceDetected] = useState(false);
  const [capturedImage, setCapturedImage] = useState<string | null>(null);
  const [verificationResult, setVerificationResult] = useState<{ match: boolean; distance: number } | null>(null);
  const streamRef = useRef<MediaStream | null>(null);
  const animationRef = useRef<number>(0);

  // Initialize camera and models
  useEffect(() => {
    if (!isOpen) return;

    let cancelled = false;

    async function init() {
      try {
        setModelsLoading(true);
        await loadFaceDetectionModels();
        setModelsLoading(false);

        const stream = await navigator.mediaDevices.getUserMedia({
          video: {
            width: { ideal: 640 },
            height: { ideal: 480 },
            facingMode: "user",
          },
        });

        if (cancelled) {
          stream.getTracks().forEach(t => t.stop());
          return;
        }

        streamRef.current = stream;
        if (videoRef.current) {
          videoRef.current.srcObject = stream;
          await videoRef.current.play();
          setIsCameraReady(true);
          startFaceDetection();
        }
      } catch (err: any) {
        setModelsLoading(false);
        if (err.name === "NotAllowedError") {
          setError("Izin kamera ditolak. Mohon izinkan akses kamera.");
        } else if (err.name === "NotFoundError") {
          setError("Kamera tidak ditemukan pada perangkat ini.");
        } else {
          setError(err.message || "Gagal menginisialisasi kamera");
        }
      }
    }

    init();

    return () => {
      cancelled = true;
      stopCamera();
    };
  }, [isOpen]);

  const stopCamera = useCallback(() => {
    if (animationRef.current) {
      cancelAnimationFrame(animationRef.current);
    }
    if (streamRef.current) {
      streamRef.current.getTracks().forEach(track => track.stop());
      streamRef.current = null;
    }
    setIsCameraReady(false);
    setCapturedImage(null);
    setFaceDetected(false);
    setVerificationResult(null);
  }, []);

  const startFaceDetection = useCallback(() => {
    const detect = async () => {
      if (!videoRef.current || !canvasRef.current) return;

      const video = videoRef.current;
      const canvas = canvasRef.current;
      const displaySize = { width: video.videoWidth, height: video.videoHeight };

      faceapi.matchDimensions(canvas, displaySize);

      try {
        const detections = await faceapi
          .detectAllFaces(video, new faceapi.TinyFaceDetectorOptions({
            inputSize: 320,
            scoreThreshold: 0.5,
          }))
          .withFaceLandmarks();

        const ctx = canvas.getContext('2d');
        if (ctx) {
          ctx.clearRect(0, 0, canvas.width, canvas.height);
        }

        if (detections.length > 0) {
          setFaceDetected(true);
          const resizedDetections = faceapi.resizeResults(detections, displaySize);
          if (ctx) {
            faceapi.draw.drawDetections(canvas, resizedDetections);
            faceapi.draw.drawFaceLandmarks(canvas, resizedDetections);
          }
        } else {
          setFaceDetected(false);
        }
      } catch (err) {
        // Silently continue detection loop
      }

      animationRef.current = requestAnimationFrame(detect);
    };

    animationRef.current = requestAnimationFrame(detect);
  }, []);

  const handleCapture = async () => {
    if (!videoRef.current) return;

    setIsProcessing(true);
    setError(null);

    try {
      const descriptor = await getFaceDescriptor(videoRef.current);

      if (!descriptor) {
        setError("Tidak ada wajah terdeteksi. Pastikan wajah Anda terlihat jelas.");
        setIsProcessing(false);
        return;
      }

      // Take a snapshot for display
      const canvas = document.createElement('canvas');
      canvas.width = videoRef.current.videoWidth;
      canvas.height = videoRef.current.videoHeight;
      const ctx = canvas.getContext('2d');
      if (ctx) {
        ctx.drawImage(videoRef.current, 0, 0);
        setCapturedImage(canvas.toDataURL('image/jpeg', 0.8));
      }

      const serialized = serializeDescriptor(descriptor);

      // If verifying with existing descriptor
      if (mode === "verify" && existingDescriptor) {
        const result = await verifyFaceMatches(
          descriptor,
          deserializeDescriptor(existingDescriptor)
        );
        setVerificationResult({
          match: result.verified,
          distance: result.distance,
        });

        if (result.verified) {
          // Short delay to show success
          setTimeout(() => {
            onCapture(serialized);
            setIsProcessing(false);
          }, 1000);
          return;
        } else {
          setIsProcessing(false);
          setError(`Wajah tidak cocok (jarak: ${result.distance.toFixed(3)}). Silakan coba lagi.`);
          return;
        }
      }

      // Registration mode - capture immediately
      setTimeout(() => {
        onCapture(serialized);
        setIsProcessing(false);
      }, 500);

    } catch (err: any) {
      setError(err.message || "Gagal memproses wajah");
      setIsProcessing(false);
    }
  };

  const handleRetry = () => {
    setCapturedImage(null);
    setVerificationResult(null);
    setError(null);
    setFaceDetected(false);
    if (videoRef.current && streamRef.current) {
      setIsCameraReady(true);
      startFaceDetection();
    }
  };

  if (!isOpen) return null;

  return (
    <div className="fixed inset-0 z-[200] flex items-center justify-center bg-black/70 backdrop-blur-sm">
      <div className="bg-white dark:bg-slate-900 rounded-3xl p-6 max-w-lg w-full mx-4 shadow-2xl overflow-hidden">
        {/* Header */}
        <div className="flex items-center justify-between mb-4">
          <div className="flex items-center gap-2">
            <ScanFace className="h-5 w-5 text-blue-600" />
            <h3 className="text-lg font-bold text-slate-800 dark:text-slate-100">
              {mode === "register" ? "Daftarkan Wajah" : "Verifikasi Wajah"}
            </h3>
          </div>
          <button
            onClick={onCancel}
            className="w-8 h-8 rounded-full bg-slate-100 dark:bg-slate-800 flex items-center justify-center text-slate-500 hover:text-slate-700 transition-colors"
          >
            <XCircle className="h-4 w-4" />
          </button>
        </div>

        {/* Status */}
        {error && (
          <div className="mb-4 p-3 bg-red-50 dark:bg-red-900/30 border border-red-200 dark:border-red-800 rounded-xl flex items-start gap-2">
            <XCircle className="h-4 w-4 text-red-500 mt-0.5 shrink-0" />
            <p className="text-xs font-medium text-red-700 dark:text-red-300">{error}</p>
          </div>
        )}

        {verificationResult && verificationResult.match && (
          <div className="mb-4 p-3 bg-emerald-50 dark:bg-emerald-900/30 border border-emerald-200 dark:border-emerald-800 rounded-xl flex items-center gap-2">
            <CheckCircle2 className="h-4 w-4 text-emerald-500 shrink-0" />
            <p className="text-xs font-medium text-emerald-700 dark:text-emerald-300">
              Wajah cocok! Jarak: {verificationResult.distance.toFixed(3)}
            </p>
          </div>
        )}

        {/* Camera / Preview */}
        <div className="relative rounded-2xl overflow-hidden bg-slate-900 aspect-[4/3] mb-4">
          {modelsLoading ? (
            <div className="absolute inset-0 flex flex-col items-center justify-center gap-3">
              <div className="w-10 h-10 border-3 border-blue-400 border-t-transparent rounded-full animate-spin" />
              <p className="text-sm text-white/70 font-medium">Memuat model deteksi wajah...</p>
            </div>
          ) : !isCameraReady && !capturedImage ? (
            <div className="absolute inset-0 flex flex-col items-center justify-center gap-3">
              <CameraOff className="h-10 w-10 text-white/50" />
              <p className="text-sm text-white/70 font-medium">Kamera tidak tersedia</p>
            </div>
          ) : capturedImage ? (
            <img src={capturedImage} alt="Captured face" className="w-full h-full object-cover" />
          ) : null}

          <video
            ref={videoRef}
            autoPlay
            playsInline
            muted
            className={`w-full h-full object-cover ${capturedImage ? 'hidden' : ''}`}
          />
          <canvas
            ref={canvasRef}
            className="absolute inset-0 w-full h-full"
          />

          {/* Face detection indicator overlay */}
          {isCameraReady && !capturedImage && (
            <div className="absolute bottom-3 left-3 right-3 flex justify-center">
              <div className={`px-4 py-1.5 rounded-full text-xs font-bold backdrop-blur-sm ${
                faceDetected
                  ? 'bg-emerald-500/80 text-white'
                  : 'bg-amber-500/80 text-white'
              }`}>
                {faceDetected ? '✓ Wajah Terdeteksi' : 'Cari Wajah...'}
              </div>
            </div>
          )}

          {/* Processing overlay */}
          {isProcessing && (
            <div className="absolute inset-0 bg-black/50 flex items-center justify-center">
              <div className="text-center">
                <div className="w-12 h-12 border-3 border-white border-t-transparent rounded-full animate-spin mx-auto mb-2" />
                <p className="text-white text-sm font-medium">Memproses...</p>
              </div>
            </div>
          )}
        </div>

        {/* Actions */}
        <div className="flex gap-3">
          {capturedImage ? (
            <>
              <Button
                variant="outline"
                onClick={handleRetry}
                className="flex-1 h-12 rounded-xl border-slate-200 dark:border-slate-700"
              >
                <RefreshCw className="h-4 w-4 mr-2" /> Ulang
              </Button>
            </>
          ) : (
            <Button
              onClick={handleCapture}
              disabled={!isCameraReady || isProcessing || !faceDetected}
              className="flex-1 h-12 rounded-xl bg-blue-600 hover:bg-blue-700 text-white font-bold disabled:opacity-50"
            >
              {isProcessing ? (
                <div className="flex items-center gap-2">
                  <div className="w-4 h-4 border-2 border-white/30 border-t-white rounded-full animate-spin" />
                  Memproses...
                </div>
              ) : (
                <>
                  <Camera className="h-4 w-4 mr-2" />
                  {mode === "register" ? "Ambil Foto Wajah" : "Verifikasi Wajah"}
                </>
              )}
            </Button>
          )}
        </div>

        {mode === "register" && (
          <p className="mt-3 text-[10px] text-slate-400 text-center">
            Pastikan wajah Anda terlihat jelas dengan pencahayaan yang cukup
          </p>
        )}
      </div>
    </div>
  );
}