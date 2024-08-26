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
    profileViewModel.getUserProfileData();
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
      body:
          BlocBuilder<VelocityBloc<ProfileModal>, VelocityState<ProfileModal>>(
        bloc: profileViewModel.profileModalBloc,
        builder: (context, state) {
          if (state is VelocityInitialState) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is VelocityUpdateState) {
            return ListView(
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
                        CircleAvatar(
                          radius: 70,
                          child: Initicon(
                            text:state.data.userDetails!.name!,
                            elevation: 4,
                            size: 140,
                          ),
                        ),
                        10.h.heightBox,
                        state.data.userDetails!.name!.text.bold.white.xl2
                            .make(),
                        state.data.userDetails!.email!.text.bold.xl.white.make(),
                        20.h.heightBox,
                        "Android Developer".text.xl.center.white.make(),
                        15.h.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                state.data.postsCount!.text.bold.xl3.white.make(),
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
                        itemCount: state.data.posts!.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 13,
                                childAspectRatio: 0.9),
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              CachedNetworkImage(imageUrl: state.data.posts![index].featuredimage!,)
                                  .cornerRadius(10),
                              6.h.heightBox,
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  state.data.posts![index].title!
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
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
