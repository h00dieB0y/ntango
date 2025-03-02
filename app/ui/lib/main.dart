import 'package:flutter/material.dart';
import 'package:ntango/src/constants/app_routes.dart';
import 'package:ntango/src/presentation/home_page.dart';
import 'package:ntango/src/presentation/login_page.dart';
import 'package:ntango/src/theme/ntango_theme.dart';

void main() {
  runApp(const NtangoApp());
}

class NtangoApp extends StatelessWidget {
  const NtangoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ntango',
      theme: ntangoLightTheme,
      darkTheme: ntangoDarkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.login,
      routes: {
        AppRoutes.login: (context) => const LoginPage(),
        AppRoutes.home: (context) => const HomePage(),
      },
    );
  }
}
