import 'package:architec_practice1/core/enums/view_state.dart';
import 'package:architec_practice1/core/services/authentication_api.dart';
import 'package:architec_practice1/core/view_models/base_view_model.dart';
import 'package:architec_practice1/locator.dart';
import 'package:flutter/material.dart';

class SignInViewModel extends BaseViewModel {
  final GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final AuthenticationAPI _authenticationAPI = locator<AuthenticationAPI>();

  Future<bool>? signIn() async {
    setViewState(ViewState.busy);

    int returnedValue = await _authenticationAPI.signInAPI(
        mobileNumberController.text, passwordController.text);

    setViewState(ViewState.idle);

    return returnedValue == 201 ? true : false;
  }

  String? mobileNumberValidator(String value) {
    String pattern = r'(^(01)[0-9]{9}$)';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'মোবাইল নম্বর প্রয়োজন';
    } else if (!regExp.hasMatch(value)) {
      return 'সঠিক মোবাইল নম্বর প্রদান করুন';
    }
    return null;
  }

  String? passwordValidator(String value) {
    print(value);
    String pattern = r"(^[a-zA-Z\d@%+'!#$^?:.~\-_.]{8,256}$)";
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'পাসওয়ার্ড প্রয়োজন';
    } else if (value.length < 8) {
      return 'কমপক্ষে ৮ অক্ষর বা তার বেশি প্রয়োজন';
    } else if (!regExp.hasMatch(value)) {
      return 'ভুল অক্ষর ব্যবহার করা হয়েছে';
    }

    return null;
  }
}
