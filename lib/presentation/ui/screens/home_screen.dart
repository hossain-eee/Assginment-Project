import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soft_bd/presentation/state_holder/date_controller.dart';
import 'package:soft_bd/presentation/ui/screens/utility/app_color.dart';
import 'package:soft_bd/presentation/ui/screens/utility/image_assets.dart';
import 'package:soft_bd/presentation/ui/widgets/home/counting_circular_progress_bar.dart';
import 'package:soft_bd/presentation/ui/widgets/home/date_range_picker.dart';
import 'package:soft_bd/presentation/ui/widgets/appbar_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soft_bd/presentation/ui/widgets/home/home_category.dart';
import 'package:soft_bd/presentation/ui/widgets/home/user_info.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final DateController dateController = Get.put(DateController());
  @override
  Widget build(BuildContext context) {
    final List<String> contentIcon = [
      ImageAssets.personIconPng,
      ImageAssets.homeIcon,
      ImageAssets.wheelChairPng,
      ImageAssets.gamesPng,
      ImageAssets.folder2Png,
      ImageAssets.notePng,
    ];
    return Scaffold(
      body: SizedBox(
        width: 375.w,
        height: 812.h,
        child: Column(
          children: [
            const AppBarWidget(
              image: ImageAssets.demo1Svg,
              text: 'Flutter Task',
            ),
            // HomeAppbar2(),
            // content
            Padding(
              padding: EdgeInsets.only(
                left: 24.w,
                right: 24.w,
                top: 5.h,
              ),
              child: Container(
                width: 327.w,
                height: 510.h,
                /*    decoration: BoxDecoration(
                  border: Border.all(color: Colors.red),
                ), */
                child: Column(
                  children: [
                    UserInfo(),
                    SizedBox(
                      height: 10.h,
                    ),
                    //timer section
                    Padding(
                      padding: EdgeInsets.only(top: 1.h),
                      child: Row(
                        children: [
                          const CountingCircularProgressBar(),
                          SizedBox(
                            width: 5.w,
                          ),
                          DateRangePicker(),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Expanded(
                      child: GridView.builder(
                          padding: EdgeInsets.only(left: 4.w),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 5.h,
                            crossAxisSpacing: 15.h,
                          ),
                          itemCount: contentIcon.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              splashColor: AppColor.contentBackground,
                              onTap: () {
                                print('Clicked on Menu No :${index + 1}');
                              },
                              child: HomeCategory(
                                index: dateController
                                    .convertToBengaliDigits(index + 1),
                                imagePath: contentIcon[index],
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
/* 
            SizedBox(
              height: 16.h,
            ),

            Container(),
            //bottomNavAppbar
            SizedBox(
              height: 20.h,
            ), */
          ],
        ),
      ),
    );
  }
}
