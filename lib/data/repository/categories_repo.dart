import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';
import '../../presentation/screens/general/categories/categories_model.dart';
import '../data_sources/remote/api_client.dart';
import '../data_sources/remote/api_endpoint_urls.dart';
import '../modals/categories_add_update_model.dart';

class CategoriesRepo extends ApiClient {
  CategoriesRepo();

  Future<CategoriesModal> getAllCategories() async {
    try {
      final response = await getRequest(path: ApiEndpointUrls.categories);
      if (response.statusCode == 200) {
        return categoriesModalFromJson(jsonEncode(response.data));
      }
      return CategoriesModal();
    } on Exception catch (e) {
      Vx.log(e);
      return CategoriesModal();
    }
  }

  Future<CategoryAddUpdateModal> updateCategories(
      String id, String title, String slug) async {
    Map body = {"id": id, "title": title, "slug": slug};
    try {
      final response = await postRequest(
        path: ApiEndpointUrls.updateCategories,
        isTokenRequired: true,
        body: body,
      );
      if (response.statusCode == 200) {
        return categoryAddUpdateModalFromJson(jsonEncode(response.data));
      }
      return CategoryAddUpdateModal();
    } on Exception catch (e) {
      Vx.log(e);
      return CategoryAddUpdateModal();
    }
  }

  Future<CategoryAddUpdateModal> addCategories(
      String title, String slug) async {
    Map body = {"title": title, "slug": slug};
    try {
      final response = await postRequest(
        path: ApiEndpointUrls.addCategories,
        isTokenRequired: true,
        body: body,
      );
      if (response.statusCode == 200) {
        return categoryAddUpdateModalFromJson(jsonEncode(response.data));
      }
      return CategoryAddUpdateModal();
    } on Exception catch (e) {
      Vx.log(e);
      return CategoryAddUpdateModal();
    }
  }

  Future<CategoryAddUpdateModal> deleteCategories(String id) async {
    try {
      final response = await postRequest(
        path: "${ApiEndpointUrls.addCategories}/$id",
        isTokenRequired: true,
      );
      if (response.statusCode == 200) {
        return categoryAddUpdateModalFromJson(jsonEncode(response.data));
      }
      return CategoryAddUpdateModal();
    } on Exception catch (e) {
      Vx.log(e);
      return CategoryAddUpdateModal();
    }
  }
}
