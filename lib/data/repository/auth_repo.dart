import 'dart:convert';

import 'package:velocity_x/velocity_x.dart';

import '../../presentation/screens/auth/login/login_model.dart';
import '../data_sources/remote/api_client.dart';
import '../data_sources/remote/api_endpoint_urls.dart';

class AuthRepo extends ApiClient {
  AuthRepo();

  Future<LoginModal> userLogin(String email, String password,context) async {
    Map body = {"email": email, "password": password};
    try {
      final response =
          await postRequest(path: ApiEndpointUrls.login, body: body);
      if (response.statusCode == 200) {
        return loginModalFromJson(jsonEncode(response.data));
      }
      return LoginModal();
    } on Exception catch (e) {
      VxToast.show(context, msg: e.toString());
      return LoginModal();
    }
  }
}
