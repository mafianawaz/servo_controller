import 'package:flutter/material.dart';
import '../../../utils/app_decorations.dart';

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
            Text("User Information",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex:2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Name",style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey),),
                      SizedBox(height: 5,),
                      Text(username,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Role",style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey),),
                      SizedBox(height: 5,),
                      Text(role,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
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
                      Text("Email",style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey),),
                      SizedBox(height: 5,),
                      Text(email,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Status",style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey),),
                      SizedBox(height: 5,),
                      Container(
                        width: 80,
                        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(status, style: TextStyle(color: Colors.white, fontSize: 12),),
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
                      Text("Last Active",style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey),),
                      SizedBox(height: 5,),
                      Text(lastActive,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Created On",style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey),),
                      SizedBox(height: 5,),
                      Text(createdOn,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
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
