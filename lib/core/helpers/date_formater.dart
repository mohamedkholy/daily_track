

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String formatDateToString(DateTime dateTime){
  return DateFormat("MMMM d, y").format(dateTime);
}

DateTime formatStringToDate(String date){
  return DateFormat("MMMM d, y").parse(date);
}

int daysUntilToday(DateTime startDate){
      return DateUtils.dateOnly(
        DateTime.now(),
      ).difference(startDate).inDays +
          1;
}