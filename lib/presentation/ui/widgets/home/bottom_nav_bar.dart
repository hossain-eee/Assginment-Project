import 'package:flutter/material.dart';
import 'package:soft_bd/presentation/ui/screens/home_screen.dart';
import 'package:soft_bd/presentation/ui/screens/utility/app_color.dart';
import 'package:soft_bd/presentation/ui/screens/utility/image_assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 1;
  List screen = [
    HomeScreen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              currentIndex = 2;
            });
          },
          shape: const CircleBorder(),
          backgroundColor: AppColor.linearColor2,
          child: Image.asset(ImageAssets.cameraPngNav)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        height: 64.h,
        color: AppColor.navColor,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10.sp,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Padding(
          padding: EdgeInsets.only(
            bottom: 5.h,
            left: 24.w,
            right: 24.w,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 25.w,
                height: 30.h,
                child: InkWell(
                  splashColor: AppColor.contentBackground,
                  onTap: () {
                    setState(() {
                      currentIndex = 0;
                    });
                  },
                  child: Image.asset(
                    ImageAssets.homePngNav,
                    color: currentIndex == 0
                        ? AppColor.boldFont
                        : Colors.grey.shade400,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              SizedBox(
                width: 25.w,
                height: 30.h,
                child: InkWell(
                  splashColor: AppColor.contentBackground,
                  onTap: () {
                    setState(() {
                      currentIndex = 1;
                    });
                  },
                  child: Image.asset(
                    ImageAssets.calPngNav,
                    color: currentIndex == 1
                        ? AppColor.boldFont
                        : Colors.grey.shade400,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              //space for place FAB at middle
              SizedBox(
                width: 15.w,
              ),

              SizedBox(
                width: 30.w,
                height: 30.h,
                child: InkWell(
                  splashColor: AppColor.contentBackground,
                  onTap: () {
                    setState(() {
                      currentIndex = 3;
                    });
                  },
                  child: Image.asset(
                    ImageAssets.menPngNav,
                    color: currentIndex == 3
                        ? AppColor.boldFont
                        : Colors.grey.shade400,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              SizedBox(
                width: 30.w,
                height: 30.h,
                child: InkWell(
                  splashColor: AppColor.contentBackground,
                  onTap: () {
                    setState(() {
                      currentIndex = 4;
                    });
                  },
                  child: Image.asset(
                    ImageAssets.personPngNav,
                    color: currentIndex == 4
                        ? AppColor.boldFont
                        : Colors.grey.shade400,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: screen[currentIndex],
    );
  }
}
