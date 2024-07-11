/* import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soft_bd/presentation/ui/screens/utility/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soft_bd/presentation/ui/screens/utility/image_assets.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 24.w,
        right: 24.w,
        top: 22.h,
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 120.h,
            decoration: BoxDecoration(
              color: const Color.fromARGB(1, 255, 255, 255),
              border: Border.all(
                // color: Colors.black.withOpacity(0.07),
                color: AppColor.contentBackground,
                width: 3,
              ),
              borderRadius: BorderRadius.circular(15.r),
            ),
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //User pic
                Container(
                  width: 60.w,
                  height: 60.h,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50)),
                      image: DecorationImage(
                          image: AssetImage(
                            ImageAssets.person,
                          ),
                          fit: BoxFit.contain)),
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.w,
                    vertical: 8.h,
                  ),
                ),
                //user info
                Container(
                  width: 220.w,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.w,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        child: Text(
                          'মোঃ মোহাইমেনুল রেজা',
                          style: GoogleFonts.notoSerif(
                            fontWeight: FontWeight.w700,
                            fontSize: 20.sp,
                            color: AppColor.boldFont,
                            // color: Colors.blue,
                          ),
                        ),
                      ),
                      Text(
                        'সফটবিডি লিমিটেড',
                        style: GoogleFonts.notoSerif(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          color: AppColor.normalFont,
                          // color: Colors.blue,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 16.w,
                            height: 16.h,
                            child: Image.asset(
                              ImageAssets.location,
                              width: 16.w,
                              height: 16.h,
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          Text(
                            'ঢাকা',
                            style: GoogleFonts.notoSerif(
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                              color: AppColor.normalFont,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
 */
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soft_bd/presentation/ui/screens/utility/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soft_bd/presentation/ui/screens/utility/image_assets.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.backgroundColor,
      shadowColor: AppColor.shadowColor,
      elevation: 2.sp,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
        side: BorderSide(
          color: AppColor.contentBackground,
          width: 2.w,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 12.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //User pic
            Container(
              width: 60.w,
              height: 60.h,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50)),
                  image: DecorationImage(
                      image: AssetImage(
                        ImageAssets.person,
                      ),
                      fit: BoxFit.contain)),
              padding: EdgeInsets.symmetric(
                horizontal: 8.w,
                vertical: 8.h,
              ),
            ),
            //user info
            Container(
              width: 209.w,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                horizontal: 8.w,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'মোঃ মোহাইমেনুল রেজা',
                    style: GoogleFonts.notoSerifBengali(
                      fontWeight: FontWeight.w700,
                      fontSize: 19.sp,
                      color: AppColor.boldFont,
                      // color: Colors.blue,
                    ),
                  ),
                  Text(
                    'সফটবিডি লিমিটেড',
                    style: GoogleFonts.notoSerifBengali(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: AppColor.normalFont,
                      // color: Colors.blue,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 16.w,
                        height: 20.h,
                        child: Image.asset(
                          ImageAssets.location,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      Text(
                        'ঢাকা',
                        style: GoogleFonts.notoSerifBengali(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          color: AppColor.normalFont,
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
