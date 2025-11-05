import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../../utils/app_decorations.dart';
import '../../../utils/app_text_style.dart';
import '../../../utils/constants.dart';
import '../../../widget/custom_dropdown_button.dart';
import '../../../widget/custom_text_form_field.dart';
import '../../../widget/responsive_grid.dart';
import '../logic.dart';

class UserManagementCard extends StatelessWidget {
  final SettingsLogic logic;

  const UserManagementCard({
    super.key, required this.logic,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecorations.cardDecoration,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Image.asset(users,color: Colors.black,),
              title: Text("Users Role Management",style: AppTextStyles.heading3,),
            ),
            SizedBox(height: 5,),
            Text("Define custom permissions and roles for users",style: AppTextStyles.regularGreySansBody,),
            SizedBox(height: 20,),
            ResponsiveGrid(
              spacing: 20,
              mobileCrossAxisCount: 1,
              tabletCrossAxisCount: 1,
              desktopCrossAxisCount: 2,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Obx(() => CustomDropdown<String>(
                    items: ["Admin", "Viewer", "Technician"],
                    value: logic.selectedUserValue.value,
                    itemLabel: (item) => item,
                    onChanged: (val) {
                      logic.selectedUserValue.value = val;
                    },
                    hintText: "All Roles",
                    heading: 'Default User Role',
                  )),
                ),
                CustomInputTextField(heading: 'Max Concurrent Users',hintText: '50',controller: logic.maxUserController,)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
