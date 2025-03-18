import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  // Método para lançar uma URL em um aplicativo externo
  static Future<void> launch(String url) async {
    final Uri uri = Uri.parse(url);

    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
      webViewConfiguration: const WebViewConfiguration(
        enableDomStorage: true,
        enableJavaScript: true,
      ),
    )) {
      throw 'Could not launch $url';
    }
  }

  // Método para recarregar a página atual dentro da WebView
  static Future<void> refresh(String url) async {
    final Uri uri = Uri.parse(url);

    // Tenta abrir a URL na WebView atual
    if (!await launchUrl(
      uri,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(
        enableDomStorage: true,
        enableJavaScript: true,
      ),
    )) {
      throw 'Could not refresh $url';
    }
  }
  
  // Método para recarregar a página atual, sem necessidade de passar a URL
  static Future<void> reloadCurrentPage() async {
    // Aqui você poderia usar outro método de controle da WebView, dependendo da sua biblioteca (como webview_flutter)
    // Para simular o comportamento de recarregar sem depender da URL externa, é necessário uma WebViewController ou algo similar.
    // No caso do `url_launcher`, não temos um método nativo para recarregar diretamente.

    throw 'Reload functionality not available in url_launcher. Consider using webview_flutter or similar package.';
  }
}
