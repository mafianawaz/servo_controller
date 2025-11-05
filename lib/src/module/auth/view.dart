import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servo_controller/src/utils/app_text_style.dart';
import 'package:servo_controller/src/widget/custom_text_form_field.dart';
import '../../utils/constants.dart';
import '../../widget/custom_button.dart';
import 'logic.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(LoginLogic());
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 800;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: isMobile
            ? _buildFormSection(context, logic) // 📱 Mobile only form
            : Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(banner),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Center(
                child: SizedBox(
                  width: 420,
                  child: _buildFormSection(context, logic),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormSection(BuildContext context, LoginLogic logic) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(logo, height: 90),
            const SizedBox(height: 40),
            Text('Welcome Back', style: AppTextStyles.heading1,),
            const SizedBox(height: 8),
            Text('Enter your email and password to access your account',
              style: AppTextStyles.smallGreyBody.copyWith(color: secondaryColor), textAlign: TextAlign.center,),
            const SizedBox(height: 30),
            CustomInputTextField(
              heading: 'Email',
              hintText: 'Enter your Email',
              controller: logic.emailController,
              validate: (value) =>
              (value ?? '').isEmpty ? 'Email is required' : null,
            ),
            const SizedBox(height: 20),
            Obx(() {
              return CustomInputTextField(
                heading: 'Password',
                hintText: 'Enter Password',
                obscureText: logic.obscurePassword.value,
                controller: logic.passwordController,
                onTogglePasswordStatus: () => logic.obscurePassword.toggle(),
                validate: (value) =>
                (value ?? '').isEmpty ? 'Password is required' : null,
              );
            }),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() {
                  return Row(
                    children: [
                      Checkbox(
                        value: logic.rememberMe.value,
                        onChanged: (v) => logic.rememberMe.value = v ?? false,
                        activeColor: Colors.blueAccent,
                      ),
                      const Text('Remember me'),
                    ],
                  );
                }),
                TextButton(
                  onPressed: () => Get.toNamed('/forgotPassword'),
                  child:  Text('Forgot Password?', style: AppTextStyles.regularBody.copyWith(color: Colors.black),),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Obx(() {
              return CustomButton(
                text: 'Sign In',
                isLoading: logic.isLoading.value,
                onPressed: logic.isLoading.value
                    ? null
                    : () => Get.toNamed('/SideBarNavigation'),
              );
            }),
          ],
        ),
      ),
    );
  }
}
