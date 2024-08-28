import 'dart:convert';
import 'package:blog_app/data/modals/add_update_model.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../presentation/screens/general/tags/tags_model.dart';
import '../data_sources/remote/api_client.dart';
import '../data_sources/remote/api_endpoint_urls.dart';

class TagsRepo extends ApiClient {
  TagsRepo();

  Future<TagsModal> getAllTags() async {
    try {
      final response = await getRequest(path: ApiEndpointUrls.tags);
      if (response.statusCode == 200) {
        return tagsModalFromJson(jsonEncode(response.data));
      }
      return TagsModal();
    } on Exception catch (e) {
      Vx.log(e);
      return TagsModal();
    }
  }

  Future<AddUpdateModal> addTags(String title, String slug) async {
    Map body = {"title": title, "slug": slug};
    try {
      final response = await postRequest(
          path: ApiEndpointUrls.addTags, isTokenRequired: true, body: body);
      if (response.statusCode == 200) {
        return addUpdateModalFromJson(jsonEncode(response.data));
      }
      return AddUpdateModal();
    } on Exception catch (e) {
      Vx.log(e);
      return AddUpdateModal();
    }
  }

  Future<AddUpdateModal> updateTags(
      String id, String title, String slug) async {
    Map body = {"id": id, "title": title, "slug": slug};
    try {
      final response = await postRequest(
          path: ApiEndpointUrls.updateTags, isTokenRequired: true, body: body);
      if (response.statusCode == 200) {
        return addUpdateModalFromJson(jsonEncode(response.data));
      }
      return AddUpdateModal();
    } on Exception catch (e) {
      Vx.log(e);
      return AddUpdateModal();
    }
  }

  Future<AddUpdateModal> deleteTags(String id) async {
    try {
      final response = await postRequest(
          path: "${ApiEndpointUrls.deleteTags}/$id", isTokenRequired: true);
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
