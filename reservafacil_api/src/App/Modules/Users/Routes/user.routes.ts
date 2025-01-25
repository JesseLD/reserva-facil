import { Router } from "express";
import {
  validateCreateUser,
  validateDeleteUser,
  validateEmail,
  validateGetUserById,
  validatePostUserId,
  validateRecoverPassword,
  validateRemoveImage,
  ValidateUpdatePass,
  ValidateUpdateUser,
  validateUploadUserId,
} from "../Validation/user-validate";
import { userController } from "../Controllers/UserController";
import multer from "multer";

export const userRouter = Router();

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

userRouter.get("/account/:id", validateGetUserById, userController.getUserById);

userRouter.post("/refresh", validateEmail, userController.refresh);

userRouter.post("/create", validateCreateUser, userController.createUser);

userRouter.post(
  "/recover-password",
  validateRecoverPassword,
  userController.getRecoverPasswordCode
);

userRouter.post(
  "/upload-image/:id",
  validateUploadUserId,
  upload.single("image"),
  userController.updateProfileImage
);

userRouter.put("/update", ValidateUpdateUser, userController.updateUser);
userRouter.put("/update-password", ValidateUpdatePass, userController.updatePassword);

userRouter.delete(
  "/remove-image",
  validateRemoveImage,
  userController.removeUserImage
);

userRouter.delete("/delete/:id", validateDeleteUser, userController.deleteUser);
