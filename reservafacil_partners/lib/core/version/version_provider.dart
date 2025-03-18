import 'package:package_info_plus/package_info_plus.dart';

class VersionProvider {
  bool isDev = false;

  Future<String> getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    // Logger.log('PackageInfo: ${packageInfo.version}');
    // Logger.log('ProductionVersion: ${provider.settingsModel.productionVersion}');
    // Logger.log('DevVersion: ${provider.settingsModel.devVersion}');

    final version = isDev
        ? "${packageInfo.version}b${packageInfo.buildNumber} - Dev"
        : "${packageInfo.version}b${packageInfo.buildNumber}";
    return version;
    // final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    // return packageInfo.version;
  }
}
