part of 'profile_imports.dart';

class ProfileViewModel {
  final Repository repository;

  ProfileViewModel({required this.repository});

  logout(context) async {
    var data = await repository.authRepo.userLogout(context);
    if (data.message.isNotEmptyAndNotNull) {
      Utils.clearAllSavedData();

    }
  }
}
