import 'package:blog_app/data/repository/categories_repo.dart';

import 'auth_repo.dart';
import 'post_repo.dart';
import 'tags_repo.dart';

class Repository {
  Repository(
      {required this.tagsRepo,
      required this.authRepo,
      required this.postRepo,
      required this.categoriesRepo});

  final TagsRepo tagsRepo;

  final AuthRepo authRepo;

  final PostRepo postRepo;

  final CategoriesRepo categoriesRepo;
}
