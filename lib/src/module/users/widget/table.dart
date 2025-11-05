import 'package:flutter/material.dart';
import 'package:servo_controller/src/utils/app_text_style.dart';

// class CustomTable extends StatelessWidget {
//   final List<String> headers;
//   final List<List<Widget>> rows;
//   final VoidCallback? onPressed;
//
//   const CustomTable({
//     super.key,
//     required this.headers,
//     required this.rows,
//     this.onPressed,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: Colors.grey.shade200),
//       ),
//       child: Column(
//         children: [
//           // Header row
//           Container(
//             padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
//             decoration: BoxDecoration(
//               border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
//             ),
//             child: Row(
//               children: headers.map((h) => Expanded(
//                 child: Text(
//                   h,
//                   style: const TextStyle(
//                     fontWeight: FontWeight.w400,
//                     color: Colors.black87,
//                   ),
//                 ),
//               )).toList(),
//             ),
//           ),
//           // Data rows
//           ...rows.map((cells) {
//             return Container(
//               padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
//               decoration: BoxDecoration(
//                 border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
//               ),
//               child: GestureDetector(
//                 onTap: onPressed,
//                 child: Row(
//                   children: cells
//                       .map((c) => Expanded(child: c))
//                       .toList(),
//                 ),
//               ),
//             );
//           }),
//         ],
//       ),
//     );
//   }
// }
//
//
// Widget buildResponsiveTable(Widget table, BuildContext context) {
//   final width = MediaQuery.of(context).size.width;
//   final scrollController = ScrollController(); // <-- create controller
//
//   return LayoutBuilder(
//     builder: (context, constraints) {
//       return Scrollbar(
//         controller: scrollController,      // <-- attach controller
//         thumbVisibility: true,
//         child: SingleChildScrollView(
//           controller: scrollController,   // <-- same controller here
//           scrollDirection: Axis.horizontal,
//           child: ConstrainedBox(
//             constraints: BoxConstraints(
//               minWidth: width.clamp(0, 1400),
//               maxWidth: 1400,
//             ),
//             child: SingleChildScrollView(
//               scrollDirection: Axis.vertical,
//               child: table,
//             ),
//           ),
//         ),
//       );
//     },
//   );
// }


class CustomTable extends StatelessWidget {
  final List<String> headers;
  final List<List<Widget>> rows;
  final VoidCallback? onPressed;

  const CustomTable({
    super.key,
    required this.headers,
    required this.rows,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: isMobile
          ? _buildMobileLayout(context)   // ✅ Vertical stacked cards
          : _buildDesktopLayout(context), // ✅ Normal table layout
    );
  }

  /// ✅ Desktop Table View
  Widget _buildDesktopLayout(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
          ),
          child: Row(
            children: headers
                .map((h) => Expanded(
                child: Text(
                  h,
                  style: AppTextStyles.regularGreyBody.copyWith(
                      fontWeight: FontWeight.w500,fontSize: 14),
                )))
                .toList(),
          ),
        ),
        ...rows.map((cells) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
            ),
            child: GestureDetector(
              onTap: onPressed,
              child: Row(
                children:
                cells.map((c) => Expanded(child: c)).toList(),
              ),
            ),
          );
        }),
      ],
    );
  }

  /// ✅ Mobile Vertical Card View
  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: rows.map((cells) {
        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(cells.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: GestureDetector(
                  onTap: onPressed,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          headers[index],
                          style: AppTextStyles.regularGreyBody,),
                      ),
                      Expanded(flex: 5, child: cells[index]),
                    ],
                  ),
                ),
              );
            }),
          ),
        );
      }).toList(),
    );
  }
}

Widget buildResponsiveTable(Widget table, BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height; // ✅ Added height reference
  final scrollController = ScrollController();
  final isMobile = width < 800;

  if (isMobile) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: table,
    );
  }

  return Scrollbar(
    controller: scrollController,
    thumbVisibility: true,
    child: SingleChildScrollView(
      controller: scrollController,
      scrollDirection: Axis.horizontal,
      child: ConstrainedBox(
        constraints: BoxConstraints(minWidth: width),
        child: SizedBox(
          height: height * 0.70, // ✅ Give vertical constraint!
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: table,
          ),
        ),
      ),
    ),
  );
}
