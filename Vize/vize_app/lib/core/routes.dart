import 'package:go_router/go_router.dart';
import 'package:vizeapp/screens/aboutScreen.dart';
import 'package:vizeapp/screens/registerScreen.dart';
import '../screens/loginScreen.dart';
import '../screens/welcomeScreen.dart';
import '../screens/homeScreen.dart';
import '../screens/settingsScreen.dart';
import '../core/loader.dart';

final routes = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoaderScreen(),
    ),
    GoRoute(
      path: '/welcome',
      builder: (context, state) => const WelcomeScreen(),
    ),
    GoRoute(
      path: "/home",
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: "/settings",
      builder: (context, state) => const SettingsPage(),
    ),
    GoRoute(
      path: "/logout",
      builder: (context, state) => const WelcomeScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: "/register",
      builder: (context, state) => RegisterScreen(),
    ),
    GoRoute(
      path: "/about",
      builder: (context, state) => const AboutScreen(),
    ),
  ],
);
