import 'package:package_info/package_info.dart';

Future<String> getAppName() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();

  return packageInfo.appName;
}

Future<String> getPackageName() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();

  return packageInfo.packageName;
}

Future<String> getVersion() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();

  return packageInfo.version;
}

Future<String> getBuildNumber() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();

  return packageInfo.buildNumber;
}