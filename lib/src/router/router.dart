import 'package:flutter/material.dart';
import 'package:flutter_animation/src/sample_feature/sample_item_list_view.dart';
import 'package:go_router/go_router.dart';

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
        builder: (context, state) => const SampleItemListView(),
      ),
    ],
  );
}
