part of 'tags_imports.dart';

@RoutePage<Tag>()
class Tags extends StatefulWidget {
  const Tags({super.key, required this.navigateType});

  final NavigateType navigateType;

  @override
  State<Tags> createState() => _TagsState();
}

class _TagsState extends State<Tags> {
  late TagsViewModel tagsViewModel;

  @override
  void initState() {
    tagsViewModel = TagsViewModel(repository: context.read<Repository>());
    tagsViewModel.getAllTags();
    super.initState();
  }

  @override
  void dispose() {
    tagsViewModel.titleController.dispose();
    tagsViewModel.slugController.dispose();
    super.dispose();
  }

  void _openDialog(
    BuildContext context,
    String dialogTitle,
    String id,
    bool isUpdate,
    String title,
    String slug,
  ) {
    tagsViewModel.titleController.text = title;
    tagsViewModel.slugController.text = slug;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(dialogTitle),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: tagsViewModel.titleController,
                  decoration:
                      const InputDecoration(hintText: "Enter title here"),
                ),
                TextField(
                  controller: tagsViewModel.slugController,
                  decoration:
                      const InputDecoration(hintText: "Enter slug here"),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            BlocBuilder<VelocityBloc<bool>, VelocityState<bool>>(
              bloc: tagsViewModel.addUpdateModalBloc,
              builder: (context, state) {
                return TextButton(
                  child: state.data
                      ? const CircularProgressIndicator.adaptive()
                      : const Text('OK'),
                  onPressed: () {
                    if (isUpdate) {
                      tagsViewModel.updateTags(context, id);
                    } else {
                      tagsViewModel.addTags(context);
                    }
                  },
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Tags".text.size(16).color(Colors.white).makeCentered(),
        automaticallyImplyLeading: widget.navigateType == NavigateType.outer,
        backgroundColor: BlogColors.splashScreenColor,
        actions: [
          IconButton(
            onPressed: () {
              _openDialog(context, "Add New Tag", "0", false, "", "");
            },
            icon: const Icon(
              FeatherIcons.plus,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: BlocBuilder<VelocityBloc<TagsModal>, VelocityState<TagsModal>>(
        bloc: tagsViewModel.tagsModalBloc,
        builder: (context, state) {
          if (state is VelocityInitialState) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is VelocityUpdateState) {
            return ListView.separated(
                itemBuilder: (context, index) {
                  var tagData = state.data.tags![index];
                  return Card(
                    child: ListTile(
                      leading: "${index + 1}".text.size(16.sp).make(),
                      title: "${tagData.title}".text.size(16.sp).make(),
                      trailing: SizedBox(
                        width: 100.w,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                _openDialog(
                                    context,
                                    "Edit Tag",
                                    tagData.id!.toString(),
                                    true,
                                    tagData.title!.toString(),
                                    tagData.slug!.toString());
                              },
                              icon: const Icon(
                                FeatherIcons.edit2,
                                color: Colors.green,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                FeatherIcons.trash,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        widget.navigateType == NavigateType.inner
                            ? AutoRouter.of(context).maybePop<Tag>(tagData)
                            : null;
                      },
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                      height: 10.h,
                    ),
                itemCount: state.data.tagsCount!);
          }
          return const SizedBox();
        },
      ),
    );
  }
}
