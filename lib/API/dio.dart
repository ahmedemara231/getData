import 'package:dio/dio.dart';

class DioHelper
{
  late Dio dio;
  DioHelper()
  {
    dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        baseUrl: 'https://rickandmortyapi.com/api/',
      ),
    );
  }


  Future<Response> getData({required String path})async
  {
    Response response = await dio.get(path);
    return response;
  }


}

