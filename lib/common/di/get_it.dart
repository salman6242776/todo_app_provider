import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

var locator = GetIt.instance;

void setupGetIt() {
  locator.registerLazySingleton(() => InternetConnectionChecker());
}
