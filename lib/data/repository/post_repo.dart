import 'dart:convert';

import 'package:blog_app/data/modals/add_update_model.dart';
import 'package:blog_app/presentation/screens/general/profile/profile_model.dart';
import 'package:dio/dio.dart';
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
      final response = await getRequest(
          path: ApiEndpointUrls.userPosts, isTokenRequired: true);
      if (response.statusCode == 200) {
        return profileModalFromJson(jsonEncode(response.data));
      }
      return ProfileModal();
    } on Exception catch (e) {
      Vx.log(e);
      return ProfileModal();
    }
  }

  Future<AddUpdateModal> addPosts(
    String title,
    String slug,
    String categories,
    String tags,
    String body,
    String status,
    String filePath,
    String filename,
    String user_id,
  ) async {
    final formData = FormData.fromMap({
      "title": title,
      "slug": slug,
      "categories": categories,
      "tags": tags,
      "body": body,
      "status": "1",
      "user_id": user_id,
      'featuredimage':
          await MultipartFile.fromFile(filePath, filename: filename),
    });
    try {
      final response = await postRequest(
        path: ApiEndpointUrls.addPosts,
        isTokenRequired: true,
        body: formData,
      );
      if (response.statusCode == 200) {
        return addUpdateModalFromJson(jsonEncode(response.data));
      }
      return AddUpdateModal();
    } on Exception catch (e) {
      Vx.log(e);
      return AddUpdateModal();
    }
  }
}
