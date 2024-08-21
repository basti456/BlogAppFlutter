part of 'tags_imports.dart';

class Tags extends StatefulWidget {
  const Tags({super.key});

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Tags".text.size(16).color(Colors.white).makeCentered(),
        automaticallyImplyLeading: false,
        backgroundColor: BlogColors.splashScreenColor,
        actions: [
          IconButton(
            onPressed: () {},
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
            return const Center(child: CircularProgressIndicator.adaptive(),);
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
                              onPressed: () {},
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
                itemCount: state.data.tagsCount!);
          }
          return const SizedBox();
        },
      ),
    );
  }
}
