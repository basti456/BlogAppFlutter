import 'auth_repo.dart';
import 'post_repo.dart';
import 'tags_repo.dart';

class Repository {
  Repository(
      {required this.tagsRepo, required this.authRepo, required this.postRepo});

  final TagsRepo tagsRepo;

  final AuthRepo authRepo;

  final PostRepo postRepo;
}
