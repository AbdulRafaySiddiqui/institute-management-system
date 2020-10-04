import 'package:Client/models/Student/StudentModel.dart';
import 'package:Client/service/api/BaseApi.dart';

class StudentApi extends BaseApi<StudentModel> {
  StudentApi() : super('students', useFilteredFetchOnly: true);

  @override
  fromJson(Map<String, dynamic> map) => StudentModel.fromJson(map);
}
