import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:blog_app/core/constants/blog_colors.dart';
import 'package:blog_app/data/repository/repository.dart';
import 'package:blog_app/presentation/screens/general/categories/categories_model.dart';
import 'package:blog_app/presentation/screens/general/tags/tags_model.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocity_bloc/velocity_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../router/router_imports.gr.dart';


part 'add_posts.dart';

part 'add_posts_view_model.dart';
