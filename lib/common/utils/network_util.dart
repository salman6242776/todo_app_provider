import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:to_do_app/common/di/get_it.dart';

class NetworkUtil {
  static Future<bool> hasInternetConnection() async {
    return await locator.get<InternetConnectionChecker>().hasConnection;
  }
}
