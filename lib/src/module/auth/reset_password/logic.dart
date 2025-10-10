import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ResetPasswordLogic extends GetxController{

  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  RxBool obscureNewPassword = true.obs;
  RxBool obscureConfirmNewPassword = true.obs;

}