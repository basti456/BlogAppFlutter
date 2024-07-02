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
    var he = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: BlogColors.primaryColor,
      body: Center(
        child: FadedScaleAnimation(
          child: Image.asset(
            "assets/images/splash.png",
            height: he.height * 0.05,
            width: he.width * 0.377,
          ),
        ),
      ),
    );
  }
}
