/* import 'package:flutter/material.dart';
import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:intl/intl.dart';

class CountdownCircularProgressBar extends StatefulWidget {
  @override
  _CountdownCircularProgressBarState createState() => _CountdownCircularProgressBarState();
}

class _CountdownCircularProgressBarState extends State<CountdownCircularProgressBar> {
  final DateTime futureDate = DateTime(2043, 7, 31);

  @override
  Widget build(BuildContext context) {
    final DateTime currentDate = DateTime.now();
    final int totalDays = futureDate.difference(currentDate).inDays;
    final int elapsedDays = DateTime.now().difference(currentDate).inDays;
    final double progress = elapsedDays / totalDays;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DashedCircularProgressBar.aspectRatio(
            aspectRatio: 1,
            progress: progress,
            maxProgress: 1.0,
            backgroundColor: Colors.grey[300]!,
            foregroundColor: Colors.blue,
        
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$elapsedDays days passed',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Total days: $totalDays',
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Target Date: ${DateFormat('d MMMM yyyy').format(futureDate)}',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}

 */

/* import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CountdownCircularProgressBar extends StatefulWidget {
  @override
  _CountdownCircularProgressBarState createState() =>
      _CountdownCircularProgressBarState();
}

class _CountdownCircularProgressBarState
    extends State<CountdownCircularProgressBar> {
  final DateTime startDate = DateTime(2024, 1, 1);
  final DateTime endDate = DateTime(2030, 1, 1);

  @override
  Widget build(BuildContext context) {
    final DateTime currentDate = DateTime.now();
    final int totalDays = endDate.difference(startDate).inDays;
    final int elapsedDays = currentDate.difference(startDate).inDays;
    final double progress = elapsedDays / totalDays;

    final int elapsedYears = (elapsedDays / 365).floor();
    final int remainingDaysAfterYears = elapsedDays % 365;
    final int elapsedMonths = (remainingDaysAfterYears / 30).floor();
    final int elapsedRemainingDays = remainingDaysAfterYears % 30;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomPaint(
            size: Size(200, 200), // You can change the size as needed
            painter: SolidCircularProgressPainter(progress),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$elapsedYears years $elapsedMonths months $elapsedRemainingDays days',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Total days: $totalDays',
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Target Date: ${DateFormat('d MMMM yyyy').format(endDate)}',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}

class SolidCircularProgressPainter extends CustomPainter {
  final double progress;

  SolidCircularProgressPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    double strokeWidth = 8;
    double radius = (size.width / 2) - strokeWidth;

    final Paint backgroundPaint = Paint()
      ..color = Colors.grey[300]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final Paint progressPaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    // Draw the background circle
    canvas.drawCircle(size.center(Offset.zero), radius, backgroundPaint);

    // Draw the progress arc
    double startAngle = -3.141592653589793 / 2; // Start from the top
    double sweepAngle =
        2 * 3.141592653589793 * progress; // Sweep angle based on progress

    canvas.drawArc(
      Rect.fromCircle(center: size.center(Offset.zero), radius: radius),
      startAngle,
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
 */
import 'package:flutter/material.dart';

class CountingCircularProgressBar extends StatefulWidget {
  const CountingCircularProgressBar(
      {super.key, required this.startDate, required this.endDate});

  @override
  _CountingCircularProgressBarState createState() =>
      _CountingCircularProgressBarState();
  final DateTime startDate;
  final DateTime endDate;
}

class _CountingCircularProgressBarState
    extends State<CountingCircularProgressBar> {
  // final DateTime startDate = DateTime(2024, 10, 1);
  // final DateTime endDate = DateTime(2030, 1, 1);

  @override
  Widget build(BuildContext context) {
    final DateTime currentDate = DateTime.now();
    final int totalDays = widget.endDate.difference(widget.startDate).inDays;
    final int elapsedDays = currentDate.difference(widget.startDate).inDays;
    final double progress = elapsedDays / totalDays;

    final int elapsedYears = (elapsedDays / 365).floor();
    final int remainingDaysAfterYears = elapsedDays % 365;
    final int elapsedMonths = (remainingDaysAfterYears / 30).floor();
    final int elapsedRemainingDays = remainingDaysAfterYears % 30;

    return Center(
      child: SizedBox(
        width: 145,
        height: 132,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomPaint(
              size: Size(200, 200), // You can change the size as needed
              painter: SolidCircularProgressPainter(progress),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (elapsedYears != 0)
                      Text(
                        '$elapsedYears years',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    if (elapsedMonths != 0)
                      Text(
                        '$elapsedMonths months',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    if (elapsedRemainingDays != 0)
                      Text(
                        '$elapsedRemainingDays days',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
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
}

class SolidCircularProgressPainter extends CustomPainter {
  final double progress;

  SolidCircularProgressPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    double strokeWidth = 14;
    double radius = (size.width / 2) - strokeWidth;

    final Paint backgroundPaint = Paint()
      ..color = Colors.grey[300]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final Paint progressPaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    // Draw the background circle
    canvas.drawCircle(size.center(Offset.zero), radius, backgroundPaint);

    // Draw the progress arc
    double startAngle = 3.141592653589793 / 2; // Start from the bottom center
    double sweepAngle =
        2 * 3.141592653589793 * progress; // Sweep angle based on progress

    canvas.drawArc(
      Rect.fromCircle(center: size.center(Offset.zero), radius: radius),
      startAngle,
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
