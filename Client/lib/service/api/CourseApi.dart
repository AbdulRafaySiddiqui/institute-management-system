import 'package:Client/models/CourseModel.dart';
import 'package:Client/service/api/BaseApi.dart';

class CourseApi extends BaseApi<CourseModel> {
  CourseApi() : super('courses');

  @override
  fromJson(Map<String, dynamic> map) => CourseModel.fromJson(map);
}
