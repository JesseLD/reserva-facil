import { Router } from "express";
import {
  validateCreateUser,
  validateEmail,
  validateGetUserById,
  validatePostUserId,
  validateRecoverPassword,
  validateRemoveImage,
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
// userRouter.get("/", (req, res) => {
//   res.send("Hello, user!");
// });

// userRouter.get("/:id", (req, res) => {
//   res.send("Hello, user with id: " + req.params.id);
// });
userRouter.get("/account/:id", validateGetUserById, userController.getUserById);

userRouter.post("/refresh", validateEmail, userController.refresh);

userRouter.post("/create", validateCreateUser, userController.createUser);
userRouter.post(
  "/recover-password",
  validateRecoverPassword,
  userController.sendMail
);

userRouter.post(
  "/upload-image/:id",
  validateUploadUserId,
  upload.single("image"),
  userController.updateProfileImage
);
userRouter.delete(
  "/remove-image",
  validateRemoveImage,
  userController.removeUserImage
);
