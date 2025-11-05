import 'package:flutter/material.dart';
import 'package:servo_controller/src/utils/app_text_style.dart';
import 'package:servo_controller/src/utils/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  // final String username;
  // final String role;
  // final int notificationCount;

  const CustomAppBar({
    super.key,
    // required this.username,
    // required this.role,
    // required this.notificationCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 600) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Image.asset(appBarIcon),
                          SizedBox(width: 15,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Welcome back, John",
                                style: AppTextStyles.heading3.copyWith(color: primaryColor),
                              ),
                              Text(
                                "Ready to monitor your industrial systems",
                                style: AppTextStyles.regularGreyBody.copyWith(fontSize: 13),
                              ),
                            ],
                          ),
                        ],
                      ),


                    ],
                  );
                } else {
                  return Container(); // hide text on small screens
                }
              },
            ),
          ),

          // Notifications + Profile
          Row(
            children: [
              // Notification bell with badge
              Stack(
                children: [
                  IconButton(
                    icon: const Icon(Icons.notifications_none),
                    onPressed: () {},
                  ),
                  // if (notificationCount > 0)
                    Positioned(
                      right: 6,
                      top: 6,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                        child: Text(
                          "0",
                          style: AppTextStyles.regularBody.copyWith(
                              color: Colors.white, fontSize: 10),
                        ),
                      ),
                    ),
                ],
              ),

              const SizedBox(width: 10),

              // User Avatar + Info
              CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text(
                  // username.isNotEmpty
                  //     ? username[0].toUpperCase()
                       "?",
                  style: AppTextStyles.regularBody.copyWith(color: Colors.white),
                ),
              ),
              const SizedBox(width: 8),
              if (MediaQuery.of(context).size.width > 500) ...[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('John', style: AppTextStyles.regularBody.copyWith(fontWeight: FontWeight.w500)),
                    Text('Admin', style: AppTextStyles.regularGreyBody.copyWith(fontSize: 12)),
                  ],
                ),
                const Icon(Icons.arrow_drop_down),
              ],
            ],
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
