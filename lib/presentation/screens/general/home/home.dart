part of 'home_imports.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              Image.asset(BlogAssets.onboarding3).cornerRadius(20),
              20.h.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  "Latest Posts".text.size(16.sp).make(),
                  "See All".text.size(16.sp).make(),
                ],
              ),
              10.h.heightBox,
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                separatorBuilder: (context, index) => SizedBox(height: 20.h),
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      GestureDetector(
                        onTap: () => AutoRouter.of(context)
                            .push(const HomeDetailsRoute()),
                        child: Image.asset(
                          BlogAssets.onboarding3,
                          height: 140.h,
                          width: 180.w,
                          fit: BoxFit.cover,
                        ).cornerRadius(20),
                      ),
                      10.w.widthBox,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "Netflix will charge money for password sharing"
                              .text
                              .size(16.sp)
                              .bold
                              .maxLines(2)
                              .make(),
                          6.h.heightBox,
                          Row(
                            children: [
                              const Icon(FeatherIcons.clock),
                              "6 months ago".text.size(16.sp).make(),
                            ],
                          ),
                          6.h.heightBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              "59 views".text.size(16.sp).make(),
                              const Icon(FeatherIcons.bookmark),
                            ],
                          ),
                        ],
                      ).expand()
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
