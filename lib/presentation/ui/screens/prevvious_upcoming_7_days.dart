import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soft_bd/presentation/state_holder/network_controller.dart';
import 'package:soft_bd/presentation/state_holder/previ_upcom_7_day_controller.dart';
import 'package:soft_bd/presentation/state_holder/time_line_controller.dart';
import 'package:soft_bd/presentation/ui/screens/utility/app_color.dart';

class PreviousAndUpcomming7Days extends StatefulWidget {
  const PreviousAndUpcomming7Days({super.key});

  @override
  State<PreviousAndUpcomming7Days> createState() =>
      _PreviousAndUpcomming7DaysState();
}

class _PreviousAndUpcomming7DaysState extends State<PreviousAndUpcomming7Days> {
  PreviUpcom7DayController controller7Days =
      Get.find<PreviUpcom7DayController>();
  TimeLineController controller = Get.find<TimeLineController>();
   final NetworkController networkController = Get.find<NetworkController>();
  @override
  void initState() {
    controller7Days.sevenDaysPreviuosUpcomingDay();
    controller7Days.getEpochTimeDate(); //current date epoch date (13-7-2024)
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(
            color: AppColor.circularBarGrey,
            width: 2,
          ),
        ),
        color: AppColor.navColor,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller7Days.totalDay.length,
            itemBuilder: (context, index) {
              var data = controller7Days.totalDay[index];
              return UnconstrainedBox(
                child: GestureDetector(
                  onTap: () {
                    //pass the date index by click, here index is nullable
                    controller7Days.getEpochTimeDate(index: index);
                    networkController.getData();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 85.h,
                    padding:
                        EdgeInsets.symmetric(horizontal: 7.w, vertical: 5.h),
                    decoration: index == 7
                        ? BoxDecoration(
                            // color: Colors.orange,
                            border: Border.all(
                                color: AppColor.linearColor1, width: 4),
                            borderRadius: BorderRadiusDirectional.vertical(
                              top: Radius.circular(30.r),
                              bottom: Radius.circular(30.r),
                            ),
                          )
                        : const BoxDecoration(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          controller7Days.getBanglaDayName(data.weekday),
                          style: GoogleFonts.notoSerifBengali(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColor.normalFont,
                          ),
                        ),
                        Text(
                          controller.englsihToBengaliDigit(data.day),
                          style: GoogleFonts.notoSerifBengali(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColor.boldFont,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
