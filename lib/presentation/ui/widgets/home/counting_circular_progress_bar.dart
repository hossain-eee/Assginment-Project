import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soft_bd/presentation/state_holder/date_controller.dart';
import 'package:soft_bd/presentation/ui/screens/utility/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CountingCircularProgressBar extends StatefulWidget {
  const CountingCircularProgressBar({
    super.key,
  });

  @override
  _CountingCircularProgressBarState createState() =>
      _CountingCircularProgressBarState();
}

class _CountingCircularProgressBarState
    extends State<CountingCircularProgressBar> {
  final DateController dateController = Get.put(DateController());

  @override
  Widget build(BuildContext context) {
    //get date from dateController of getx
    /*    DateTime startDate = dateController.startDate.value ?? DateTime.now();
    DateTime endDate = dateController.endDate.value ?? DateTime.now();
    final DateTime currentDate = DateTime.now(); */
    //calculation
    // final int totalDays = endDate.difference(startDate).inDays;
    // final int elapsedDays = currentDate.difference(startDate).inDays;
    // final double progress = elapsedDays / totalDays;
    // print('toal days : $totalDays');
    // print('elapsedDays days : $elapsedDays');
    // // final int elapsedYears = (elapsedDays / 365).floor();
    // // final int remainingDaysAfterYears = elapsedDays % 365;
    // // final int elapsedMonths = (remainingDaysAfterYears / 30).floor();
    // // final int elapsedRemainingDays = remainingDaysAfterYears % 30;

    return Center(
      child: SizedBox(
        width: 120.w,
        height: 132.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              List<String> dateData =
                  dateController.calculateStartDateAndToaDay();
              return CustomPaint(
                size: Size(200.w, 200.h), // You can change the size as needed
                painter:
                    SolidCircularProgressPainter(dateController.progress.value),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (dateData[0] != '০' || dateData[1] != '০')
                        Text(
                          dateData[0].contains('০')
                              ? '${dateData[1]} বছর'
                              : '${dateData[0]}${dateData[1]} বছর',
                          style: GoogleFonts.notoSerifBengali(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColor.boldFont,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      FittedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (dateData[2] != '০' || dateData[3] != '০')
                              Text(
                                dateData[2].contains('০')
                                    ? "${dateData[3]} মাস"
                                    : '${dateData[2]}${dateData[3]} মাস',
                                style: GoogleFonts.notoSerifBengali(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.boldFont,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            SizedBox(
                              width: 4.w,
                            ),
                            if (dateData[4] != '০' || dateData[5] != '০')
                              Text(
                                dateData[4].contains('০')
                                    ? "${dateData[5]} দিন"
                                    : '${dateData[4]}${dateData[5]} দিন',
                                style: GoogleFonts.notoSerifBengali(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.boldFont,
                                ),
                                textAlign: TextAlign.center,
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class SolidCircularProgressPainter extends CustomPainter {
  final double progress;

  SolidCircularProgressPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    double strokeWidth = 12.w;
    double radius =
        (size.width / 2).r - strokeWidth; // .r comes from responsive package

    final Paint backgroundPaint = Paint()
      ..color = Colors.grey[300]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final Paint progressPaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    // Draw the background circle
    canvas.drawCircle(size.center(Offset.zero), radius, backgroundPaint);

    // Draw the progress arc
    double startAngle =
        (3.141592653589793 / 2).r; // Start from the bottom center
    double sweepAngle =
        2 * 3.141592653589793 * progress; // Sweep angle based on progress

    canvas.drawArc(
      Rect.fromCircle(center: size.center(Offset.zero), radius: radius),
      startAngle,
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
