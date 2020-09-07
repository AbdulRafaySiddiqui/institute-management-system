import 'package:Client/models/Class/ClassModel.dart';
import 'package:Client/service/api/BaseApi.dart';

class ClassApi extends BaseApi<ClassModel> {
  ClassApi() : super('classes');

  @override
  fromJson(Map<String, dynamic> map) => ClassModel.fromJson(map);
}
