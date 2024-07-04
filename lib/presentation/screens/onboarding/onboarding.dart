part of 'onboarding_imports.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  OnboardingViewModel onboardingViewModel = OnboardingViewModel();
  @override
  Widget build(BuildContext context) {
    var he = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  BlogAssets.mainLogo,
                  color: BlogColors.splashScreenColor,
                  height: 42.h,
                  width: 139.w,
                ),
                63.h.heightBox,
                PageView(
                  controller: onboardingViewModel.pageController,
                  children: [
                    OnboardImgAndDesc(
                      imgPath: BlogAssets.onboarding1,
                      content:
                          "Discover, engage and read the latest articles as well as share your own thoughts and ideas with the community",
                      height: 333.h,
                      width: 333.w,
                    ),
                    OnboardImgAndDesc(
                      imgPath: BlogAssets.onboarding3,
                      content:
                          "Explore a wide selection of categories, or use the search bar to find specific topics",
                      height: 333.h,
                      width: 333.w,
                    ),
                    OnboardImgAndDesc(
                      imgPath: BlogAssets.onboarding2,
                      content:
                          "Customize your reading experience and join the conversation by creating an account.",
                      height: 333.h,
                      width: 333.w,
                    ),
                  ],
                ).expand(),
                (61.h).heightBox,
                ElevatedButton(
                  onPressed: () {
                    AutoRouter.of(context).push(const AuthRoute());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: BlogColors.splashScreenColor,
                    minimumSize: Size(he.width, 44.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11.r),
                    ),
                  ),
                  child: "Get Started"
                      .text
                      .size(16.sp)
                      .fontWeight(FontWeight.w700)
                      .color(Colors.white)
                      .make(),
                ),
                (63.h).heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "Skip"
                        .text
                        .color(BlogColors.splashScreenColor)
                        .size(16.sp)
                        .fontWeight(FontWeight.w700)
                        .make(),
                    SmoothPageIndicator(
                      controller: onboardingViewModel.pageController,
                      count: 3,
                      axisDirection: Axis.horizontal,
                      effect: const WormEffect(
                          activeDotColor: BlogColors.splashScreenColor,
                          dotHeight: 12.0,
                          dotWidth: 12.0),
                      onDotClicked: (index) {},
                    ),
                    "Next"
                        .text
                        .color(BlogColors.splashScreenColor)
                        .size(16)
                        .fontWeight(FontWeight.w700)
                        .make(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
