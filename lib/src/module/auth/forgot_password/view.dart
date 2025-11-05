import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servo_controller/src/utils/app_text_style.dart';
import 'package:servo_controller/src/widget/custom_button.dart';
import '../../../utils/constants.dart';
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
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(bgImage,), fit: BoxFit.cover)
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Reset Your Password", style: AppTextStyles.heading1.copyWith(color: Colors.white)),
                  Text("Enter your work email to get a secure reset password link.", style: AppTextStyles.smallGreyBody,),
                  SizedBox(height: 40,),
                  CustomInputTextField(
                    hintText: 'Enter your Email',
                    controller: logic.emailController,
                    heading: 'Email',
                    hintTextColor: Colors.white,
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
          ),
        );
      },
    );
  }
}
