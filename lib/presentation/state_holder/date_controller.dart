import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DateController extends GetxController {
  var startDate = Rxn<DateTime>();
  var endDate = Rxn<DateTime>();

  Future<void> selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: startDate.value ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != startDate.value) {
      startDate.value = picked;
    }
  }

  Future<void> selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: endDate.value ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != endDate.value) {
      endDate.value = picked;
    }
  }

  List<String> calculateDifference() {
    if (startDate.value == null || endDate.value == null) return ['', '', '', '', '', ''];
 // DateTime start = DateTime(startDate!.year, startDate!.month, startDate!.day);
    DateTime toDay =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    int years = endDate.value!.year - toDay.year;
    int months = endDate.value!.month - toDay.month;
    int days = endDate.value!.day - toDay.day;

    // Adjust if days is negative
    if (days < 0) {
      months--;
      // days += DateTime(start.year, start.month + 1, 0).day;
      days += DateTime(toDay.year, toDay.month + 1, 0).day;
    }

    // Adjust if months is negative
    if (months < 0) {
      years--;
      months += 12;
    }


    // Decrement one day to exclude the end date(ommit last day)
    if (days > 0) {
      days--;
    } else if (months > 0) {
      months--;
      days = DateTime(toDay.year, toDay.month + 1, 0).day - 1;
    } else if (years > 0) {
      years--;
      months = 11;
      days = DateTime(toDay.year, toDay.month + 1, 0).day - 1;
    }
        // Convert to string and ensure two-digit format
/*   String y1 = years ~/ 10 == 0 ? '0' : (years ~/ 10).toString();
  String y2 = (years % 10).toString();
  String m1 = months ~/ 10 == 0 ? '0' : (months ~/ 10).toString();
  String m2 = (months % 10).toString();
  String d1 = days ~/ 10 == 0 ? '0' : (days ~/ 10).toString();
  String d2 = (days % 10).toString(); */
    String y1 = years ~/ 10 == 0 ? '০' : convertToBengaliDigits(years ~/ 10);
    String y2 = convertToBengaliDigits(years % 10);
    String m1 = months ~/ 10 == 0 ? '০' : convertToBengaliDigits(months ~/ 10);
    String m2 = convertToBengaliDigits(months % 10);
    String d1 = days ~/ 10 == 0 ? '০' : convertToBengaliDigits(days ~/ 10);
    String d2 = convertToBengaliDigits(days % 10);

    return [y1, y2, m1, m2, d1, d2];
  }

  String convertToBengaliDigits(int digit) {
    const bengaliDigits = ['০', '১', '২', '৩', '৪', '৫', '৬', '৭', '৮', '৯'];
    return bengaliDigits[digit];
  }

  String formatDate(DateTime date) {
    return DateFormat("d'ই' MMMM yyyy", 'bn_BD').format(date);
  }
}
