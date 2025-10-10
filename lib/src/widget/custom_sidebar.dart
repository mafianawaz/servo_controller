import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SideBarController extends GetxController {
  var selectedIndex = 0.obs;
  var isCollapsed = false.obs;

  void selectItem(int index) {
    selectedIndex.value = index;
    // Navigate based on index
    switch (index) {
      case 0:
        Get.toNamed("/dashboard");
        break;
      case 1:
        Get.toNamed("/UsersView");
        break;
      case 2:
        Get.toNamed("/MachineView");
        break;
      case 3:
        Get.toNamed("/QNodeView");
        break;
      case 4:
        Get.toNamed("/DiagnosticView");
        break;
      case 5:
        Get.toNamed("/AlertView");
        break;
      case 6:
        Get.toNamed("/SettingsView");
        break;
    }
  }

  void toggleCollapse() {
    isCollapsed.value = !isCollapsed.value;
  }
}

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SideBarController());

    final menuItems = [
      {"icon": Icons.dashboard, "label": "Dashboard"},
      {"icon": Icons.person, "label": "Users"},
      {"icon": Icons.devices, "label": "Machines"},
      {"icon": Icons.hub, "label": "Q-Nodes"},
      {"icon": Icons.build, "label": "Diagnostics"},
      {"icon": Icons.notifications, "label": "Alerts"},
      {"icon": Icons.settings, "label": "Settings"},
    ];

    return Obx(() {
      bool collapsed = controller.isCollapsed.value;

      return AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: collapsed ? 70 : 220,
        color: Colors.black,
        child: Column(
          children: [
            // 🔹 Logo + Collapse Button
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: collapsed
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.spaceBetween,
                children: [
                  if (!collapsed)
                    // Image.asset("assets/logo.png", height: 40),
                    Icon(Icons.menu, size: 24, color: Colors.white70),
                  IconButton(
                    icon: Icon(
                      collapsed ? Icons.arrow_forward_ios : Icons.arrow_back_ios,
                      size: 16,
                      color: Colors.white70,
                    ),
                    onPressed: controller.toggleCollapse,
                  ),
                ],
              ),
            ),

            // 🔹 Menu Items
            Expanded(
              child: ListView.builder(
                itemCount: menuItems.length,
                itemBuilder: (context, index) {
                  final isSelected = controller.selectedIndex.value == index;
                  return InkWell(
                    onTap: () => controller.selectItem(index),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.blue : Colors.transparent,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: ListTile(
                        leading: Icon(
                          menuItems[index]["icon"] as IconData,
                          color: isSelected ? Colors.white : Colors.white70,
                        ),
                        title: collapsed
                            ? null
                            : Text(
                          menuItems[index]["label"] as String,
                          style: TextStyle(
                            color: isSelected
                                ? Colors.white
                                : Colors.white70,
                            fontWeight:
                            isSelected ? FontWeight.bold : null,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const Divider(color: Colors.white24),

            // 🔹 Logout
            Padding(
              padding: const EdgeInsets.all(12),
              child: ElevatedButton.icon(
                onPressed: () => Get.offAllNamed("/login"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade900,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                icon: const Icon(Icons.logout),
                label: collapsed ? const SizedBox() : const Text("Logout"),
              ),
            ),
          ],
        ),
      );
    });
  }
}
