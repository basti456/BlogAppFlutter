import 'package:blog_app/presentation/screens/general/tags/tags_model.dart';
import 'package:velocity_x/velocity_x.dart';

import '../data_sources/remote/api_client.dart';
import '../data_sources/remote/api_endpoint_urls.dart';

class TagsRepo extends ApiClient {
  TagsRepo();

  Future<TagsModal> getAllTags() async {
    try {
      final response = await getRequest(path: ApiEndpointUrls.tags);
      if (response.statusCode == 200) {
        Vx.log(response.data);
        return tagsModalFromJson(response.data);
      }
      return TagsModal();
    } on Exception catch (e) {
      Vx.log(e);
      return TagsModal();
    }
  }
}
