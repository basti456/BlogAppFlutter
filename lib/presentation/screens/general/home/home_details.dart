part of 'home_imports.dart';

@RoutePage()
class HomeDetails extends StatelessWidget {
  const HomeDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Netflix will charge money for password sharings"
            .text
            .size(16.sp)
            .ellipsis
            .make(),
      ),
      body: ListView(
        children: [
          Image.asset(BlogAssets.onboarding3),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              children: [
                10.h.heightBox,
                "Netflix will charge money for password sharings"
                    .text
                    .bold
                    .xl2
                    .make(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(FeatherIcons.eye),
                    8.w.widthBox,
                    "147 views".text.make(),
                    const Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          FeatherIcons.thumbsUp,
                          color: Colors.green,
                        )),
                    "0".text.make(),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          FeatherIcons.thumbsDown,
                          color: Colors.red,
                        )),
                    "0".text.make(),
                  ],
                ),
                "Officia excepteur culpa tempor in sit et tempor qui velit ex consequat ad laborum. Sint do Lorem dolor cillum cupidatat. Ea eiusmod laboris pariatur qui in quis Lorem incididunt incididunt velit proident id. Non sint est duis in cupidatat veniam eiusmod dolore consectetur adipisicing veniam tempor qui in."
                    .text
                    .make()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
