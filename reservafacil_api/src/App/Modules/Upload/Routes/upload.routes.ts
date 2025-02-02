import { Router } from "express";
import multer from "multer";

import {
  validateJobId,
  validateUploadImage,
} from "../Validation/upload-validate";
import { uploadController } from "../Controllers/UploadController";

export const uploadRouter = Router();

const upload = multer({
  limits: {
    fileSize: 2 * 1024 * 1024, // 2 MB
  },
  // fileFilter(req, file, callback) {
  //   if (!file.mimetype.startsWith("image/")) {
  //     return callback(new Error("Invalid file type"));
  //   }
  //   callback(null, true);
  // },
});


uploadRouter.post(
  "/image",
  validateUploadImage,
  upload.single("image"),
  uploadController.uploadImage
);
