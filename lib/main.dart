import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:servo_controller/src/module/alert/view.dart';
import 'package:servo_controller/src/module/auth/forgot_password/view.dart';
import 'package:servo_controller/src/module/auth/reset_password/view.dart';
import 'package:servo_controller/src/module/auth/view.dart';
import 'package:servo_controller/src/module/dashboard/view.dart';
import 'package:servo_controller/src/module/diagnostics/view.dart';
import 'package:servo_controller/src/module/machine_details/view.dart';
import 'package:servo_controller/src/module/machines/view.dart';
import 'package:servo_controller/src/module/qnode_details/view.dart';
import 'package:servo_controller/src/module/qnodes/view.dart';
import 'package:servo_controller/src/module/settings/view.dart';
import 'package:servo_controller/src/module/user_details/view.dart';
import 'package:servo_controller/src/module/users/view.dart';
import 'package:servo_controller/src/utils/theme.dart';
import 'package:servo_controller/src/widget/custom_sidebar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '2nd Sight',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeCollection.lightTheme,
      initialRoute: "/login",
      getPages: [
        GetPage(name: '/SideBarNavigation', page: () => const SideBarNavigation()),
        GetPage(name: "/dashboard", page: () => const DashboardView()),
        GetPage(name: "/login", page: () => const LoginView()),
        GetPage(name: "/forgotPassword", page: () => const ForgotPasswordView()),
        GetPage(name: "/resetPassword", page: () => const ResetPasswordView()),
        GetPage(name: "/UsersView", page: () => const UsersView()),
        GetPage(name: "/UsersDetails", page: () => const UsersDetails()),
        GetPage(name: "/MachineView", page: () => const MachineView()),
        GetPage(name: "/MachineDetailsView", page: () => const MachineDetailsView()),
        GetPage(name: "/QNodeView", page: () => const QNodeView()),
        GetPage(name: "/QNodeDetailView", page: () => const QNodeDetailView()),
        GetPage(name: "/DiagnosticView", page: () => const DiagnosticView()),
        GetPage(name: "/AlertView", page: () => const AlertView()),
        GetPage(name: "/SettingsView", page: () => const SettingsView()),
      ],
    );
  }
}

