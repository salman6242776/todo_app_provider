import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkUtil {
  static Future<bool> hasInternetConnection() async {
    return await InternetConnectionChecker().hasConnection;
  }
}
