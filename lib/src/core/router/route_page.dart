import 'package:flutter_dermascan/src/core/router/route_name.dart';
import 'package:flutter_dermascan/src/features/auth/presentation/pages/login_page.dart';
import 'package:flutter_dermascan/src/features/auth/presentation/pages/register_page.dart';
import 'package:flutter_dermascan/src/features/auth/presentation/pages/welcome_page.dart';
import 'package:flutter_dermascan/src/features/home/presentation/pages/landing_page.dart';
import 'package:flutter_dermascan/src/features/profile/presentation/pages/change_password_page.dart';
import 'package:flutter_dermascan/src/features/profile/presentation/pages/detail_history_page.dart';
import 'package:flutter_dermascan/src/features/profile/presentation/pages/edit_profile_page.dart';
import 'package:flutter_dermascan/src/features/profile/presentation/pages/history_page.dart';
import 'package:flutter_dermascan/src/features/scan/presentation/pages/detail_diagnose_page.dart';
import 'package:go_router/go_router.dart';

class RoutePage {
  GoRouter router = GoRouter(
    initialLocation: '/${RouteName.welcomePage}',
    routes: [
      GoRoute(
        name: RouteName.landingPage,
        path: '/',
        builder: (context, state) => LandingPage(),
      ),
      GoRoute(
        name: RouteName.changePassword,
        path: '/${RouteName.changePassword}',
        builder: (context, state) => ChangePasswordPage(),
      ),
      GoRoute(
        name: RouteName.editProfile,
        path: '/${RouteName.editProfile}',
        builder: (context, state) => EditProfilePage(),
      ),
      GoRoute(
        name: RouteName.diagnoseHistoryPage,
        path: '/${RouteName.diagnoseHistoryPage}',
        builder: (context, state) => HistoryPage(),
      ),
      GoRoute(
        name: RouteName.diagnoseDetailHistoryPage,
        path: '/${RouteName.diagnoseDetailHistoryPage}',
        builder: (context, state) => DetailHistoryPage(),
      ),
      GoRoute(
        name: RouteName.loginPage,
        path: '/${RouteName.loginPage}',
        builder: (context, state) => LoginPage(),
      ),
      GoRoute(
        name: RouteName.registerPage,
        path: '/${RouteName.registerPage}',
        builder: (context, state) => RegisterPage(),
      ),
      GoRoute(
        name: RouteName.welcomePage,
        path: '/${RouteName.welcomePage}',
        builder: (context, state) => WelcomePage(),
      ),

      GoRoute(
        name: RouteName.detailDiagnosePage,
        path: '/${RouteName.detailDiagnosePage}',
        builder: (context, state) {
          final filePath = state.extra as String;
          return DetailDiagnosePage(imagePath: filePath);
        },
      ),
    ],
  );
}
