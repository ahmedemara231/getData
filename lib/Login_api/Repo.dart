import 'package:dio/dio.dart';
import 'package:untitled6/Login_api/dio.dart';
import 'package:untitled6/Login_api/loginModel.dart';

class Repository
{
  DioServices dioServices = DioServices();
  Future<LoginModel> login({
    required String email,
    required String password
  })async
  {
    Response response = await dioServices.postData(
      path: 'login',
      data:
      {
        'email' : email,
        'password' : password,
      },
    );
    return LoginModel.fromJson(response.data);
  }
}