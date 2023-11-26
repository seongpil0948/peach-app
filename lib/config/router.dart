import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:peach_app/bloc/app_bloc.dart';
import 'package:peach_app/home/provider.dart';
import 'package:peach_app/home/view/layout.dart';
import 'package:peach_app/home/view/match.dart';
import 'package:peach_app/view/other.dart';

final GlobalKey<NavigatorState> rootNavKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavKey = GlobalKey<NavigatorState>();
// GoRouter configuration
final appRouter =
    GoRouter(navigatorKey: rootNavKey, initialLocation: '/', routes: [
  ShellRoute(
    navigatorKey: _shellNavKey,
    builder: (BuildContext context, GoRouterState state, Widget child) {
      return BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          return switch (state) {
            AppLoading() => const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              ),
            AppError() => const Scaffold(
                body: Text('Something went wrong!'),
              ),
            AppLoadedWithoutAuth() => const Scaffold(
                body: Center(child: Text('Please login!')),
              ),
            AppLoadedWithAuth() =>
              HomeProviders(child: HomeLayout(child: child)),
          };
        },
      );
    },
    routes: <RouteBase>[
      /// The first screen to display in the bottom navigation bar.
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeBody();
        },
        // routes: <RouteBase>[
        //   // The details screen to display stacked on the inner Navigator.
        //   // This will cover screen A but not the application shell.
        //   GoRoute(
        //     path: 'details',
        //     builder: (BuildContext context, GoRouterState state) {
        //       return const DetailsScreen(label: 'A');
        //     },
        //   ),
        // ],
      ),
      GoRoute(
        path: '/next',
        builder: (context, state) => const NextView(),
      ),
    ],
  )
]);
