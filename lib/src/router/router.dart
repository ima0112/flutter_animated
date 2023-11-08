import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_animation/src/pages/home_page.dart';

enum MyRoutes { home }

class AppRoute {
  static GoRouter get routes => _routes;

  static GlobalKey<NavigatorState> get rootNavigatorKey => _rootNavigatorKey;

  static GlobalKey<NavigatorState> get shellNavigatorKey => _shellNavigatorKey;

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static const String _home = '/home';

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
      ),
    ],
  );
}
