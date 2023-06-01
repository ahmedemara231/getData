class LoginModel
{
  bool status;
  String message;
  Map<String, dynamic> data;

  LoginModel({
    required this.status,
    required this.message,
    required this.data
  });
  factory LoginModel.fromJson(Map<String , dynamic> jsonData)
  {
    return LoginModel(
        status: jsonData['status'],
        message: jsonData['message'],
        data: jsonData['data'],
    );
  }

}