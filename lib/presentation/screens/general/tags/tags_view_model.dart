part of 'tags_imports.dart';

class TagsViewModel {
  final Repository repository;

  TagsViewModel({required this.repository});

  final VelocityBloc<TagsModal> tagsModalBloc =
      VelocityBloc<TagsModal>(TagsModal());

  final VelocityBloc<bool> addUpdateModalBloc = VelocityBloc<bool>(false);

  final TextEditingController titleController = TextEditingController();
  final TextEditingController slugController = TextEditingController();

  getAllTags() async {
    var tagsData = await repository.tagsRepo.getAllTags();
    if (tagsData.status == 1) {
      tagsModalBloc.onUpdateData(tagsData);
    }
  }

  addTags(context) async {
    addUpdateModalBloc.onUpdateData(true);
    var addTagsData = await repository.tagsRepo.addTags(titleController.text, slugController.text);
    if (addTagsData.status == 1) {
      VxToast.show(context, msg: addTagsData.message.toString());
      await getAllTags();
      Navigator.of(context).pop();
    }
    addUpdateModalBloc.onUpdateData(false);
  }

  updateTags(context, String id) async {
    addUpdateModalBloc.onUpdateData(true);
    var updateTagsData = await repository.tagsRepo.updateTags(id, titleController.text, slugController.text);
    if (updateTagsData.status == 1) {
      VxToast.show(context, msg: updateTagsData.message.toString());
      await getAllTags();
      Navigator.of(context).pop();
    }
    addUpdateModalBloc.onUpdateData(false);
  }
}
