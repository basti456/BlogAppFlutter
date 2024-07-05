part of 'register_imports.dart';

@RoutePage()
class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BlogColors.splashScreenColor,
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () {
          // Unfocus the text field to hide the keyboard
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: Column(
              children: [
                Image.asset(
                  BlogAssets.mainLogo,
                  height: 42.h,
                  width: 139.w,
                ).centered(),
                100.h.heightBox,
                Expanded(
                  child: Container(
                    height: MediaQuery.sizeOf(context).height,
                    width: MediaQuery.sizeOf(context).width,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(36),
                          topRight: Radius.circular(36)),
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            50.h.heightBox,
                            "Register"
                                .text
                                .size(18.sp)
                                .fontWeight(FontWeight.w700)
                                .color(BlogColors.splashScreenColor)
                                .makeCentered(),
                            48.h.heightBox,
                            "Email"
                                .text
                                .color(BlogColors.splashScreenColor)
                                .make(),
                            8.h.heightBox,
                            const VxTextField(
                              fillColor: Colors.transparent,
                              borderColor: BlogColors.splashScreenColor,
                              borderRadius: 10,
                              borderType: VxTextFieldBorderType.roundLine,
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: BlogColors.splashScreenColor,
                              ),
                              //keyboardType: TextInputType.emailAddress,
                            ),
                            20.h.heightBox,
                            "Password"
                                .text
                                .color(BlogColors.splashScreenColor)
                                .make(),
                            8.h.heightBox,
                            const VxTextField(
                              fillColor: Colors.transparent,
                              borderColor: BlogColors.splashScreenColor,
                              borderRadius: 10,
                              borderType: VxTextFieldBorderType.roundLine,
                              isPassword: true,
                              obscureText: false,
                              prefixIcon: Icon(
                                Icons.lock_outlined,
                                color: BlogColors.splashScreenColor,
                              ),
                            ),
                            20.h.heightBox,
                            "Password"
                                .text
                                .color(BlogColors.splashScreenColor)
                                .make(),
                            8.h.heightBox,
                            const VxTextField(
                              fillColor: Colors.transparent,
                              borderColor: BlogColors.splashScreenColor,
                              borderRadius: 10,
                              borderType: VxTextFieldBorderType.roundLine,
                              isPassword: true,
                              obscureText: false,
                              prefixIcon: Icon(
                                Icons.lock_outlined,
                                color: BlogColors.splashScreenColor,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 180.w,
                                  child: CheckboxListTile.adaptive(
                                      value: false,
                                      contentPadding: EdgeInsets.zero,
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      title: "Remember me"
                                          .text
                                          .size(14)
                                          .color(BlogColors.splashScreenColor)
                                          .make(),
                                      onChanged: (value) {}),
                                ),
                              ],
                            ),
                            40.h.heightBox,
                            PrimaryButton(title: "Login", onPressed: () {}),
                            20.h.heightBox,
                            "Already have an account?"
                                .richText
                                .size(14)
                                .semiBold
                                .color(BlogColors.splashScreenColor)
                                .withTextSpanChildren([
                              const TextSpan(
                                  text: "Login",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                  ))
                            ]).makeCentered()
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
