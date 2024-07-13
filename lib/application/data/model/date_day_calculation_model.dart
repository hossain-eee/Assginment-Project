
// current date to 7 days previous and 7 days next/future date and day
class DateDayCalculationModel {
  final int day; // date 
  final int weekday; // sat,sun
  final int epochTime; 
  DateDayCalculationModel(
      {required this.day, required this.weekday, required this.epochTime});
}
