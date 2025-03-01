import 'package:flutter/material.dart';
import 'package:ntango/src/presentation/home_page.dart';

void main() {
  runApp(const NtangoApp());
}

class NtangoApp extends StatelessWidget {
  const NtangoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ntango',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
