import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servo_controller/src/widget/custom_button.dart';
import '../../../utils/strings.dart';
import '../../../widget/custom_text_form_field.dart';
import 'logic.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ForgotPasswordLogic(),
      builder: (logic) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Reset Your Password", style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700),),
                Text("Enter your work email to get a secure reset password link.", style: TextStyle(color: Colors.grey,fontSize: 14),),
                SizedBox(height: 40,),
                CustomInputTextField(
                  hintText: 'Enter your Email',
                  controller: logic.emailController,
                  heading: 'Email',
                  validate: (value) {
                    if ((value ?? "").isEmpty) {
                      return ErrorStrings.emailInvalid;
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20,),
                CustomButton(text: 'Send Link', onPressed: (){
                  Get.toNamed("/resetPassword");
                }),

              ],
            ),
          ),
        );
      },
    );
  }
}
