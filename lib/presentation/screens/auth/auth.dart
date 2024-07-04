part of 'auth_imports.dart';

@RoutePage()
class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(BlogAssets.authBackgroundImage),
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    BlogAssets.mainLogo,
                    height: 42.h,
                    width: 139.w,
                  ).centered(),
                  const Spacer(),
                  "Explore the world,\nBillions of thoughts"
                      .text
                      .size(28.sp)
                      .fontWeight(FontWeight.w700)
                      .white
                      .make(),
                  20.h.heightBox,
              Prima
                  12.h.heightBox,
                  ElevatedButton(
                    onPressed: () {
                      AutoRouter.of(context).push(const RegisterRoute());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      minimumSize:
                          Size(MediaQuery.of(context).size.width, 44.h),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(11.r),
                      ),
                    ),
                    child: "Register"
                        .text
                        .size(16.sp)
                        .fontWeight(FontWeight.w700)
                        .color(Colors.white)
                        .make(),
                  ),
                  20.h.heightBox
                ],
              ),
            ),
          ),
        ));
  }
}
