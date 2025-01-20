import 'package:flutter/material.dart';
import 'package:reservafacil_app/common/constants/app_colors.dart';
import 'package:reservafacil_app/common/constants/app_text_styles.dart';

void showErrorPopup(
  BuildContext context, {
  required String message,
  String title = 'Error',
  String buttonText = 'OK',
  Function()? onPressed,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          title,
          style: AppTextStyles.subtitle,
        ),
        content: Text(
          message,
          textAlign: TextAlign.center,
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
        title: Text(title),
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
        title: Text(title),
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
    transitionDuration: Duration(milliseconds: 300),
    pageBuilder: (context, animation1, animation2) {
      return PopScope(
        canPop: false,
        child: Material(
          color: Colors.transparent,
          child: Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text('Popup Tela Inteira'),
                const CircularProgressIndicator.adaptive(),
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
