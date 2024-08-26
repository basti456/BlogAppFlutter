part of 'profile_imports.dart';

class ProfileViewModel {
  final Repository repository;

  ProfileViewModel({required this.repository});

  final VelocityBloc<ProfileModal> profileModalBloc =
      VelocityBloc<ProfileModal>(ProfileModal());

  logout(context) async {
    var data = await repository.authRepo.userLogout(context);
    if (data.message.isNotEmptyAndNotNull) {
      Utils.clearAllSavedData();
    }
  }

  getUserProfileData() async {
    var userProfileData = await repository.postRepo.getUserPosts();
    if (userProfileData.status == 1) {
      profileModalBloc.onUpdateData(userProfileData);
    }
  }
}
