import 'package:massaclinic/core/class/diohelper.dart';

class LoginData {
  DioHelper crud;
  LoginData(this.crud);

  postData(String email, String password) async {
    var response = await crud.postData(
      url: '/api/login-user',
      data: {
        'email': email,
        'password': password,
      },
    );

    return response?.data;
  }
}
