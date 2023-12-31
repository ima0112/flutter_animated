import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import '../pages/home_page.dart';
import '../pages/list_parallax/list_parallax.dart';
import '../pages/animated_text/animated_text.dart';
import '../pages/animated_fab/animated_fab_page.dart';
import '../pages/rive_animations/rive_animations.dart';
import '../pages/flip_animation/flip_animation_page.dart';
import '../pages/animated_container/animated_container.dart';
import '../pages/confetti_aimation/confetti_animation_page.dart';

enum MyRoutes {
  home,
  sample1,
  sample2,
  sample3,
  sample4,
  sample5,
  sample6,
  sample7
}

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
  static const String _sample5 = 'sample5';
  static const String _sample6 = 'sample6';
  static const String _sample7 = 'sample7';

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
          GoRoute(
            path: _sample5,
            name: MyRoutes.sample5.name,
            builder: (context, state) => const ConfettiAnimationPage(),
          ),
          GoRoute(
            path: _sample6,
            name: MyRoutes.sample6.name,
            builder: (context, state) => const AnimatedFabPage(),
          ),
          GoRoute(
            path: _sample7,
            name: MyRoutes.sample7.name,
            builder: (context, state) => const FlipAnimationPage(),
          ),
        ],
      ),
    ],
  );
}
