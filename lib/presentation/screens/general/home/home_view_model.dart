part of 'home_imports.dart';

class HomeViewModel {
  final Repository repository;

  HomeViewModel({required this.repository});

  final VelocityBloc<HomeModal> postsBloc =
      VelocityBloc<HomeModal>(HomeModal());
  fetchAllPosts() async {
    var postData = await repository.postRepo.getAllPosts();
    if (postData.status == 1) {
      postsBloc.onUpdateData(postData);
    }
  }
}
