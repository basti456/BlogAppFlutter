part of 'categories_imports.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  late CategoriesViewModel categoriesViewModel;

  @override
  void initState() {
    categoriesViewModel =
        CategoriesViewModel(repository: context.read<Repository>());
    categoriesViewModel.getAllCategories();
    super.initState();
  }

  void _openDialog(
    BuildContext context,
    String dialogTitle,
    String id,
    bool isUpdate,
    String title,
    String slug,
  ) {
    categoriesViewModel.titleController.text = title;
    categoriesViewModel.slugController.text = slug;
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
                  controller: categoriesViewModel.titleController,
                  decoration:
                      const InputDecoration(hintText: "Enter title here"),
                ),
                TextField(
                  controller: categoriesViewModel.slugController,
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
              bloc: categoriesViewModel.isLoadingBloc,
              builder: (context, state) {
                return TextButton(
                  child: state.data
                      ? const CircularProgressIndicator.adaptive()
                      : const Text('OK'),
                  onPressed: () {
                    if (isUpdate) {
                      categoriesViewModel.updateCategories(context, id);
                    } else {
                      categoriesViewModel.addCategories(context);
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
        title: "Categories".text.size(16).color(Colors.white).makeCentered(),
        automaticallyImplyLeading: false,
        backgroundColor: BlogColors.splashScreenColor,
        actions: [
          IconButton(
            onPressed: () {
              _openDialog(context, "Add New Category", "0", false, "", "");
            },
            icon: const Icon(
              FeatherIcons.plus,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: BlocBuilder<VelocityBloc<CategoriesModal>,
          VelocityState<CategoriesModal>>(
        bloc: categoriesViewModel.categoriesModalBloc,
        builder: (context, state) {
          if (state is VelocityInitialState) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is VelocityUpdateState) {
            return ListView.separated(
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: "${index + 1}".text.size(16.sp).make(),
                    title: state.data.categories![index].title!.text
                        .size(16.sp)
                        .make(),
                    trailing: SizedBox(
                      width: 100.w,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              _openDialog(
                                context,
                                "Update Category",
                                state.data.categories![index].id!.toString(),
                                true,
                                state.data.categories![index].title!,
                                state.data.categories![index].slug!,
                              );
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
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(
                height: 10.h,
              ),
              itemCount: state.data.categoriesCount!,
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
