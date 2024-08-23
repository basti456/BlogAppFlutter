part of 'home_imports.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late HomeViewModel homeViewModel;

  @override
  void initState() {
    homeViewModel = HomeViewModel(repository: context.read<Repository>());
    homeViewModel.fetchAllPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<VelocityBloc<HomeModal>, VelocityState<HomeModal>>(
          bloc: homeViewModel.postsBloc,
          builder: (context, state) {
            if (state is VelocityInitialState) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else if (state is VelocityUpdateState) {
              return SingleChildScrollView(
                
                child: Column(
                  children: [
                    VxSwiper.builder(
                        itemCount: state.data.popularPosts!.length,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        itemBuilder: (context, index) {
                          return CachedNetworkImage(imageUrl:state.data.popularPosts![index].featuredimage! ,fit: BoxFit.cover,)
                              .cornerRadius(20).pSymmetric(h: 10);
                        }),
                    20.h.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        "Latest Posts".text.size(16.sp).make(),
                        "See All".text.size(16.sp).make(),
                      ],
                    ).pSymmetric(h:24.w),
                    10.h.heightBox,
                    ListView.separated(
                      padding:EdgeInsets.symmetric(horizontal: 18.w),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.data.allPosts!.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 20.h),
                      itemBuilder: (context, index) {
                        var latestPosts = state.data.allPosts![index];
                        return FadedScaleAnimation(
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () => AutoRouter.of(context)
                                    .push(HomeDetailsRoute(post: latestPosts)),
                                child: Hero(
                                  tag: Key(latestPosts.id!.toString()),
                                  child: CachedNetworkImage(
                                    imageUrl: latestPosts.featuredimage!,
                                    height: 120.h,
                                    width: 180.w,
                                    fit: BoxFit.cover,
                                  ).cornerRadius(20),
                                ),
                              ),
                              5.widthBox,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  latestPosts.title!.text
                                      .size(16.sp)
                                      .bold
                                      .maxLines(2)
                                      .make(),
                                  6.h.heightBox,
                                  Row(
                                    children: [
                                      const Icon(FeatherIcons.clock),
                                      latestPosts.createdAt!
                                          .timeAgo()
                                          .text
                                          .size(14.sp)
                                          .make(),
                                    ],
                                  ),
                                  6.h.heightBox,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      "${latestPosts.views!} views"
                                          .text
                                          .size(16.sp)
                                          .make(),
                                      const Icon(FeatherIcons.bookmark),
                                    ],
                                  ),
                                ],
                              ).expand()
                            ],
                          ),
                        );
                      },
                    )
                  ],
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
