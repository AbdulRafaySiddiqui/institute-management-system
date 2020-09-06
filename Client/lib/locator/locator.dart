import 'package:Client/service/api/BatchApi.dart';
import 'package:Client/service/api/BranchApi.dart';
import 'package:Client/service/api/ClassApi.dart';
import 'package:Client/service/api/CourseApi.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => BranchApi());
  locator.registerLazySingleton(() => ClassApi());
  locator.registerLazySingleton(() => BatchApi());
  locator.registerLazySingleton(() => CourseApi());
}

int get currentBranchId => 30;
