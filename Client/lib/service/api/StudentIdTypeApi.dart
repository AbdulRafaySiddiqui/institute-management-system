import 'package:Client/models/Student/StudentIdTypeModel.dart';
import 'package:Client/service/api/BaseApi.dart';

class StudentIdTypeApi extends BaseApi<StudentIdTypeModel> {
  StudentIdTypeApi() : super('studentIdTypes', useFilteredFetchOnly: true);

  @override
  fromJson(Map<String, dynamic> map) => StudentIdTypeModel.fromJson(map);
}
