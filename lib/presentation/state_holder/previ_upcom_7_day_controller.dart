import 'package:get/get.dart';
import 'package:soft_bd/application/data/model/date_day_calculation_model.dart';

class PreviUpcom7DayController extends GetxController{
    List<DateDayCalculationModel> _totalDay = []; //previousAndUpcomming7Days, total 15 days
  List<DateDayCalculationModel> get totalDay => _totalDay;
  //convert milliSecondSinceEpoch to Epoch Second
  int milliSecEpochToEpoch(int millisecondsSinceEpoch) {
    int epochTimeInMilliseconds = millisecondsSinceEpoch;
    int epochTimeInSeconds = (epochTimeInMilliseconds / 1000)
        .round(); // Use round to get an integer value
    
    return epochTimeInSeconds;// Output will be the epoch time in seconds
  }

  void sevenDaysPreviuosUpcomingDay() {
    List<DateDayCalculationModel> sevenDayBack = [];
    List<DateDayCalculationModel> sevenDayUpcoming = [];

    DateTime toDay = DateTime.now();
    //7 days previous from to day
    for (int i = 7; i >= 1; i--) {
      int day = toDay.subtract(Duration(days: i)).day; // date
      int weekday = toDay.subtract(Duration(days: i)).weekday; // sat, sun...
      int epochTime = milliSecEpochToEpoch(
          toDay.subtract(Duration(days: i)).millisecondsSinceEpoch);
      //data store in array list
      sevenDayBack.add(DateDayCalculationModel(
          day: day, weekday: weekday, epochTime: epochTime));
    }
    //Present date to next 7 days including today so, we will cont 0 which will give present day
    for (int i = 0; i <= 7; i++) {
      //i=0 means today
      int day = toDay.add(Duration(days: i)).day; // date
      int weekday = toDay.add(Duration(days: i)).weekday; // sat, sun...
      int epochTime = milliSecEpochToEpoch(
          toDay.add(Duration(days: i)).millisecondsSinceEpoch);

      //data store in array list
      sevenDayUpcoming.add(DateDayCalculationModel(
          day: day, weekday: weekday, epochTime: epochTime));
    }

    //now merge tow array list into one list
    _totalDay = [...sevenDayBack, ...sevenDayUpcoming];
  }
  //DateTime.now().day--first day is Mon and last day is sun
    String getBanglaDayName(int weekday) {
    switch (weekday) {
      
      case 1:
        return 'সোম';
      case 2:
        return 'মঙ্গল';
      case 3:
        return 'বুধ';
      case 4:
        return 'বৃহস্পতি';
      case 5:
        return 'শুক্র';
      case 6:
        return 'শনি';
        case 7:
        return 'রবি';
      default:
        return '';
    }
  }
}