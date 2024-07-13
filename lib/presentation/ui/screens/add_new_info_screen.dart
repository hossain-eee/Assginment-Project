import 'package:flutter/material.dart';
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
        child: Column(children: [ 
          //appbar 
          AppbarAddNewInfo(),
        ],),
      ),
    );
  }
}