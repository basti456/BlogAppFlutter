// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:blog_app/presentation/screens/auth/auth_imports.dart' as _i1;
import 'package:blog_app/presentation/screens/auth/login/login_imports.dart'
    as _i5;
import 'package:blog_app/presentation/screens/auth/register/register_imports.dart'
    as _i7;
import 'package:blog_app/presentation/screens/general/categories/categories_imports.dart'
    as _i2;
import 'package:blog_app/presentation/screens/general/categories/categories_model.dart'
    as _i11;
import 'package:blog_app/presentation/screens/general/general_imports.dart'
    as _i3;
import 'package:blog_app/presentation/screens/general/home/home_imports.dart'
    as _i4;
import 'package:blog_app/presentation/screens/general/home/home_model.dart'
    as _i14;
import 'package:blog_app/presentation/screens/general/tags/tags_imports.dart'
    as _i9;
import 'package:blog_app/presentation/screens/general/tags/tags_model.dart'
    as _i12;
import 'package:blog_app/presentation/screens/onboarding/onboarding_imports.dart'
    as _i6;
import 'package:blog_app/presentation/screens/splash/splash_imports.dart'
    as _i8;
import 'package:flutter/material.dart' as _i13;

abstract class $AppRouter extends _i10.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    AuthRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.Auth(),
      );
    },
    CategoriesRoute.name: (routeData) {
      return _i10.AutoRoutePage<_i11.Category>(
        routeData: routeData,
        child: const _i2.Categories(),
      );
    },
    GeneralRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.General(),
      );
    },
    HomeDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<HomeDetailsRouteArgs>();
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.HomeDetails(
          key: args.key,
          post: args.post,
        ),
      );
    },
    LoginRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.Login(),
      );
    },
    OnboardingScreenRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.OnboardingScreen(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.Register(),
      );
    },
    SplashScreenRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.SplashScreen(),
      );
    },
    TagsRoute.name: (routeData) {
      return _i10.AutoRoutePage<_i12.Tag>(
        routeData: routeData,
        child: const _i9.Tags(),
      );
    },
  };
}

/// generated route for
/// [_i1.Auth]
class AuthRoute extends _i10.PageRouteInfo<void> {
  const AuthRoute({List<_i10.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i2.Categories]
class CategoriesRoute extends _i10.PageRouteInfo<void> {
  const CategoriesRoute({List<_i10.PageRouteInfo>? children})
      : super(
          CategoriesRoute.name,
          initialChildren: children,
        );

  static const String name = 'CategoriesRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i3.General]
class GeneralRoute extends _i10.PageRouteInfo<void> {
  const GeneralRoute({List<_i10.PageRouteInfo>? children})
      : super(
          GeneralRoute.name,
          initialChildren: children,
        );

  static const String name = 'GeneralRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i4.HomeDetails]
class HomeDetailsRoute extends _i10.PageRouteInfo<HomeDetailsRouteArgs> {
  HomeDetailsRoute({
    _i13.Key? key,
    required _i14.Post post,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          HomeDetailsRoute.name,
          args: HomeDetailsRouteArgs(
            key: key,
            post: post,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeDetailsRoute';

  static const _i10.PageInfo<HomeDetailsRouteArgs> page =
      _i10.PageInfo<HomeDetailsRouteArgs>(name);
}

class HomeDetailsRouteArgs {
  const HomeDetailsRouteArgs({
    this.key,
    required this.post,
  });

  final _i13.Key? key;

  final _i14.Post post;

  @override
  String toString() {
    return 'HomeDetailsRouteArgs{key: $key, post: $post}';
  }
}

/// generated route for
/// [_i5.Login]
class LoginRoute extends _i10.PageRouteInfo<void> {
  const LoginRoute({List<_i10.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i6.OnboardingScreen]
class OnboardingScreenRoute extends _i10.PageRouteInfo<void> {
  const OnboardingScreenRoute({List<_i10.PageRouteInfo>? children})
      : super(
          OnboardingScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingScreenRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i7.Register]
class RegisterRoute extends _i10.PageRouteInfo<void> {
  const RegisterRoute({List<_i10.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i8.SplashScreen]
class SplashScreenRoute extends _i10.PageRouteInfo<void> {
  const SplashScreenRoute({List<_i10.PageRouteInfo>? children})
      : super(
          SplashScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreenRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i9.Tags]
class TagsRoute extends _i10.PageRouteInfo<void> {
  const TagsRoute({List<_i10.PageRouteInfo>? children})
      : super(
          TagsRoute.name,
          initialChildren: children,
        );

  static const String name = 'TagsRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}
