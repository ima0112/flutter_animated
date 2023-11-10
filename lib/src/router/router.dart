import 'package:flutter/material.dart';
import 'package:flutter_animation/src/pages/animated_container/animated_container.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_animation/src/pages/home_page.dart';

import '../pages/animated_text/animated_text.dart';
import '../pages/list_parallax/list_parallax.dart';
import '../pages/rive_animations/rive_animations.dart';

enum MyRoutes { home, sample1, sample2, sample3, sample4 }

class AppRoute {
  static GoRouter get routes => _routes;

  static GlobalKey<NavigatorState> get rootNavigatorKey => _rootNavigatorKey;

  static GlobalKey<NavigatorState> get shellNavigatorKey => _shellNavigatorKey;

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static const String _home = '/home';
  static const String _sample1 = 'sample1';
  static const String _sample2 = 'sample2';
  static const String _sample3 = 'sample3';
  static const String _sample4 = 'sample4';

  static final _routes = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: _home,
    observers: [
      HeroController(),
    ],
    routes: [
      GoRoute(
        path: _home,
        name: MyRoutes.home.name,
        builder: (context, state) => const HomePage(),
        routes: [
          GoRoute(
            path: _sample1,
            name: MyRoutes.sample1.name,
            builder: (context, state) => const AnimatedContainerPage(),
          ),
          GoRoute(
            path: _sample2,
            name: MyRoutes.sample2.name,
            builder: (context, state) => const AnimatedTextPage(),
          ),
          GoRoute(
            path: _sample3,
            name: MyRoutes.sample3.name,
            builder: (context, state) => const RiveAnimationPage(),
          ),
          GoRoute(
            path: _sample4,
            name: MyRoutes.sample4.name,
            builder: (context, state) => const ListParallaxPage(),
          ),
        ],
      ),
    ],
  );
}
