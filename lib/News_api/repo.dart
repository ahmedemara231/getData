import 'package:dio/dio.dart';
import 'package:untitled6/News_api/dio.dart';
import 'package:untitled6/News_api/model.dart';

class Repo2
{
  DioHelper2 dioHelper2 = DioHelper2();
  Future<Model2> getNews()async
  {
   Response response = await dioHelper2.getData(
       path: 'top-headlines',
       queryParams:
       {
         'category' : 'business',
         'country' : 'us',
         'apiKey' : '2de62a0b62d746a28ac7b2c6da183104'
       }
   );
   return Model2.fromJson(response.data);
  }
}