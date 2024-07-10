import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soft_bd/presentation/ui/screens/utility/image_assets.dart';

class HomeAppbar2 extends StatelessWidget {
  const HomeAppbar2({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final heightFactor = size.height / 812;
    final widthFactor = size.width / 375;
    return Padding(
      padding: EdgeInsets.only(top: 57 * heightFactor),
      child: Container(
        width: 375 * widthFactor,
        height: 81 * heightFactor,
        padding: EdgeInsets.symmetric(
            horizontal: 24 * widthFactor, vertical: 24 * heightFactor,),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 181 * widthFactor,
              height: 37 * heightFactor,
              child: Row(
                children: [
                  SvgPicture.asset(
                    ImageAssets.menuSvg,
                    width: 24 * widthFactor,
                    height: 24 * heightFactor,
                    fit: BoxFit.cover,
                  ),
                  /*   SvgPicture.asset(
                    ImageAssets.demo1Svg,
                    width: 37.w,
                    height: 37.h,
                    // fit: BoxFit.cover,
                  ), */
                  SizedBox(
                    width: 16 * widthFactor,
                  ),
                  Image.asset(
                    ImageAssets.demo1Svg,
                    width: 36 * widthFactor,
                    height: 36 * heightFactor,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    width: 9 * widthFactor,
                  ),
                  Text(
                    'Flutter Task',
                    style: GoogleFonts.notoSerifBengali(
                      fontSize: 16 * widthFactor, // Responsive font size
                      fontWeight: FontWeight.w700,
                      height: 22.4 / 16,
                    ),
                  ),
                ],
              ),
            ),
            SvgPicture.asset(
              ImageAssets.bellSvg,
              width: 35.w,
              height: 35.h,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
