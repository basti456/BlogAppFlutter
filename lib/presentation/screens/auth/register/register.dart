part of 'register_imports.dart';

@RoutePage()
class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late RegisterViewModel registerViewModel;

  @override
  void initState() {
    registerViewModel =
        RegisterViewModel(repository: context.read<Repository>());
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
                      key: registerViewModel.registerKey,
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
                                "Name"
                                    .text
                                    .color(BlogColors.splashScreenColor)
                                    .make(),
                                8.h.heightBox,
                                VxTextField(
                                  fillColor: Colors.transparent,
                                  borderColor: BlogColors.splashScreenColor,
                                  borderRadius: 10,
                                  borderType: VxTextFieldBorderType.roundLine,
                                  controller: registerViewModel.nameController,
                                  validator: (name) {
                                    if (name!.trim().isEmpty) {
                                      return "Please enter your name";
                                    }
                                    return null;
                                  },
                                  prefixIcon: const Icon(
                                    Icons.person_2_outlined,
                                    color: BlogColors.splashScreenColor,
                                  ),
                                  //keyboardType: TextInputType.emailAddress,
                                ),
                                20.h.heightBox,
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
                                  controller: registerViewModel.emailController,
                                  validator: (email) {
                                    if (email!.trim().isEmpty) {
                                      return "Please enter your email";
                                    } else if (!email.isValidEmail) {
                                      return "Invalid Email";
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
                                  controller:
                                      registerViewModel.passwordController,
                                  validator: (password) {
                                    if (password!.trim().isEmpty) {
                                      return "Please enter password";
                                    }
                                    return null;
                                  },
                                  isPassword: true,
                                  obscureText: true,
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
                                  ],
                                ),
                                40.h.heightBox,
                                BlocBuilder<VelocityBloc, VelocityState>(
                                  bloc: registerViewModel.isLoadingBloc,
                                  builder: (context, state) {
                                    return PrimaryButton(
                                        title: "Register",
                                        isLoading: state.data,
                                        onPressed: () {
                                          if (registerViewModel
                                              .registerKey.currentState!
                                              .validate()) {
                                            registerViewModel.register(context);
                                          }
                                        });
                                  },
                                ),
                                20.h.heightBox,
                                "Already have an account?"
                                    .richText
                                    .size(14)
                                    .semiBold
                                    .color(BlogColors.splashScreenColor)
                                    .withTextSpanChildren([
                                  TextSpan(
                                      text: "Login",
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () => AutoRouter.of(context)
                                            .push(const LoginRoute()),
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
