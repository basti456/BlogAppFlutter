part of 'categories_imports.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Categories".text.size(16).color(Colors.white).makeCentered(),
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
      body: ListView.separated(
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: "${index + 1}".text.size(16.sp).make(),
                title: "Enter".text.size(16.sp).make(),
                trailing: SizedBox(
                  width: 100.w,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(FeatherIcons.edit2,color: Colors.green,),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(FeatherIcons.trash,color: Colors.red,),
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
          itemCount: 10),
    );
  }
}
