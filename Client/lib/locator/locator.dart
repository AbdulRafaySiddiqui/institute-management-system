import 'package:Client/service/api/BatchApi.dart';
import 'package:Client/service/api/BatchFeeType.dart';
import 'package:Client/service/api/BranchApi.dart';
import 'package:Client/service/api/ClassApi.dart';
import 'package:Client/service/api/CourseApi.dart';
import 'package:Client/service/api/FeeTypeApi.dart';
import 'package:Client/service/api/FieldApi.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => BranchApi());
  locator.registerLazySingleton(() => ClassApi());
  locator.registerLazySingleton(() => BatchApi());
  locator.registerLazySingleton(() => CourseApi());
  locator.registerLazySingleton(() => FeeTypeApi());
  locator.registerLazySingleton(() => BatchFeeTypeApi());
  locator.registerLazySingleton(() => FieldApi());
}

int get currentBranchId => 30;
