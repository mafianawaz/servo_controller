import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servo_controller/src/utils/responsive.dart';
import 'package:servo_controller/src/widget/custom_text_form_field.dart';
import '../../utils/constants.dart';
import '../../utils/strings.dart';
import '../../widget/custom_button.dart';
import 'logic.dart';


class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final r = context.responsive;
    return GetBuilder(
      init: LoginLogic(),
      builder: (logic) {
        return Scaffold(
          body: Row(
            children: [
              Expanded(child: Column(
                children: [

                ],
              ),),
              SizedBox(width: 20,),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 50,),
                  Text("Welcome Back", style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700),),
                  Text("Enter your email and password to access your account", style: TextStyle(color: Colors.grey,fontSize: 10),),
                  SizedBox(height: 20,),
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
                  GetX<LoginLogic>(
                    initState: (_) {},
                    builder: (logic) {
                      return CustomInputTextField(
                        heading: 'Password',
                        hintText: 'Enter Password',
                        obscureText: logic.obscurePassword.value,
                        controller: logic.passwordController,
                        onTogglePasswordStatus: () => logic.obscurePassword.toggle(),
                        validate: (value) {
                          if ((value ?? "").isEmpty) {
                            return ErrorStrings.passwordReq;
                          }
                          return null;
                        },
                      );
                    },
                  ),
                  SizedBox(height: 20,),
                  SizedBox(
                    width: r.wp(r.isMobile ? 80 : 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Obx((){
                              return Checkbox(
                                value: logic.rememberMe.value,
                                onChanged: (value) {
                                  logic.rememberMe.value = value ?? false;
                                },
                                activeColor: primaryColor,
                              );
                            }),
                            Text('Remember me', style: TextStyle(
                                fontSize: 14
                            ),),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            Get.toNamed("/forgotPassword");
                          },
                          child:
                          Text('Forgot Password?',
                            style: TextStyle(
                                fontSize: 14,
                                color: primaryColor
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Obx(() {
                    return CustomButton(
                      text: 'Sign in',
                      isLoading: logic.isLoading.value,
                      onPressed: logic.isLoading.value ? null : () {
                        Get.toNamed("/dashboard");
                      },
                    );
                  }),
                ],
              ),),
            ],
          ),
        );
      },
    );
  }
}
