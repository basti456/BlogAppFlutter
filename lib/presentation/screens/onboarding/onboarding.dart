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
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/splash.png',
                  color: BlogColors.splashScreenColor,
                  height: he.height * 0.051,
                  width: he.width * 0.378,
                ),
                (he.height * 0.0756).heightBox,
                PageView(
                  controller: onboardingViewModel.pageController,
                  children: [
                    OnboardImgAndDesc(
                      imgPath: "assets/images/Onboarding1.png",
                      content:
                          "Discover, engage and read the latest articles as well as share your own thoughts and ideas with the community",
                      height: he.height * 0.428,
                      width: he.width,
                    ),
                    OnboardImgAndDesc(
                      imgPath: "assets/images/Onboarding3.png",
                      content:
                          "Explore a wide selection of categories, or use the search bar to find specific topics",
                      height: he.height * 0.428,
                      width: he.width,
                    ),
                    OnboardImgAndDesc(
                      imgPath: "assets/images/Onboarding2.png",
                      content:
                          "Customize your reading experience and join the conversation by creating an account.",
                      height: he.height * 0.428,
                      width: he.width,
                    ),
                  ],
                ).expand(),
                (he.height * 0.0723).heightBox,
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: BlogColors.splashScreenColor,
                    minimumSize: Size(he.width, he.height * 0.052),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11),
                    ),
                  ),
                  child: "Get Started"
                      .text
                      .size(16)
                      .fontWeight(FontWeight.w700)
                      .color(Colors.white)
                      .make(),
                ),
                (he.height * 0.0723).heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "Skip"
                        .text
                        .color(BlogColors.splashScreenColor)
                        .size(16)
                        .fontWeight(FontWeight.w700)
                        .make(),
                    SmoothPageIndicator(
                      controller: onboardingViewModel.pageController,
                      count: 3,
                      axisDirection: Axis.horizontal,
                      effect: const WormEffect(
                        activeDotColor: BlogColors.splashScreenColor,
                        dotHeight: 12.0,
                        dotWidth: 12.0
                      ),
                      onDotClicked: (index){

                      },
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
