import 'package:bks_case/core/base_viewmodel.dart';
import 'package:bks_case/core/enum.dart';
import 'package:bks_case/locator.dart';
import 'package:bks_case/services/authentication_service.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends BaseViewModel {
  final AuthenticationService? _authenticationService = locator<AuthenticationService>();

  Future<bool> registerInEmail(String email, String password) async {
    setViewState(ViewState.Busy);
    var success = await _authenticationService?.registrationWithEmail(email, password);

    if(success == null){
      print('Kullanıcı adı veya şifrenizi kontrol edin');
    }
    setViewState(ViewState.Idle);
    return success?.user !=null;
  }


  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    setViewState(ViewState.Busy);
    var success = await _authenticationService?.signInWithEmailAndPassword(email, password);

    if(success == null){
      print('Kullanıcı adı veya şifre hatalı.');
    }
    setViewState(ViewState.Idle);
    return success?.user !=null;
  }
}