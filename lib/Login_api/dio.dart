import 'package:dio/dio.dart';

class DioServices
{
  late Dio dio;
  DioServices()
  {
    dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        baseUrl: 'https://student.valuxapps.com/api/',
      ),
    );
  }


  Future<Response> postData({
    required String path,
    required Map<String,dynamic>data
  })async
  {
    Response response = await dio.post(
        path,
        data: data,
    );
    return response;
  }


}

