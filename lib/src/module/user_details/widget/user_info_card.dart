import 'package:flutter/material.dart';
import 'package:servo_controller/src/utils/constants.dart';
import '../../../utils/app_decorations.dart';
import '../../../utils/app_text_style.dart';

class UserInfoCard extends StatelessWidget {
  final String username;
  final String role;
  final String email;
  final String status;
  final String lastActive;
  final String createdOn;
  const UserInfoCard({
    super.key,
    required this.username,
    required this.role,
    required this.email,
    required this.status,
    required this.lastActive,
    required this.createdOn,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecorations.cardDecoration,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("User Information",style: AppTextStyles.heading3,),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex:2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Name",style: AppTextStyles.regularGreyBody,),
                      SizedBox(height: 5,),
                      Text(username,style: AppTextStyles.regularSansBody.copyWith(fontSize: 16),),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Role",style: AppTextStyles.regularGreySansBody,),
                      SizedBox(height: 5,),
                      Text(role,style: AppTextStyles.regularSansBody.copyWith(fontSize: 16),),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex:2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Email",style: AppTextStyles.regularGreySansBody,),
                      SizedBox(height: 5,),
                      Text(email,style: AppTextStyles.regularSansBody.copyWith(fontSize: 16)),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Status",style: AppTextStyles.regularGreySansBody,),
                      SizedBox(height: 5,),
                      Container(
                        width: 80,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                          child: Row(
                            children: [
                              Image.asset(greenDot),
                              SizedBox(width: 5,),
                              Text(status, style: AppTextStyles.regularGreySansBody.copyWith(fontSize: 12, color: Colors.white),),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex:2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Last Active",style: AppTextStyles.regularGreySansBody,),
                      SizedBox(height: 5,),
                      Text(lastActive,style: AppTextStyles.regularSansBody.copyWith(fontSize: 16),),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Created On",style: AppTextStyles.regularGreySansBody,),
                      SizedBox(height: 5,),
                      Text(createdOn,style: AppTextStyles.regularSansBody.copyWith(fontSize: 16)),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
