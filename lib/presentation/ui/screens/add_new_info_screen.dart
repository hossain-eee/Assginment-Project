import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soft_bd/presentation/ui/screens/utility/app_color.dart';
import 'package:soft_bd/presentation/ui/screens/utility/image_assets.dart';
import 'package:soft_bd/presentation/ui/widgets/add_new_info/appbar_add_new_info.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddNewInfoScreen extends StatelessWidget {
  const AddNewInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: 375.w,
        height: 812.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //appbar
            const AppbarAddNewInfo(),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.only(
                left: 24.w,
                right: 24.w,
                top: 5.h,
              ),
              child: SizedBox(
                width: 327.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //TextField user input
                    addNewData(),
                    SizedBox(
                      height: 20.h,
                    ),
                    InkWell(
                      onTap: () {},
                      // splashColor: AppColor.contentBackground,
                      splashColor: AppColor.contentBackground,
                      borderRadius: BorderRadius.circular(10.r),
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          gradient: const LinearGradient(
                              colors: [
                                AppColor.linearColor1,
                                AppColor.linearColor2,
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'সংরক্ষন করুন',
                          style: GoogleFonts.notoSerifBengali(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColor.navColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

//user input via TextField, its dummy that is why skip controller 
  Widget addNewData() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'অনুচ্ছেদ',
              style: GoogleFonts.notoSerifBengali(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: AppColor.boldFont,
              ),
            ),
            Text(
              '৪৫ শব্দ',
              style: GoogleFonts.notoSerifBengali(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: AppColor.boldFont,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 8.h,
        ),
        const TextField(
          decoration: InputDecoration(
            hintText: 'অনুচ্ছেদ লিখুন',
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Text(
          'অনুচ্ছেদের বিভাগ',
          style: GoogleFonts.notoSerifBengali(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: AppColor.boldFont,
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        TextField(
          decoration: InputDecoration(
            hintText: 'অনুচ্ছেদের বিভাগ নির্বাচন করুন',
            suffixIcon: IconButton(
              iconSize: 15.sp,
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_forward_ios_outlined,
                color: AppColor.hintTextColor,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Text(
          'তারিখ ও সময়',
          style: GoogleFonts.notoSerifBengali(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: AppColor.boldFont,
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        TextField(
          decoration: InputDecoration(
            hintText: 'নির্বাচন করুন',
            prefixIcon: IconButton(
                onPressed: () {}, icon: Image.asset(ImageAssets.calPngNav)),
            suffixIcon: IconButton(
              iconSize: 15.sp,
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_forward_ios_outlined,
                color: AppColor.hintTextColor,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Text(
          'স্থান',
          style: GoogleFonts.notoSerifBengali(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: AppColor.boldFont,
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        TextField(
          decoration: InputDecoration(
            hintText: 'নির্বাচন করুন',
            prefixIcon: IconButton(
                onPressed: () {}, icon: Image.asset(ImageAssets.location)),
            suffixIcon: IconButton(
              iconSize: 15.sp,
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_forward_ios_outlined,
                color: AppColor.hintTextColor,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'অনুচ্ছেদের বিবরণ',
              style: GoogleFonts.notoSerifBengali(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: AppColor.boldFont,
              ),
            ),
            Text(
              '১২০ শব্দ',
              style: GoogleFonts.notoSerifBengali(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: AppColor.boldFont,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 8.h,
        ),
        const TextField(
          maxLines: 5,
          decoration: InputDecoration(
            hintText: 'কার্যক্রমের বিবরণ লিখুন',
          ),
        ),
      ],
    );
  }
}
