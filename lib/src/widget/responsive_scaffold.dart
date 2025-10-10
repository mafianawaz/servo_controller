import 'package:flutter/material.dart';

import 'custom_appbar.dart';
import 'custom_sidebar.dart';

class ResponsiveScaffold extends StatelessWidget {
  final Widget body;
  // final String username;
  // final String role;
  // final int notificationCount;

  const ResponsiveScaffold({
    super.key,
    required this.body,
    // required this.username,
    // required this.role,
    // required this.notificationCount,
  });

  @override
  Widget build(BuildContext context) {
    bool isLargeScreen = MediaQuery.of(context).size.width >= 900;

    return Scaffold(
      drawer: !isLargeScreen
          ? Drawer(
        child: SideBar(),
      )
          : null,
      appBar: !isLargeScreen
          ? CustomAppBar(
        // username: username,
        // role: role,
        // notificationCount: notificationCount,
      )
          : null,
      body: Row(
        children: [
          // Fixed Sidebar for Large Screens
          if (isLargeScreen) ...[
            SizedBox(
              width: 280,
              child: SideBar(),
            ),
          ],

          // Main Content
          Expanded(
            child: Column(
              children: [
                if (isLargeScreen)
                  CustomAppBar(
                    // username: username,
                    // role: role,
                    // notificationCount: notificationCount,
                  ),
                Expanded(child: body),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
