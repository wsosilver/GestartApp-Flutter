import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UIHelper {
  static String formatDateFromDateTime(DateTime dateTime) {
    final day = dateTime.day.toString().padLeft(2, '0');
    final month = dateTime.month.toString().padLeft(2, '0');
    final year = dateTime.year.toString();
    return '$day/$month/$year';
  }

  static String formatDateFromDateTimeReverse(DateTime dateTime) {
    final day = dateTime.day.toString().padLeft(2, '0');
    final month = dateTime.month.toString().padLeft(2, '0');
    final year = dateTime.year.toString();
    return '$year-$month-$day';
  }

  static String formatTimeFromTimeOfDay(TimeOfDay timeOfDay) {
    final hour = timeOfDay.hour.toString().padLeft(2, '0');
    final minute = timeOfDay.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  static String formatDateTime(DateTime dateTime) {
    final day = dateTime.day.toString().padLeft(2, '0');
    final month = dateTime.month.toString().padLeft(2, '0');
    final year = dateTime.year.toString().padLeft(2, '0');
    final hour = dateTime.hour.toString().padLeft(2, '0');
    final minute = dateTime.minute.toString().padLeft(2, '0');
    return '$day/$month/$year às $hour:$minute';
  }

  static String formatDate(DateTime dateTime) {
    final day = dateTime.day.toString().padLeft(2, '0');
    final month = dateTime.month.toString().padLeft(2, '0');
    final year = dateTime.year.toString().padLeft(2, '0');
    return '$day/$month/$year';
  }

  static String formatTime(DateTime dateTime) {
    final hour = dateTime.hour.toString().padLeft(2, '0');
    final minute = dateTime.minute.toString().padLeft(2, '0');
    return ' $hour:$minute';
  }

  static String moneyFormat(double priceDouble) {
    return NumberFormat.simpleCurrency(locale: 'pt').format(priceDouble);
  }

  static String moneyFormatInt(int priceDouble) {
    return NumberFormat.simpleCurrency(locale: 'pt').format(priceDouble);
  }

  static void saveStorage(key, value1) {
    SharedPreferences.getInstance()
        .then((value) => value.setString(key, value1.toString()));
  }

  static Future<String> getStorage(key) {
    return SharedPreferences.getInstance()
        .then((value) => value.getString(key));
  }
}
