import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginLogic extends GetxController{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // GlobalKey<FormState> get formKey => _formKey;

  RxBool obscurePassword = true.obs;
  var rememberMe = false.obs;

  void rememberMeCheck(bool value) {
    rememberMe.value = value;
  }

  RxBool isLoading = false.obs;


}