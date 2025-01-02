import 'package:flutter/material.dart';

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
