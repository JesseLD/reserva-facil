import path from "path";
import fs from "fs";
import sharp from "sharp";

export class UploadService {
  static generateRandomFileName() {
    // Gera um identificador único usando o timestamp e um número aleatório
    const randomString = Math.random().toString(36).substr(2, 9); // Gera uma string aleatória
    return randomString; // Retorna apenas o nome sem a extensão
  }

  static sanitizeFileName(fileName: string) {
    // Remove qualquer caractere que não seja letra, número ou espaço
    return fileName.replace(/[^a-zA-Z0-9]+/g, "-").toLowerCase();
  }

  static async processImage(file: any) {
    // Log do buffer para garantir que a imagem está sendo recebida corretamente
    console.log("Buffer size:", file.buffer.length);

    // Obtendo o ano e mês atuais
    const currentDate = new Date();
    const year = currentDate.getFullYear();
    const month = String(currentDate.getMonth() + 1).padStart(2, "0"); // Adiciona zero à esquerda se o mês for menor que 10

    // Definindo o caminho de saída com a estrutura de diretórios ano/mês
    const uploadDir = path.join(
      __dirname,
      "..",
      "..",
      "..",
      "..",
      "uploads",
      year.toString(),
      month
    );

    // Garantir que o diretório existe (ano/mês)
    if (!fs.existsSync(uploadDir)) {
      fs.mkdirSync(uploadDir, { recursive: true }); // Cria os diretórios se não existirem
    }

    // const filename = file.originalname.split(".")[0];

    const sanitizedFilename = this.generateRandomFileName();

    // Nome do arquivo de saída
    const processedFilename = `${sanitizedFilename}-${Date.now()}.jpeg`;
    const outputPath = path.join(uploadDir, processedFilename);

    // Processando a imagem com sharp
    await sharp(file.buffer)
      .resize(300, 300, { fit: "cover" })
      .jpeg({ quality: 80 })
      .toFile(outputPath);

    console.log("Image processed and saved:", processedFilename);

    return path.join(year.toString(), month, processedFilename); // Retorna o caminho relativo
  }

  static async removeImageFromUploadsFolder(id: string) {
    const uploadDir = path.join(
      __dirname,
      "..",
      "..",
      "..",
      "..",
      "uploads",
      id
    );

    if (!fs.existsSync(uploadDir)) {
      return;
    }

    fs.rm(
      uploadDir,
      {
        recursive: true,
      },
      (err) => {
        if (err) {
          console.error("Error removing image:", err);
        }
      }
    );
  }
}
