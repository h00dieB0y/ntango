import 'package:flutter/material.dart';
import 'package:ntango/src/features/auth/presentation/widgets/login_body.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isSigningIn = false;

  Future<void> _signInWithGoogle() async {
    setState(() => _isSigningIn = true);

    // TODO: Replace with your actual Google sign-in logic.
    await Future.delayed(const Duration(seconds: 2));

    setState(() => _isSigningIn = false);

    // Navigate to home (adjust route as needed).
    Navigator.pushNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginBody(
        isSigningIn: _isSigningIn,
        onGoogleSignIn: _signInWithGoogle,
      ),
    );
  }
}
