import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soft_bd/presentation/state_holder/date_controller.dart';
import 'package:soft_bd/presentation/state_holder/time_line_controller.dart';
import 'package:soft_bd/presentation/ui/screens/utility/app_color.dart';
import 'package:soft_bd/presentation/ui/widgets/appbar_widget.dart';

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
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'আজ, ${timeLineController.getBengaliDate()}',
                        style: GoogleFonts.notoSerifBengali(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColor.boldFont,
                        ),
                      ),
                      InkWell(
                        splashColor: AppColor.contentBackground,
                        borderRadius: BorderRadius.circular(30),
                        onTap: () {},
                        child: Container(
                          width: 100.w,
                          height: 50.h,
                          padding: EdgeInsets.symmetric(
                              horizontal: 6.w, vertical: 12.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: const LinearGradient(
                              colors: [
                                AppColor.linearColor1,
                                AppColor.linearColor2
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'নতুন যোগ করুন',
                            style: GoogleFonts.notoSerifBengali(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColor.navColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
