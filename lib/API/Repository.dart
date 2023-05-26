import 'package:dio/dio.dart';
import 'package:untitled6/API/Model.dart';
import 'package:untitled6/API/dio.dart';

class Repo
{
  DioHelper dioHelper = DioHelper();

  Future<Model> getCharacterData()async
  {
    Response response = await dioHelper.getData(path: 'character');
    return Model.fromJson(response.data);
  }

  Future<Model> getLocationData()async
  {
    Response response = await dioHelper.getData(path: 'location');
    return Model.fromJson(response.data);
  }

}