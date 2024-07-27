import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:track_me_updated/core/styles.dart';

class NutritionContainer extends StatelessWidget {
  const NutritionContainer(
      {super.key,
      required this.widget,
      required this.text,
      required this.remaining,
      required this.color,
      required this.percent,
      required this.nutritionController});
  final Widget widget;
  final String text;
  final String remaining;
  final Color color;
  final TextEditingController nutritionController;
  final double percent;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        {
          // showDialog(
          //     context: context,
          //     builder: (context) {
          //       return AlertDialog(
          //         title: Text(
          //           "Set your $text goal",
          //         ),
          //         content: SingleChildScrollView(
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Padding(
          //                 padding: const EdgeInsets.all(8.0),
          //                 child: Column(
          //                   children: [
          //                     Row(
          //                       mainAxisAlignment: MainAxisAlignment.start,
          //                       children: [
          //                         const Text("Amount: "),
          //                         TextField(
          //                           keyboardType:
          //                               const TextInputType.numberWithOptions(
          //                                   decimal: false),
          //                           controller: nutritionController,
          //                           decoration: InputDecoration(
          //                               constraints: BoxConstraints(
          //                                   maxWidth: screenWidth * 0.4,
          //                                   maxHeight: screenHeight * 0.04)),
          //                         ),
          //                       ],
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //         contentPadding: EdgeInsets.zero,
          //         actionsAlignment: MainAxisAlignment.spaceBetween,
          //         actions: [
          //           ElevatedButton(
          //               onPressed: () {
          //                 Navigator.of(context).pop();
          //               },
          //               style: ButtonStyle(
          //                   shape: MaterialStatePropertyAll(
          //                       RoundedRectangleBorder(
          //                           borderRadius: BorderRadius.circular(20),
          //                           side: const BorderSide(color: Colors.red))),
          //                   backgroundColor:
          //                       const MaterialStatePropertyAll(Colors.white)),
          //               child: Text("Close",
          //                   style: GoogleFonts.itim(color: Colors.red))),
          //           ElevatedButton(
          //               onPressed: () async {
          //                await NutritionCubit.get(context).updateNutritionData(
          //                     {text: int.parse(nutritionController.text)});
          //                await NutritionCubit.get(context).receiveNutrition();
          //                 Navigator.of(context).pop();
          //               },
          //               style: const ButtonStyle(
          //                   backgroundColor:
          //                       MaterialStatePropertyAll(Colors.red)),
          //               child: Text(
          //                 "Update",
          //                 style: GoogleFonts.itim(color: Colors.white),
          //               ))
          //         ],
          //       );
          //     });
        }
      },
      child: Container(
          height: 80.h,
          width: 165.w,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    widget,
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      text,
                      style: TextStyles.body16Dark,
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(remaining, style: TextStyles.body12Dark),
                  ],
                ),
                LinearPercentIndicator(
                  alignment: MainAxisAlignment.center,
                  barRadius: const Radius.circular(8),
                  width: 135.w,
                  lineHeight: 8.0,
                  percent: percent,
                  progressColor: Colors.white,
                ),
              ],
            ),
          )),
    );
  }
}
