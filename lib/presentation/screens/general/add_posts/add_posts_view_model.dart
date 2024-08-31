part of 'add_posts_imports.dart';

class AddPostsViewModel {
  final Repository repository;
  AddPostsViewModel({required this.repository});

  final picker = ImagePicker();
  final QuillController _controller = QuillController.basic();
  final VelocityBloc<XFile?> selectedImageBloc = VelocityBloc<XFile?>(null);
  final TextEditingController titleController = TextEditingController();
  final TextEditingController slugController = TextEditingController();

  final VelocityBloc<Tag?> selectedTagBloc = VelocityBloc<Tag?>(null);
  final VelocityBloc<Category?> selectedCategoryBloc =
      VelocityBloc<Category?>(null);

  final VelocityBloc<bool> isLoadingBloc = VelocityBloc<bool>(false);

  //Image Picker function to get image from gallery
  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedImageBloc.onUpdateData(pickedFile);
    }
  }

  //Image Picker function to get image from camera
  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      selectedImageBloc.onUpdateData(pickedFile);
    }
  }

  clear() {
    selectedImageBloc.onUpdateData(null);
    titleController.clear();
    slugController.clear();
    selectedCategoryBloc.onUpdateData(null);
    selectedTagBloc.onUpdateData(null);
    _controller.clear();
  }

  addPost(context) async {
    isLoadingBloc.onUpdateData(true);
    var addPostData = await repository.postRepo.addPosts(
      titleController.text,
      slugController.text,
      selectedCategoryBloc.state.data!.id!.toString(),
      selectedTagBloc.state.data!.id!.toString(),
      _controller.document.toPlainText(),
      "1",
      selectedImageBloc.state.data!.path,
      selectedImageBloc.state.data!.path.split('/').last,
      "1",
    );
    if (addPostData.status == 1) {
      VxToast.show(context, msg: addPostData.message.toString());
      clear();
    }
    isLoadingBloc.onUpdateData(false);
  }

  //Show options to get image from camera or gallery
  showOptions(context) async {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            child: const Text('Photo Gallery'),
            onPressed: () {
              // close the options modal
              Navigator.of(context).pop();
              // get image from gallery
              getImageFromGallery();
            },
          ),
          CupertinoActionSheetAction(
            child: const Text('Camera'),
            onPressed: () {
              // close the options modal
              Navigator.of(context).pop();
              // get image from camera
              getImageFromCamera();
            },
          ),
        ],
      ),
    );
  }
}
