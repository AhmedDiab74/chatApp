import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is LoginEvent) {
        emit(LoginLoading());
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: event.email, password: event.password);
          emit(LoginSuccess());
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            emit(LoginFailure(errorMessage: "User Not Found"));
          } else if (e.code == 'wrong-password') {
            emit(LoginFailure(errorMessage: "Wrong Password"));
          }
        } catch (e) {
          emit(LoginFailure(errorMessage: "Somthing Went Wrong"));
        }
      } else if (event is RegisterEvent) {
        emit(RegisterLoading());
    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: event.email, password: event.password);
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterFailure(errorName: "Weak Password"));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterFailure(errorName: "User Is Already In Use"));
      }
    } catch (e) {
      emit(RegisterFailure(errorName: "Something Went Wrong"));
    }
      }
    });
  }
  @override
  void onTransition(Transition<AuthEvent, AuthState> transition) {
    super.onTransition(transition);
    if (kDebugMode) {
      print(transition);
    }
  }
}
