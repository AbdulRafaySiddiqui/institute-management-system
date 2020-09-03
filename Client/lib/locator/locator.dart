import 'package:Client/service/NavigationService/NavigationService.dart';
import 'package:Client/service/api/BranchApi.dart';
import 'package:Client/service/api/ClassApi.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => BranchApi());
  locator.registerLazySingleton(() => ClassApi());
}
