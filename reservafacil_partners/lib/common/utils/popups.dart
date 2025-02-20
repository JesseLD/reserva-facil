import 'package:flutter/material.dart';
import 'package:reservafacil_partners/common/constants/app_colors.dart';
import 'package:reservafacil_partners/common/constants/app_text_styles.dart';
import 'package:reservafacil_partners/common/utils/url_launcher.dart';
import 'package:universal_io/io.dart';

void showErrorPopup(
  BuildContext context, {
  required String message,
  String title = 'Erro',
  String buttonText = 'OK',
  Function()? onPressed,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: Text(
          title,
          style: AppTextStyles.subtitle.copyWith(
            color: AppColors.primaryAlternative,
          ),
          textAlign: TextAlign.center,
        ),
        content: SizedBox(
          width: 300,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 8),
              Text(
                message,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              buttonText,
              style: AppTextStyles.button.copyWith(
                color: AppColors.primaryAlternative,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
              if (onPressed != null) {
                onPressed();
              }
            },
          ),
        ],
      );
    },
  );
}

void showMessagePopup(
  BuildContext context, {
  required String message,
  String title = 'Message',
  String buttonText = 'OK',
  Function()? onPressed,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: Text(
          title,
          style: TextStyle(color: AppColors.primaryAlternative),
        ),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: Text(buttonText),
            onPressed: () {
              Navigator.of(context).pop();
              if (onPressed != null) {
                onPressed();
              }
            },
          ),
        ],
      );
    },
  );
}

void showLoadingPopup(
  BuildContext context, {
  String message = 'Carregando...',
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        content: Row(
          children: <Widget>[
            const CircularProgressIndicator(),
            Container(
              margin: const EdgeInsets.only(left: 8),
              child: Text(message),
            ),
          ],
        ),
      );
    },
  );
}

showConfirmationPopup(
  BuildContext context, {
  required String message,
  required String title,
  required String confirmText,
  required String cancelText,
  required Function() onConfirm,
  required Function() onCancel,
}) {
  showDialog(
    context: context,
    // barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: Text(
          title,
          style: TextStyle(color: AppColors.primaryAlternative),
        ),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: Text(cancelText),
            onPressed: () {
              Navigator.of(context).pop();
              onCancel();
            },
          ),
          TextButton(
            child: Text(confirmText),
            onPressed: () {
              Navigator.of(context).pop();
              onConfirm();
            },
          ),
        ],
      );
    },
  );
}

// showUpdatePopup(
//   BuildContext context, {
//   required String appStoreUrl,
//   required String playStoreUrl,
// }) {
//   showDialog(
//     context: context,
//     barrierDismissible: false,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text("Nova versão disponível"),
//         content: Text(
//             "Atualize o aplicativo para a versão mais recente para continuar."),
//         actions: [
//           TextButton(
//             onPressed: () async => UrlLauncher.launch(
//                 Platform.isAndroid ? playStoreUrl : appStoreUrl),
//             child: Text("Atualizar"),
//           ),
//         ],
//       );
//     },
//   );
// }

showFullScreenLoadingPopup(BuildContext context) {
  // showDialog(
  //   context: context,
  //   barrierDismissible: false,
  //   builder: (BuildContext context) {
  //     return const AlertDialog(
  //       content: Center(
  //         child: CircularProgressIndicator(),
  //       ),
  //     );
  //   },
  // );

  showGeneralDialog(
    context: context,
    barrierDismissible: false,
    barrierLabel: 'Dismiss',
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (context, animation1, animation2) {
      return PopScope(
        canPop: false,
        child: Material(
          color: Colors.transparent,
          child: Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text('Popup Tela Inteira'),
                CircularProgressIndicator.adaptive(),
                // ElevatedButton(
                //   onPressed: () => Navigator.of(context).pop(),
                //   child: Text('Fechar'),
                // ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

showUpdatePopup(
  BuildContext context, {
  required String appStoreUrl,
  required String playStoreUrl,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: const Text("Nova versão disponível",
            style: TextStyle(color: AppColors.primaryAlternative)),
        content: const Text(
            "Atualize o aplicativo para a versão mais recente para continuar.",
            style: TextStyle(color: Colors.white)),
        actions: [
          TextButton(
            onPressed: () async => UrlLauncher.launch(
                Platform.isAndroid ? playStoreUrl : appStoreUrl),
            child: const Text("Atualizar",
                style: TextStyle(color: AppColors.primaryAlternative)),
          ),
        ],
      );
    },
  );
}

showUpdatePopupWeb(
  BuildContext context, {
  required String currentVersion,
  required String newVersion,
  required String url,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        // backgroundColor: AppColors.primaryAlternativeShadow,
        backgroundColor: Colors.white,
        title: const Text("Nova versão disponível",
            style: TextStyle(color: AppColors.primaryAlternative)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Atualize a página para a versão mais recente para continuar.",
              style: TextStyle(color: Colors.white),
            ),
            Text(
              "Versão atual: $currentVersion",
              style: const TextStyle(color: Colors.white),
            ),
            Text(
              "Nova versão: $newVersion",
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              UrlLauncher.refresh(url);
            },
            child: const Text(
              "Atualizar",
              style: TextStyle(color: AppColors.primaryAlternative),
            ),
          ),
        ],
      );
    },
  );
}

showUpdatePopupWebTEMP(
  BuildContext context, {
  required String currentVersion,
  required String newVersion,
  // required String url,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return PopScope(
        canPop: false,
        child: AlertDialog(
          // backgroundColor: AppColors.primaryAlternativeShadow,
          backgroundColor: Colors.white,
          title: const Text(
            "Nova versão disponível",
            style: TextStyle(color: AppColors.primaryAlternative),
            textAlign: TextAlign.center,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Atualize a página para a versão mais recente para continuar.",
                style: TextStyle(),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 8,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: "Versão atual: ",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: currentVersion,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.gray,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 4,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: "Nova Versão: ",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: newVersion,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: AppColors.gray),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              const Text(
                "Limpe o cache do navegador para garantir que a nova versão seja carregada.",
                style: TextStyle(),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: [
            // TextButton(
            //   onPressed: () {
            //     // Navigator.pop(context);
            //     // UrlLauncher.refresh(url);
            //   },
            //   child: const Text(
            //     "Ok",
            //     style: TextStyle(color: AppColors.primaryAlternative),
            //   ),
            // ),
          ],
        ),
      );
    },
  );
}
