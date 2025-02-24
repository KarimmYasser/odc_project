import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/network/dio_helper.dart';
import '../../../core/network/endpoints.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void login(String userName, String password) {
    emit(AuthLoginLoading());
    Map<String, String> data = {'username': "mor_2314", 'password': "83r5^_"};
    DioHelper.postData(url: Endpoints.loginEndPoint, data: data).then((value) {
      if (value.statusCode == 200) {
        emit(AuthLoginSuccess());
      } else {
        emit(AuthLoginFailure("Login failed , please try again"));
      }
    }).onError((error, stackTrace) {
      emit(AuthLoginFailure("Login failed , please try again"));
    });
  }

  void register(String userName, String password, String confirmPassword) {
    emit(AuthRegisterLoading());
    if (userName.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      emit(AuthRegisterFailure("Register failed , please try again"));
      return;
    }
    Map<String, String> data = {
      'username': userName,
      'password': password,
      "email": confirmPassword,
    };
    DioHelper.postData(url: Endpoints.signUpEndPoint, data: data).then((value) {
      if (value.statusCode == 200) {
        emit(AuthRegisterSuccess());
      } else {
        debugPrint(value.statusMessage);
        emit(AuthRegisterFailure("Register failed , please try again"));
      }
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
      emit(AuthRegisterFailure("Register failed , please try again"));
    });
  }
}
