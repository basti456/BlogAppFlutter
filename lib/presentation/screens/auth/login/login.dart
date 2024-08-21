part of 'login_imports.dart';

@RoutePage()
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late LoginViewModel loginViewModel;

  @override
  void initState() {
    loginViewModel = LoginViewModel(repository: context.read<Repository>());
    super.initState();
  }

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
          child: FadedScaleAnimation(
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
                    child: Form(
                      key: loginViewModel.formKey,
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
                                "Login"
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
                                VxTextField(
                                  fillColor: Colors.transparent,
                                  borderColor: BlogColors.splashScreenColor,
                                  borderRadius: 10,
                                  borderType: VxTextFieldBorderType.roundLine,
                                  controller: loginViewModel.emailController,
                                  validator: (email) {
                                    if (email!.isEmpty) {
                                      return "Email is empty";
                                    } else if (!email.isValidEmail) {
                                      return "Invalid Email address";
                                    }
                                    return null;
                                  },
                                  prefixIcon: const Icon(
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
                                VxTextField(
                                  fillColor: Colors.transparent,
                                  borderColor: BlogColors.splashScreenColor,
                                  borderRadius: 10,
                                  borderType: VxTextFieldBorderType.roundLine,
                                  isPassword: true,
                                  obscureText: false,
                                  controller: loginViewModel.passwordController,
                                  validator: (password) {
                                    if (password!.isEmpty) {
                                      return "Password is Empty";
                                    } else if (password.isValidPassword) {
                                      return "Invalid password";
                                    }
                                    return null;
                                  },
                                  prefixIcon: const Icon(
                                    Icons.lock_outlined,
                                    color: BlogColors.splashScreenColor,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                              .color(
                                                  BlogColors.splashScreenColor)
                                              .make(),
                                          onChanged: (value) {}),
                                    ),
                                    "Forgot Password"
                                        .text
                                        .size(14)
                                        .color(BlogColors.splashScreenColor)
                                        .make(),
                                  ],
                                ),
                                40.h.heightBox,
                                PrimaryButton(
                                  title: "Login",
                                  onPressed: () {
                                    if (loginViewModel.formKey.currentState!
                                        .validate()) {
                                      loginViewModel.login(context);
                                    }
                                  },
                                ),
                                20.h.heightBox,
                                "Don't have an account?"
                                    .richText
                                    .size(14)
                                    .semiBold
                                    .color(BlogColors.splashScreenColor)
                                    .withTextSpanChildren([
                                  TextSpan(
                                      text: "SignUp",
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () => AutoRouter.of(context)
                                            .push(const RegisterRoute()),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                      ))
                                ]).makeCentered()
                              ],
                            ),
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
      ),
    );
  }
}
