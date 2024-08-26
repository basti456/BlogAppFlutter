part of 'register_imports.dart';

class RegisterViewModel {
  final Repository repository;

  RegisterViewModel({required this.repository});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final VelocityBloc<bool> isLoadingBloc = VelocityBloc<bool>(false);

  final registerKey = GlobalKey<FormState>();
  register(context) async {
    isLoadingBloc.onUpdateData(true);
    var registerData = await repository.authRepo.userRegister(
      nameController.text,
      emailController.text,
      passwordController.text,
      context,
    );
    if (registerData.data != null) {
      Utils.saveToken(registerData.accessToken.toString());
      AutoRouter.of(context).push(const GeneralRoute());
    } else {
      var result = registerData.emailErrors![0];
      VxToast.show(context, msg: result.toString());
    }
    isLoadingBloc.onUpdateData(false);
  }
}
