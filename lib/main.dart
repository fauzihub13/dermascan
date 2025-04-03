import 'package:flutter/material.dart';
import 'package:flutter_dermascan/src/core/router/route_page.dart';
import 'package:flutter_dermascan/src/core/utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'DermaScan',
      theme: AppTheme.light,
      routerConfig: RoutePage().router,
      // home: Builder(
      //   builder: (context) {
      //     return const WelcomePage();
      //   },
      // ),
    );
  }
}
