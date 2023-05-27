import 'package:dio/dio.dart';

class DioHelper2
{
  late Dio dio;
  DioHelper2()
  {
    dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        baseUrl: 'https://newsapi.org/v2/',
      ),
    );
  }


  Future<Response> getData({
    required String path,
    required Map<String ,dynamic> queryParams
  })async
  {
    Response response = await dio.get(path,queryParameters: queryParams);
    return response;
  }


}