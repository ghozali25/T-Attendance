import https from 'https';
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const MODELS_DIR = path.join(__dirname, '../public/models');

const MODEL_FILES = [
    // Tiny Face Detector
    'tiny_face_detector_model-weights_manifest.json',
    'tiny_face_detector_model-shard1',
    // Face Landmark 68
    'face_landmark_68_model-weights_manifest.json',
    'face_landmark_68_model-shard1',
    // Face Recognition
    'face_recognition_model-weights_manifest.json',
    'face_recognition_model-shard1',
    'face_recognition_model-shard2',
];

const BASE_URL = 'https://raw.githubusercontent.com/justadudewhohacks/face-api.js/master/weights';

const downloadFile = (filename) => {
    return new Promise((resolve, reject) => {
        const filePath = path.join(MODELS_DIR, filename);
        const url = `${BASE_URL}/${filename}`;

        console.log(`Downloading ${filename}...`);

        https.get(url, (response) => {
            if (response.statusCode !== 200) {
                reject(new Error(`Failed to download ${filename}: ${response.statusCode}`));
                return;
            }

            const fileStream = fs.createWriteStream(filePath);
            response.pipe(fileStream);

            fileStream.on('finish', () => {
                fileStream.close();
                console.log(`✓ ${filename} downloaded`);
                resolve();
            });

            fileStream.on('error', (err) => {
                fs.unlink(filePath, () => {});
                reject(err);
            });
        }).on('error', reject);
    });
};

async function downloadModels() {
    console.log('Downloading face-api.js models...\n');

    if (!fs.existsSync(MODELS_DIR)) {
        fs.mkdirSync(MODELS_DIR, { recursive: true });
    }

    for (const file of MODEL_FILES) {
        try {
            await downloadFile(file);
        } catch (error) {
            console.error(`✗ Failed to download ${file}:`, error.message);
        }
    }

    console.log('\n✓ Models download complete!');
}

downloadModels();