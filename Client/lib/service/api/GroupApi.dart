import 'package:Client/models/Student/GroupModel.dart';
import 'package:Client/service/api/BaseApi.dart';

class GroupApi extends BaseApi<GroupModel> {
  GroupApi() : super('groups');

  @override
  fromJson(Map<String, dynamic> map) => GroupModel.fromJson(map);
}
