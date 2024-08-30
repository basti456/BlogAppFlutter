part of 'add_posts_imports.dart';

class AddPosts extends StatefulWidget {
  const AddPosts({super.key});

  @override
  State<AddPosts> createState() => _AddPostsState();
}

class _AddPostsState extends State<AddPosts> {
  late AddPostsViewModel addPostsViewModel;

  @override
  void initState() {
    addPostsViewModel =
        AddPostsViewModel(repository: context.read<Repository>());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Add Posts".text.make(),
        automaticallyImplyLeading: false,
        actions: [
          BlocBuilder<VelocityBloc<bool>, VelocityState<bool>>(
            bloc: addPostsViewModel.isLoadingBloc,
            builder: (context, state) {
              return IconButton(
                onPressed: () {
                  addPostsViewModel.addPost(context);
                },
                icon: state.data
                    ? const CircularProgressIndicator.adaptive(
                        backgroundColor: Colors.white,
                      )
                    : const Icon(FeatherIcons.check),
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          20.h.heightBox,
          BlocBuilder<VelocityBloc<XFile?>, VelocityState<XFile?>>(
            bloc: addPostsViewModel.selectedImageBloc,
            builder: (context, state) {
              return Stack(
                alignment: Alignment.bottomRight,
                children: [
                  state.data == null
                      ? Image.network(
                              "https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png")
                          .cornerRadius(20)
                      : Image.file(
                          File(state.data!.path),
                          height: 250,
                          width: 1.sw,
                          fit: BoxFit.cover,
                        ).cornerRadius(20),
                  IconButton(
                    padding: const EdgeInsets.all(4.0),
                    onPressed: () {
                      addPostsViewModel.showOptions(context);
                    },
                    icon: const Icon(
                      FeatherIcons.camera,
                      color: BlogColors.splashScreenColor,
                    ),
                  ),
                ],
              );
            },
          ),
          14.h.heightBox,
          VxTextField(
            fillColor: Colors.transparent,
            borderColor: BlogColors.splashScreenColor,
            borderRadius: 10,
            borderType: VxTextFieldBorderType.roundLine,
            hint: "Title",
            controller: addPostsViewModel.titleController,
          ),
          20.h.heightBox,
          VxTextField(
            fillColor: Colors.transparent,
            borderColor: BlogColors.splashScreenColor,
            borderRadius: 10,
            borderType: VxTextFieldBorderType.roundLine,
            hint: "Slug",
            controller: addPostsViewModel.slugController,
          ),
          20.h.heightBox,
          BlocBuilder<VelocityBloc<Tag?>, VelocityState<Tag?>>(
            bloc: addPostsViewModel.selectedTagBloc,
            builder: (context, state) {
              return InkWell(
                onTap: () async {
                  var data =
                      await AutoRouter.of(context).push<Tag>(const TagsRoute());
                  addPostsViewModel.selectedTagBloc.onUpdateData(data);
                },
                child: Container(
                  height: 60.h,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      state.data == null
                          ? "Tags".text.make()
                          : state.data!.title!.text.make(),
                      const Icon(FeatherIcons.chevronRight)
                    ],
                  ),
                ),
              );
            },
          ),
          20.h.heightBox,
          BlocBuilder<VelocityBloc<Category?>, VelocityState<Category?>>(
            bloc: addPostsViewModel.selectedCategoryBloc,
            builder: (context, state) {
              return InkWell(
                onTap: () async {
                  var data = await AutoRouter.of(context)
                      .push<Category>(const CategoriesRoute());
                  addPostsViewModel.selectedCategoryBloc.onUpdateData(data);
                },
                child: Container(
                  height: 60.h,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      state.data == null
                          ? "Categories".text.make()
                          : state.data!.title!.text.make(),
                      const Icon(FeatherIcons.chevronRight)
                    ],
                  ),
                ),
              );
            },
          ),
          20.h.heightBox,
          QuillSimpleToolbar(
            configurations: const QuillSimpleToolbarConfigurations(),
            controller: addPostsViewModel._controller,
          ),
          SizedBox(
            height: 500,
            child: QuillEditor.basic(
              controller: addPostsViewModel._controller,
              configurations:
                  const QuillEditorConfigurations(checkBoxReadOnly: false),
            ),
          )
        ],
      ),
    );
  }
}
