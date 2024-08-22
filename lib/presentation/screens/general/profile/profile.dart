part of 'profile_imports.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late ProfileViewModel profileViewModel;

  @override
  void initState() {
    profileViewModel = ProfileViewModel(repository: context.read<Repository>());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              profileViewModel.logout(context);
            },
            icon: const Icon(FeatherIcons.logOut).pOnly(right: 10.w),
          )
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: 400.h,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: BlogColors.splashScreenColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage(BlogAssets.onboarding3),
                    radius: 70,
                  ),
                  10.h.heightBox,
                  "Ekagra Agrawal".text.bold.white.xl2.make(),
                  "akagraagarwal89@gmail.com".text.bold.xl.white.make(),
                  20.h.heightBox,
                  "Android Developer".text.xl.center.white.make(),
                  15.h.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          "6".text.bold.xl3.white.make(),
                          "Posts".text.bold.xl.white.make(),
                        ],
                      ),
                      Column(
                        children: [
                          "0".text.bold.xl3.white.make(),
                          "Following".text.bold.xl.white.make(),
                        ],
                      ),
                      Column(
                        children: [
                          "0".text.bold.xl3.white.make(),
                          "Followers".text.bold.xl.white.make(),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          20.h.heightBox,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                "My Posts".text.xl3.bold.make(),
                GridView.builder(
                  itemCount: 4,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 13,
                      childAspectRatio: 0.9),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Image.asset(BlogAssets.onboarding3).cornerRadius(10),
                        6.h.heightBox,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "Netflix will charge money for password sharing"
                                .text
                                .medium
                                .maxLines(2)
                                .make()
                                .expand(),
                            const Icon(FeatherIcons.moreVertical)
                          ],
                        ),
                      ],
                    );
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
