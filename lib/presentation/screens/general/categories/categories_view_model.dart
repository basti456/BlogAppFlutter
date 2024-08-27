part of 'categories_imports.dart';

class CategoriesViewModel {
  final Repository repository;

  CategoriesViewModel({required this.repository});

  final VelocityBloc<CategoriesModal> categoriesModalBloc =
      VelocityBloc<CategoriesModal>(CategoriesModal());

  final VelocityBloc<bool> isLoadingBloc = VelocityBloc<bool>(false);

  final TextEditingController titleController = TextEditingController();
  final TextEditingController slugController = TextEditingController();
  getAllCategories() async {
    var categoriesData = await repository.categoriesRepo.getAllCategories();
    if (categoriesData.status == 1) {
      categoriesModalBloc.onUpdateData(categoriesData);
    }
  }

  updateCategories(context, String id) async {
    isLoadingBloc.onUpdateData(true);
    var updateData = await repository.categoriesRepo
        .updateCategories(id, titleController.text, slugController.text);
    if (updateData.status == 1) {
      VxToast.show(context, msg: updateData.message.toString());
      getAllCategories();
      Navigator.of(context).pop();
    }
    isLoadingBloc.onUpdateData(false);
  }

  addCategories(context) async {
    isLoadingBloc.onUpdateData(true);
    var addedData = await repository.categoriesRepo
        .addCategories(titleController.text, slugController.text);
    if (addedData.status == 1) {
      VxToast.show(context, msg: addedData.message.toString());
      getAllCategories();
      Navigator.of(context).pop();
    }
    isLoadingBloc.onUpdateData(false);
  }
}
