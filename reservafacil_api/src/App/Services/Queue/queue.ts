import Queue from "bull";
import sharp from "sharp";
import path from "path";
import fs from "fs";

const uploadDir = path.join(__dirname, "uploads");

if (!fs.existsSync(uploadDir)) {
  fs.mkdirSync(uploadDir);
}

export const imageQueue = new Queue("image processing");

imageQueue.process(async (job) => {
  const { buffer, filename } = job.data;
  const processedFilename = `${filename}-${Date.now()}.jpeg`;

  const outputPath = path.join(uploadDir, processedFilename);

  try {
    console.log("Processing image:", filename);  // Log para verificar se o job chegou aqui
    await sharp(buffer)
      .resize(300, 300, {
        fit: "cover",
      })
      .jpeg({ quality: 80 })
      .toFile(outputPath);

    console.log("Image processed and saved:", processedFilename);  // Log para confirmar que foi salvo
    return processedFilename;
  } catch (error) {
    console.error("Error processing image:", error);  // Log para capturar o erro caso haja algum
    throw error;
  }
});
