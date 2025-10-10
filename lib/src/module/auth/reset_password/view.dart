import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servo_controller/src/widget/custom_button.dart';
import '../../../utils/strings.dart';
import '../../../widget/custom_text_form_field.dart';
import 'logic.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ResetPasswordLogic(),
      builder: (logic) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Change Password", style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700),),
                Text("Create your new password.", style: TextStyle(color: Colors.grey,fontSize: 14),),
                SizedBox(height: 40,),
                GetX<ResetPasswordLogic>(
                  initState: (_) {},
                  builder: (logic) {
                    return CustomInputTextField(
                      heading: 'New Password',
                      hintText: 'Enter Password',
                      controller: logic.newPassword,
                      obscureText:
                      logic.obscureNewPassword.value,
                      onTogglePasswordStatus: () => logic.obscureNewPassword.toggle(),
                      validate: (value) {
                        if ((value ?? "").isEmpty) {
                          return ErrorStrings.passwordReq;
                        }
                        return null;
                      },
                    );
                  },
                ),
                SizedBox(height: 10),
                GetX<ResetPasswordLogic>(
                  initState: (_) {},
                  builder: (logic) {
                    return CustomInputTextField(
                      heading: 'Confirm Password',
                      hintText: 'Re-Enter Password',
                      obscureText: logic.obscureConfirmNewPassword.value,
                      onTogglePasswordStatus: () => logic.obscureConfirmNewPassword.toggle(),
                      validate: (value) {
                        if ((value ?? "").isEmpty) {
                          return ErrorStrings.passwordReq;
                        }
                        if (value!=logic.newPassword.text) {
                          return ErrorStrings.passwordNotMatch;
                        }
                        return null;
                      },
                    );
                  },
                ),
                SizedBox(height: 20,),
                CustomButton(text: 'Change Password', onPressed: (){}),

              ],
            ),
          ),
        );
      },
    );
  }
}
