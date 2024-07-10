import 'package:flutter/material.dart';
import 'package:soft_bd/presentation/ui/widgets/home/home_appBar_2.dart';
import 'package:soft_bd/presentation/ui/widgets/home/home_appbar.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          HomeAppbar(),
          // HomeAppbar2(),
         
        ],
      ),
    );
  }
}
