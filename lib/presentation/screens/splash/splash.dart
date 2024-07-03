part of 'splash_imports.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    moveToOnboardingScreen();
    super.initState();
  }

  moveToOnboardingScreen() async {
    await Future.delayed(const Duration(seconds: 4), () {
      AutoRouter.of(context).push(const OnboardingScreenRoute());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BlogColors.splashScreenColor,
      body: Center(
        child: FadedScaleAnimation(
          child: Image.asset(
            BlogAssets.mainLogo,
            height: 42.h,
            width: 139.w,
          ),
        ),
      ),
    );
  }
}
