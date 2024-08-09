part of 'add_posts_imports.dart';

class AddPosts extends StatefulWidget {
  const AddPosts({super.key});

  @override
  State<AddPosts> createState() => _AddPostsState();
}

class _AddPostsState extends State<AddPosts> {
  QuillController _controller = QuillController.basic();
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
              Image.network(
                  "https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png"),
              IconButton(
                padding: const EdgeInsets.all(4.0),
                onPressed: () {},
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
          QuillToolbar(child: child)
        ],
      ),
    );
  }
}
