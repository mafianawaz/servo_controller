import 'package:flutter/material.dart';

import '../../../utils/app_text_style.dart';

class DiagnosticStatus extends StatelessWidget {
  final String status;
  const DiagnosticStatus({
    super.key, required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          color: status == 'Healthy' ? Colors.green : status == 'Warning' ? Colors.orange : Colors.red,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 4),
          child: Row(
            children: [
              status == 'Healthy' ?
              Icon(Icons.check_circle_outline, color: Colors.black,size: 15,):
              status == 'Warning' ?
              Icon(Icons.warning_amber_outlined, color: Colors.black,size: 15):
              Icon(Icons.error_outline, color: Colors.black,size: 15),
              SizedBox(width: 5,),
              Text(status,style: AppTextStyles.regularSansBody,)
            ],
          ),
        ),
      ),
    );
  }
}
