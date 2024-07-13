import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soft_bd/presentation/state_holder/network_controller.dart';
import 'package:soft_bd/presentation/state_holder/previ_upcom_7_day_controller.dart';
import 'package:soft_bd/presentation/state_holder/time_line_controller.dart';
import 'package:soft_bd/presentation/ui/widgets/appbar_time_line.dart';
import 'package:soft_bd/presentation/ui/widgets/time_line/prevvious_upcoming_7_days.dart';
import 'package:soft_bd/presentation/ui/screens/utility/app_color.dart';
import 'package:soft_bd/presentation/ui/widgets/time_line/head_content.dart';
import 'package:soft_bd/presentation/ui/widgets/time_line/show_api_data.dart';

class TimeLineScreen extends StatefulWidget {
  TimeLineScreen({super.key});

  @override
  State<TimeLineScreen> createState() => _TimeLineScreenState();
}

class _TimeLineScreenState extends State<TimeLineScreen> {
  final TimeLineController timeLineController = Get.find<TimeLineController>();
  PreviUpcom7DayController controller7Days =
      Get.find<PreviUpcom7DayController>();
  final NetworkController networkController = Get.find<NetworkController>();
  String selectedDate = '';
  @override
  void initState() {
    //called api here to avoid unnecessary api calling, this method will run only once, insted of calling it inside Build() method.
    networkController.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // decoration: BoxDecoration(border: Border.all(color: Colors.deepOrange)),
        width: 375.w,
        height: 640.h,
        child: ListView(
          children: [
            const AppBarTimeLine(text: 'সময়রেখা'),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
              child: SizedBox(
                width: 323.w,
                height: 560.h,
                child: Column(
                  children: [
                    HeadContentTimeLine(timeLineController: timeLineController),
                    SizedBox(
                      height: 10.h,
                    ),
                    const PreviousAndUpcomming7Days(),
                    SizedBox(
                      height: 15.h,
                    ),
                    Container(
                        height: 300.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            // border: Border.all(color: Colors.red),
                            color: AppColor.navColor,
                            borderRadius: BorderRadius.circular(15.r),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(
                                    0x26000000), // This is the equivalent of #00000026
                                blurRadius: 3.r,
                                spreadRadius: 0,
                                offset: const Offset(0, 0),
                              ),
                            ]),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 10.h,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'আজকের কার্যক্রম',
                                style: GoogleFonts.notoSerifBengali(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                  color: AppColor.boldFont,
                                ),
                              ),
                              GetBuilder<NetworkController>(
                                  builder: (netCntrl) {
                                if (netCntrl.dataInProgress) {
                                  return SizedBox(
                                    height: 180.h,
                                    child: const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  );
                                }

                                return Expanded(
                                  child: GetBuilder<NetworkController>(
                                    builder: (netCntrl) {
                                      // Check if data is in progress
                                      if (netCntrl.dataInProgress) {
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }

                                      // Filtered list of items that match the date condition 
                                      var filteredData = netCntrl.dataModel.data
                                          ?.where((item) {
                                        String apiDate = controller7Days
                                            .epochToDate(int.parse(item.date!));
                                        String userSelectDate = controller7Days
                                            .userEpochTimeDate.value;
                                        selectedDate = userSelectDate;
                                        return apiDate.contains(userSelectDate);
                                      }).toList();

                                      // If filtered data is empty, show 'No data found for today'
                                      if (filteredData!.isEmpty) {
                                        return Center(
                                          child: Text(
                                              'No data found for $selectedDate'),
                                        );
                                      }

                                      // Show ListView of items that match the condition
                                      return ListView.builder(
                                        itemCount: filteredData.length,
                                        itemBuilder: (context, index) {
                                          var apiData = filteredData[index];
                                          return ShowApiData(
                                            date: apiData.date!,
                                            name: apiData.name ?? 'Unnamed',
                                            category: apiData.category!,
                                            location: apiData.location!,
                                            index: index,
                                          );
                                        },
                                      );
                                    },
                                  ),
                                );
                              }),
                            ],
                          ),
                        )),
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
