import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servo_controller/src/utils/app_text_style.dart';
import 'package:servo_controller/src/utils/constants.dart';
import '../module/alert/view.dart';
import '../module/dashboard/view.dart';
import '../module/diagnostics/view.dart';
import '../module/machines/view.dart';
import '../module/qnodes/view.dart';
import '../module/settings/view.dart';
import '../module/users/view.dart';


class SideBarNavigation extends StatefulWidget {
  const SideBarNavigation({super.key});

  @override
  State<SideBarNavigation> createState() => _SideBarNavigationState();
}

class _SideBarNavigationState extends State<SideBarNavigation> {
  int _selectedIndex = 0;
  bool _isCollapsed = false;

  late final List<Widget> _rootPages;
  late final List<GlobalKey<NavigatorState>> _navigatorKeys;

  @override
  void initState() {
    super.initState();

    _rootPages = [
      DashboardView(),
      UsersView(),
      MachineView(),
      QNodeView(),
      DiagnosticView(),
      AlertView(),
      SettingsView(),

    ];

    _navigatorKeys =
        List.generate(_rootPages.length, (_) => GlobalKey<NavigatorState>());
  }

  void pushInCurrentTab(Widget page) {
    final key = _navigatorKeys[_selectedIndex];
    key.currentState?.push(MaterialPageRoute(builder: (_) => page));
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final bool isMobile = constraints.maxWidth < 600;
      final bool isTablet = constraints.maxWidth >= 600 && constraints.maxWidth < 1200;
      _isCollapsed = isTablet;

      if (isMobile) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              _getTitleForIndex(_selectedIndex),
              style: const TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.white,
            iconTheme: const IconThemeData(color: Colors.black),
          ),
          drawer: Drawer(
            width: 250,
            backgroundColor: Colors.black,
            child: _buildSidebarContent(isDrawer: true),
          ),
          body: SafeArea(child: _buildIndexedNavigators()),
        );
      }

      return Scaffold(
        body: Row(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: _isCollapsed ? 70 : 250,
              color: Colors.black,
              child: _buildSidebarContent(),
            ),
            Expanded(child: _buildIndexedNavigators()),
          ],
        ),
      );
    });
  }

  Widget _buildIndexedNavigators() {
    return IndexedStack(
      index: _selectedIndex,
      children: List.generate(_rootPages.length, (index) {
        return Navigator(
          key: _navigatorKeys[index],
          onGenerateRoute: (settings) {
            return MaterialPageRoute(builder: (_) => _rootPages[index]);
          },
        );
      }),
    );
  }

  // Widget _buildSidebarContent({bool isDrawer = false}) {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: [
  //       SingleChildScrollView(
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             DrawerHeader(
  //               child: Text('2nd Sight'),
  //             ),
  //
  //             _buildNavItem(Icons.dashboard, "Dashboard", 0),
  //             _buildNavItem(Icons.person, "Users", 1),
  //             _buildNavItem(Icons.devices, "Machines", 2),
  //             _buildNavItem(Icons.hub, "Q-Nodes", 3),
  //             _buildNavItem(Icons.build, "Diagnostics", 4),
  //             _buildNavItem(Icons.notifications, "Alerts", 5),
  //             _buildNavItem(Icons.settings, "Settings", 6),
  //           ],
  //         ),
  //       ),
  //       Container(
  //         decoration: BoxDecoration(
  //           color: Colors.grey.shade900,
  //         ),
  //         child: ListTile(
  //           leading: Icon(Icons.logout,),
  //           title: !_isCollapsed
  //               ? Text('Logout',style: TextStyle(fontWeight: FontWeight.w500,
  //             fontSize: 14,
  //             color: Colors.white),
  //           )
  //               : null,
  //           onTap: () => Get.offAllNamed('/login'),
  //         ),
  //       ),
  //     ],
  //   );
  // }
  Widget _buildSidebarContent({bool isDrawer = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Header
        SizedBox(height: 200,child: Image.asset(sideBarLogo, height: 100, width: 100,)),

        // Navigation items scroll if needed
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildNavItem(dashboard, "Dashboard", 0),
                _buildNavItem(person, "Users", 1),
                _buildNavItem(machines, "Machines", 2),
                _buildNavItem(share, "Q-Nodes", 3),
                _buildNavItem(document, "Diagnostics", 4),
                _buildNavItem(notification, "Alerts", 5),
                _buildNavItem(setting, "Settings", 6),
              ],
            ),
          ),
        ),

        // Logout always sticks to bottom ✅
        Container(
          color: Colors.grey.shade900,
          child: ListTile(
            leading:  Image.asset(logout, color: Colors.white70),
            title: !_isCollapsed
                ?  Text(
              'Logout',
              style: AppTextStyles.regularBody.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Colors.white,
              ),
            )
                : null,
            onTap: () => Get.offAllNamed('/login'),
          ),
        ),
      ],
    );
  }

  Widget _buildNavItem(String iconPath, String title, int index) {
    final bool isSelected = _selectedIndex == index;

    return Container(
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : Colors.black,
      ),
      child: ListTile(
        leading: Image.asset(iconPath,color: isSelected ? Colors.white : Colors.white70,),
        title: !_isCollapsed
            ? Text(
           title,style: AppTextStyles.regularBody.copyWith(fontWeight: FontWeight.w500,
          color: isSelected ? Colors.white : Colors.white70),
        )
            : null,
        selected: isSelected,
        onTap: () {
          if (_selectedIndex == index) {
            _navigatorKeys[index].currentState?.popUntil((r) => r.isFirst);
          } else {
            setState(() {
              _selectedIndex = index;
            });
          }

          // Close drawer in mobile mode
          if (isDrawerOpen(context)) {
            Navigator.pop(context);
          }
        },
      ),
    );
  }

  bool isDrawerOpen(BuildContext context) {
    final ScaffoldState? scaffoldState = Scaffold.maybeOf(context);
    return scaffoldState?.isDrawerOpen ?? false;
  }

  String _getTitleForIndex(int index) {
    switch (index) {
      case 0:
        return "Dashboard";
      case 1:
        return "Users";
      case 2:
        return "QNodes";
      case 3:
        return "Machines";
      case 4:
        return "Diagnostics";
      case 5:
        return "Alerts";
      case 6:
        return "Settings";
      default:
        return "";
    }
  }
}