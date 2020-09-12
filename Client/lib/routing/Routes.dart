import 'package:Client/views/pages/BatchFeeTypeView.dart';
import 'package:Client/views/pages/BatchView.dart';
import 'package:Client/views/pages/BranchView.dart';
import 'package:Client/views/pages/ClassView.dart';
import 'package:Client/views/pages/CourseView.dart';
import 'package:Client/views/pages/FeeTypeView.dart';
import 'package:Client/views/pages/FieldView.dart';
import 'package:get/get.dart';

class Routes {
  static String get dashboardRoute => '/dashboard';
  static String get branchRoute => '/branch';
  static String get classRoute => '/class';
  static String get batchRoute => '/batch';
  static String get courseRoute => '/course';
  static String get feeTypeRoute => '/fee_type';
  static String get batchFeeTypeRoute => '/batch_fee_type';
  static String get fieldRoute => '/custom_fields';

  static final _transition = Transition.cupertino;
  static List<GetPage> get pages => [
        GetPage(
          name: branchRoute,
          page: () => BranchView(),
          transition: _transition,
        ),
        GetPage(
          name: classRoute,
          page: () => ClassView(),
          transition: _transition,
        ),
        GetPage(
          name: batchRoute,
          page: () => BatchView(),
          transition: _transition,
        ),
        GetPage(
          name: courseRoute,
          page: () => CourseView(),
          transition: _transition,
        ),
        GetPage(
          name: feeTypeRoute,
          page: () => FeeTypeView(),
          transition: _transition,
        ),
        GetPage(
          name: batchFeeTypeRoute,
          page: () => BatchFeeTypeView(),
          transition: _transition,
        ),
        GetPage(
          name: fieldRoute,
          page: () => FieldView(),
          transition: _transition,
        ),
      ];
}
