import 'dart:convert';

import 'package:blog_app/presentation/screens/general/profile/profile_model.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../presentation/screens/general/home/home_model.dart';
import '../data_sources/remote/api_client.dart';
import '../data_sources/remote/api_endpoint_urls.dart';

class PostRepo extends ApiClient {
  PostRepo();

  Future<HomeModal> getAllPosts() async {
    try {
      final response = await getRequest(path: ApiEndpointUrls.posts);
      if (response.statusCode == 200) {
        return homeModalFromJson(jsonEncode(response.data));
      }
      return HomeModal();
    } on Exception catch (e) {
      Vx.log(e);
      return HomeModal();
    }
  }

  Future<ProfileModal> getUserPosts() async {
    try {
      final response = await getRequest(path: ApiEndpointUrls.userPosts,isTokenRequired: true);
      if (response.statusCode == 200) {
        return profileModalFromJson(jsonEncode(response.data));
      }
      return ProfileModal();
    } on Exception catch (e) {
      Vx.log(e);
      return ProfileModal();
    }
  }
}
