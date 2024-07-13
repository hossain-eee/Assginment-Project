import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soft_bd/presentation/state_holder/date_controller.dart';
import 'package:soft_bd/presentation/state_holder/network_controller.dart';
import 'package:soft_bd/presentation/state_holder/time_line_controller.dart';
import 'package:soft_bd/presentation/ui/screens/utility/app_color.dart';
import 'package:soft_bd/presentation/ui/widgets/appbar_widget.dart';
import 'package:soft_bd/presentation/ui/widgets/home/time_line/head_content.dart';
import 'package:soft_bd/presentation/ui/widgets/home/time_line/show_api_data.dart';

class TimeLineScreen extends StatelessWidget {
  TimeLineScreen({super.key});
  final TimeLineController timeLineController = Get.find<TimeLineController>();
  final NetworkController networkController = Get.find<NetworkController>();
  @override
  Widget build(BuildContext context) {
    networkController.getData();
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
                    Card(
                      elevation: 1,
                      child: Container(
                        height: 86.39.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue.shade400),
                        ),
                        alignment: Alignment.center,
                        child: const Text('Bengali Canlender'),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Card(
                      elevation: 1,
                      child: Container(
                          height: 350.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              // border: Border.all(color: Colors.red),
                              color: AppColor.navColor,
                              borderRadius: BorderRadius.circular(15.r),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(
                                      0x26000000), // This is the equivalent of #00000026
                                  blurRadius: 5,
                                  spreadRadius: 0,
                                  offset: Offset(0, 0),
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
                                    return const SizedBox(
                                      height: 180,
                                      child: Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    );
                                  }
                                  return Expanded(
                                    child: ListView.builder(
                                        itemCount:
                                            netCntrl.dataModel.data?.length ??
                                                0,
                                        itemBuilder: (context, index) {
                                          var apiData = netCntrl.dataModel.data;
                                          String name =
                                              apiData?[index].name ?? 'Unnamed';
                                          String date = apiData![index].date!;
                                          String category =
                                              apiData![index].category!;
                                          String location =
                                              apiData![index].location!;
                                          // return Text(name);
                                          return ShowApiData(
                                            date: date,
                                            name: name,
                                            category: category,
                                            location: location,
                                          );
                                        }),
                                  );
                                }),
                              ],
                            ),
                          )),
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

  /*  Widget showApiData(String date, String content, int index) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      child: Container(
        width: double.infinity,
        height: 150.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.green,
            border: Border.all(color: Colors.yellowAccent)),
        child: Row(
          children: [
            Text(date),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.green,
              ),
              child: Text(content),
            ),
          ],
        ),
      ),
    );
  } */
}
