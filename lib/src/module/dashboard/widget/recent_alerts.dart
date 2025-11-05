import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servo_controller/src/module/dashboard/logic.dart';
import 'package:servo_controller/src/widget/custom_outline_button.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../../utils/app_decorations.dart';
import '../../../utils/app_text_style.dart';



class RecentAlerts extends StatelessWidget {
  final DashboardLogic logic;
  const RecentAlerts({super.key, required this.logic});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isMobile = width < 600;
    final bool isTablet = width >= 600 && width < 1024;

    final double fontSizeText = isMobile ? 12 : isTablet ? 13 : 14;
    final double paddingValue = isMobile ? 10 : 15;

    return Container(
      decoration: AppDecorations.cardDecoration,
      padding: EdgeInsets.all(paddingValue),
      child: Obx(() {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recent Alerts",
                    style: AppTextStyles.heading3,
                  ),
                  if (logic.newAlertsCount > 0)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        "${logic.newAlertsCount} New",
                        style: AppTextStyles.regularSansBody.copyWith(fontSize: fontSizeText, color: Colors.grey.shade700,),
                      ),
                    ),
                ],
              ),
              SizedBox(height: isMobile ? 10 : 16),

              // Alerts List (not fixed height anymore)
              ListView.builder(
                itemCount: logic.alerts.length,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final alert = logic.alerts[index];

                  return GestureDetector(
                    onTap: () => logic.markAsRead(index),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 6),
                      decoration: BoxDecoration(
                        color: alert.isNew
                            ? Colors.blue.shade50
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade200, width: 1),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: isMobile ? 8 : 10,
                          horizontal: isMobile ? 8 : 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Time info
                                Expanded(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(Icons.access_time, size: 16, color: Colors.blueGrey),
                                      const SizedBox(width: 6),
                                      Flexible(
                                        child: Text(
                                          timeago.format(alert.time),
                                          style: AppTextStyles.regularSansBody.copyWith(
                                            fontSize: fontSizeText,
                                            color: Colors.blueGrey,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                const SizedBox(width: 8),

                                // Type badge (wraps automatically)
                                Flexible(
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: isMobile ? 8 : 10, vertical: 3),
                                    decoration: BoxDecoration(
                                      color: alert.color.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      alert.type,
                                      style: AppTextStyles.regularSansBody.copyWith(
                                        color: alert.color,
                                        fontSize: fontSizeText - 1,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: isMobile ? 6 : 10),

                            // Message
                            Text(
                              alert.message,
                              style: AppTextStyles.regularSansBody.copyWith(fontSize: fontSizeText,),
                            ),
                            SizedBox(height: isMobile ? 6 : 10),
                            // New Indicator Dot
                            if (alert.isNew)
                              Container(
                                width: 8,
                                height: 8,
                                decoration: const BoxDecoration(
                                  color: Colors.blue,
                                  shape: BoxShape.circle,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),

              SizedBox(height: isMobile ? 8 : 12),

              // View All Button
              Center(
                child: CustomOutlineButton(
                  text: 'View All Alerts',
                  onPressed: () {},
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
