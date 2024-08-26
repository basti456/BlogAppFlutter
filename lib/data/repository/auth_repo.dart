import 'dart:convert';

import 'package:blog_app/data/modals/message_model.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../presentation/screens/auth/login/login_model.dart';
import '../../presentation/screens/auth/register/register_model.dart';
import '../data_sources/remote/api_client.dart';
import '../data_sources/remote/api_endpoint_urls.dart';

class AuthRepo extends ApiClient {
  AuthRepo();

  Future<LoginModal> userLogin(String email, String password, context) async {
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

  Future<MessageModal> userLogout(context) async {
    try {
      final response = await postRequest(path: ApiEndpointUrls.logout);
      if (response.statusCode == 200) {
        return messageModalFromJson(jsonEncode(response.data));
      }
      return MessageModal();
    } on Exception catch (e) {
      VxToast.show(context, msg: e.toString());
      return MessageModal();
    }
  }

  Future<RegisterModal> userRegister(
      String name, String email, String password, context) async {
    Map body = {"name": name, "email": email, "password": password};
    try {
      final response =
          await postRequest(path: ApiEndpointUrls.register, body: body);
      if (response.statusCode == 200) {
        return registerModalFromJson(jsonEncode(response.data));
      }
      return RegisterModal();
    } on Exception catch (e) {
      VxToast.show(context, msg: e.toString());
      return RegisterModal();
    }
  }
}
