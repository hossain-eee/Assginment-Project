import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soft_bd/presentation/state_holder/date_controller.dart';
import 'package:soft_bd/presentation/state_holder/time_line_controller.dart';
import 'package:soft_bd/presentation/ui/screens/utility/app_color.dart';
import 'package:soft_bd/presentation/ui/widgets/appbar_widget.dart';
import 'package:soft_bd/presentation/ui/widgets/home/time_line/head_content.dart';

class TimeLineScreen extends StatelessWidget {
  TimeLineScreen({super.key});
  final TimeLineController timeLineController = Get.find<TimeLineController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: 375.w,
        height: 812.h,
        child: Column(
          children: [
            const AppBarWidget(text: 'সময়রেখা'),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
              child: Container(
                width: 323.w,
                height: 552.h,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.orange)),
                child: Column(
                  children: [
                    HeadContentTimeLine(timeLineController: timeLineController),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      height: 86.39.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue.shade400),
                      ),
                      alignment: Alignment.center,
                      child: Text('Bengali Canlender'),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
