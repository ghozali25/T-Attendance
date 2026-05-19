import * as faceapi from 'face-api.js';

const MODEL_URL = '/models';

let modelsLoaded = false;

export async function loadFaceDetectionModels(): Promise<void> {
  if (modelsLoaded) return;

  try {
    await Promise.all([
      faceapi.nets.tinyFaceDetector.loadFromUri(MODEL_URL),
      faceapi.nets.faceLandmark68Net.loadFromUri(MODEL_URL),
      faceapi.nets.faceRecognitionNet.loadFromUri(MODEL_URL),
    ]);
    modelsLoaded = true;
    console.log('[FaceDetection] Models loaded successfully');
  } catch (error) {
    console.error('[FaceDetection] Failed to load models:', error);
    throw new Error('Gagal memuat model deteksi wajah');
  }
}

export async function getFaceDescriptor(videoElement: HTMLVideoElement): Promise<Float32Array | null> {
  try {
    const detection = await faceapi
      .detectSingleFace(videoElement, new faceapi.TinyFaceDetectorOptions({
        inputSize: 320,
        scoreThreshold: 0.5,
      }))
      .withFaceLandmarks()
      .withFaceDescriptor();

    if (!detection) {
      return null;
    }

    return detection.descriptor;
  } catch (error) {
    console.error('[FaceDetection] Error detecting face:', error);
    return null;
  }
}

export function compareFaceDescriptors(
  descriptor1: Float32Array,
  descriptor2: Float32Array,
  threshold: number = 0.5
): { match: boolean; distance: number } {
  const distance = faceapi.euclideanDistance(descriptor1, descriptor2);
  return {
    match: distance < threshold,
    distance,
  };
}

export function serializeDescriptor(descriptor: Float32Array): number[] {
  return Array.from(descriptor);
}

export function deserializeDescriptor(data: number[] | Float32Array): Float32Array {
  if (data instanceof Float32Array) return data;
  return new Float32Array(data);
}

export async function verifyFaceMatches(
  capturedDescriptor: Float32Array,
  storedDescriptor: Float32Array,
  threshold: number = 0.5
): Promise<{ verified: boolean; distance: number }> {
  const { match, distance } = compareFaceDescriptors(
    capturedDescriptor,
    storedDescriptor,
    threshold
  );
  return { verified: match, distance };
}