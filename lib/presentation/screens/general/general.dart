part of 'general_imports.dart';

@RoutePage()
class General extends StatefulWidget {
  const General({super.key});

  @override
  State<General> createState() => _GeneralState();
}

class _GeneralState extends State<General> {
  List<TabItem> items = [
    const TabItem(
      icon: FeatherIcons.home,
    ),
    const TabItem(
      icon: FeatherIcons.tag,
    ),
    const TabItem(
      icon: FeatherIcons.plus,
    ),
    const TabItem(
      icon: FeatherIcons.hash,
    ),
    const TabItem(
      icon: FeatherIcons.user,
    ),
  ];

  List<Widget> pages = [
    const Home(),
    const Categories(
      navigateType: NavigateType.outer,
    ),
    const AddPosts(),
    const Tags(
      navigateType: NavigateType.outer,
    ),
    const Profile(),
  ];
  var visit = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[visit],
      bottomNavigationBar: BottomBarCreative(
        items: items,
        backgroundColor: Colors.white,
        color: BlogColors.splashScreenColor.withOpacity(0.4),
        colorSelected: BlogColors.splashScreenColor,
        indexSelected: visit,
        onTap: (int index) => setState(() {
          visit = index;
        }),
      ),
    );
  }
}
