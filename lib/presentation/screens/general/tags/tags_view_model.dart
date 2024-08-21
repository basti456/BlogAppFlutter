part of 'tags_imports.dart';

class TagsViewModel {
  final Repository repository;

  TagsViewModel({required this.repository});

  final VelocityBloc<TagsModal> tagsModalBloc =
      VelocityBloc<TagsModal>(TagsModal());

  getAllTags() async {
    var tagsData = await repository.tagsRepo.getAllTags();
    if (tagsData.status == 1) {
      tagsModalBloc.onUpdateData(tagsData);
    }
  }
}
