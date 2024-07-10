part of 'profile_imports.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(FeatherIcons.logOut).pOnly(right: 10.w),
          )
        ],
      ),
      body: Container(
        height: 500.h,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: BlogColors.splashScreenColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
    );
  }
}
