import 'dart:async';

import 'package:drive_share/app.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum AppRouterPage {
  loader,
  onboarding,
  login,
  signup,
  signupData,
}

//extension on AppRouterPage to convert it to a string route that starts with a /
extension AppRouterPageX on AppRouterPage {
  String get name => "/${toString().split('.').last}";
}

class AppRouter {
  AppRouter({
    // required this.authenticationRepository,
    // required this.appLoaderRepository,
    this.intialRoute = "/onboarding",
  }) {
    router = GoRouter(
      initialLocation: intialRoute,
      routes: routes,
      refreshListenable: AppRouterRefreshStream([]),
      // redirect: (state) {
      // // if the app is not loaded, it needs to load first
      // final loaded = appLoaderRepository.isLoaded;
      // final loading = state.subloc == AppLoaderPage.route();
      // if (!loaded) return loading ? null : AppLoaderPage.route();
      //
      // // if the user is not logged in, they need to login
      // final loggedIn = authenticationRepository.isAuthenticated;
      // final loggingIn = state.subloc == LoginPage.route();
      // if (!loggedIn) return loggingIn ? null : LoginPage.route();
      //
      // // - [loggingIn] if the user is logged in but still on the login page,
      // // redirect to the home page
      // // - [loading] if the app is loaded but still on the loading page,
      // // redirect to the home page
      // if (loggingIn || loading) return TabPage.routeWithFirstTab();
      //
      // // no need to redirect at all
      // return null;
      // },
    );
  }

  final String intialRoute;

  static List<GoRoute> get routes => [
        GoRoute(
          path: "/",
          builder: (_, __) {
            return const Scaffold(
              body: Center(
                child: Text('Error: Page not found!'),
              ),
            );
          },
        ),
        GoRoute(
          path: AppRouterPage.loader.name,
          builder: (_, __) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
        GoRoute(
          path: AppRouterPage.onboarding.name,
          builder: (_, __) {
            return const OnboardingScreen();
          },
        ),
        GoRoute(
          path: AppRouterPage.login.name,
          builder: (_, __) {
            return LoginScreen();
          },
        ),
        GoRoute(
          path: AppRouterPage.signup.name,
          builder: (_, __) {
            return SignupScreen();
          },
        ),
        GoRoute(
          path: AppRouterPage.signupData.name,
          builder: (_, __) {
            return SignupDataScreen();
          },
        ),
      ];

  @visibleForTesting
  late GoRouter router;

  RouteInformationProvider get routeInformationProvider =>
      router.routeInformationProvider;

  RouteInformationParser<Object> get routeInformationParser =>
      router.routeInformationParser;

  RouterDelegate<Object> get routerDelegate => router.routerDelegate;
}

class AppRouterRefreshStream extends ChangeNotifier {
  AppRouterRefreshStream(List<Stream<dynamic>> streams) {
    notifyListeners();
    _subscriptions = streams
        .map((e) => e.asBroadcastStream().listen(
              (dynamic _) => notifyListeners(),
            ))
        .toList();
  }

  late final List<StreamSubscription<dynamic>> _subscriptions;

  @override
  void dispose() {
    for (final e in _subscriptions) {
      e.cancel();
    }
    super.dispose();
  }
}

extension ContextX on BuildContext {
  void pushAndRemoveUntil(String path) {
    if (canPop() == true) {
      pop();
    }
    pushReplacement(path);
  }
}
