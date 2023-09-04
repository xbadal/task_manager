
import 'package:intl/intl.dart';

String getDateFromMilis(int timeInMiles) {
  String date = DateFormat('dd-MM-yyyy')
      .format(DateTime.fromMillisecondsSinceEpoch(timeInMiles)); // 12/31/2000, 10:00 PM
  return date;
}
