import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TimeLineController extends GetxController {
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

  //epoch timestamp to Bengali Time without am/pm
  String convertTimestampToBengaliTime(int timestamp) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    DateFormat timeFormat = DateFormat(' hh:mm মি.', 'bn');

    // Format the time and convert to Bengali numerals
    String formattedTime = timeFormat.format(dateTime);

    return formattedTime;
  }

  //epoch timestamp to Bengali Time with am/pm রাত,দিন
  String convertTimestampToBengaliTimeAmPm(int timestamp) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);

    // Determine the period of the day
    String period;
    int hour = dateTime.hour;
    if (hour < 12) {
      period = 'সকাল';
    } else if (hour < 17) {
      period = 'দুপুর';
    } else if (hour < 19) {
      period = 'বিকেল';
    } else {
      period = 'রাত';
    }

    // Format the time and convert to Bengali numerals
    DateFormat timeFormat = DateFormat('hh:mm মি.', 'bn');
    String formattedTime = timeFormat.format(dateTime);

    // Combine period and formatted time
    String bengaliTime = '$period \n$formattedTime';

    return bengaliTime;
  }
}
