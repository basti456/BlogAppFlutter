part of 'add_posts_imports.dart';

class AddPosts extends StatefulWidget {
  const AddPosts({super.key});

  @override
  State<AddPosts> createState() => _AddPostsState();
}

class _AddPostsState extends State<AddPosts> {
  final QuillController _controller = QuillController.basic();
  File? _image;
  final picker = ImagePicker();

  //Image Picker function to get image from gallery
  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  //Image Picker function to get image from camera
  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  //Show options to get image from camera or gallery
  Future showOptions() async {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Add Posts".text.make(),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(FeatherIcons.check),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          20.h.heightBox,
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              _image == null
                  ? Image.network(
                      "https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png")
                  : Image.file(_image!),
              IconButton(
                padding: const EdgeInsets.all(4.0),
                onPressed: () {
                  showOptions();
                },
                icon: const Icon(
                  FeatherIcons.camera,
                  color: BlogColors.splashScreenColor,
                ),
              ),
            ],
          ),
          14.h.heightBox,
          const VxTextField(
            fillColor: Colors.transparent,
            borderColor: BlogColors.splashScreenColor,
            borderRadius: 10,
            borderType: VxTextFieldBorderType.roundLine,
            hint: "Title",
          ),
          20.h.heightBox,
          const VxTextField(
            fillColor: Colors.transparent,
            borderColor: BlogColors.splashScreenColor,
            borderRadius: 10,
            borderType: VxTextFieldBorderType.roundLine,
            hint: "Slug",
          ),
          20.h.heightBox,
          Container(
            height: 60.h,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                "Tags".text.make(),
                const Icon(FeatherIcons.chevronRight)
              ],
            ),
          ),
          20.h.heightBox,
          Container(
            height: 60.h,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                "Categories".text.make(),
                const Icon(FeatherIcons.chevronRight)
              ],
            ),
          ),
          20.h.heightBox,
          QuillSimpleToolbar(
            configurations: const QuillSimpleToolbarConfigurations(),
            controller: _controller,
          ),
          SizedBox(
            height: 500,
            child: QuillEditor.basic(
              controller: _controller,
              configurations:
                  const QuillEditorConfigurations(checkBoxReadOnly: false),
            ),
          )
        ],
      ),
    );
  }
}
