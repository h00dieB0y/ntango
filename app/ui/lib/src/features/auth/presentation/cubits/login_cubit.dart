import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ntango/src/features/auth/data/repositories/login_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository _loginRepository;

  LoginCubit(this._loginRepository) : super(LoginInitial());

  Future<void> signInWithGoogle() async {
    emit(LoginLoading());

    try {
      await _loginRepository.signInWithGoogle();
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
