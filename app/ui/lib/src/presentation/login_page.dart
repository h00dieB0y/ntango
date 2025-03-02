import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ntango/src/features/auth/data/repositories/login_repository.dart';
import 'package:ntango/src/features/auth/presentation/cubits/login_cubit.dart';
import 'package:ntango/src/features/auth/presentation/widgets/login_body.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(LoginRepository()),
      child: const LoginView(),
    );
  }
}

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.pushNamed(context, '/home');
          }
          if (state is LoginFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        child: BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            final isSigningIn = state is LoginLoading;
            return LoginBody(
              isSigningIn: isSigningIn,
              onGoogleSignIn: () =>
                  context.read<LoginCubit>().signInWithGoogle(),
            );
          },
        ),
      ),
    );
  }
}
