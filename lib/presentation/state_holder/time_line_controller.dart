import 'package:get/get.dart';

class TimeLineController extends GetxController{
  //get todays date month name
  String englsihToBengaliDigit(int number) {
  final banglaDigits = ['০', '১', '২', '৩', '৪', '৫', '৬', '৭', '৮', '৯'];
  return number.toString().split('').map((digit) {
    final digitIndex = int.parse(digit);
    return banglaDigits[digitIndex];
  }).join('');
}

//get english month name in bengali


String getBengaliDate() {
  final now = DateTime.now();
  final banglaMonths = [
    'জানুয়ারি',
    'ফেব্রুয়ারি',
    'মার্চ',
    'এপ্রিল',
    'মে',
    'জুন',
    'জুলাই',
    'অগাস্ট',
    'সেপ্টেম্বর',
    'অক্টোবর',
    'নভেম্বর',
    'ডিসেম্বর'
  ];

  final day = englsihToBengaliDigit(now.day);
  final month = banglaMonths[now.month - 1];

  return '$day $month';
}
 

}