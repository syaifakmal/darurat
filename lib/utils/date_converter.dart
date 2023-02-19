import 'package:intl/intl.dart';

class DateConverter {

  ///2022-12-16 02:09:28
  ///
  ///YEAR-MONTH-DATE HOUR:MINUTE:SECOND
  static String formatDate(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd hh:mm:ss').format(dateTime);
  }

  ///16 Dec 2022
  ///
  /// DATE MONTH YEAR
  static String estimatedDate(DateTime dateTime) {
    return DateFormat('dd MMM yyyy').format(dateTime);
  }

  ///16 December 2022
  ///
  /// DATE MONTH YEAR
  static String estimatedDate2(DateTime dateTime) {
    return DateFormat('dd MMMM yyyy').format(dateTime);
  }

  ///2022-12-16 14:09:28.000
  ///
  ///YEAR-MONTH-DATE HOUR:MINUTE:SECOND
  static DateTime convertStringToDatetime(String dateTime) {
    return DateFormat("yyyy-MM-dd hh:mm:ss").parse(dateTime);
  }

  ///2022-12-16 14:09:28.000
  ///
  ///YEAR-MONTH-DATE HOUR:MINUTE:SECOND
  static DateTime isoStringToLocalDate(String dateTime) {
    return DateFormat('yyyy-MM-dd HH:mm:ss').parse(dateTime).toLocal();
  }

  ///2:09 PM | 16-Dec-2022
  ///
  ///HOUR:MINUTE AM/PM | DATE-MONTH-YEAR
  static String localDateToIsoStringAMPM(DateTime dateTime) {
    return DateFormat('h:mm a | d-MMM-yyyy ').format(dateTime.toLocal());
  }

  ///14:09
  ///
  ///HOUR:MINUTE
  static String isoStringToLocalTimeOnly(String dateTime) {
    return DateFormat('HH:mm').format(isoStringToLocalDate(dateTime));
  }

  ///16:12:22
  ///
  ///DATE:MONTH:YEAR
  static String isoStringToLocalDateOnly(String dateTime) {
    return DateFormat('dd:MM:yy').format(isoStringToLocalDate(dateTime));
  }

  ///2022-12-16 14:09:28
  ///
  ///YEAR-MONTH-DATE HOUR:MINUTE:SECOND
  static String localDateToIsoString(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime.toLocal());
  }

  ///16-Dec-2022 02:09 PM
  ///
  ///DATE-MONTH-YEAR HOUR:MINUTE AM/PM
  static String isoStringToLocalDateAndTime(String dateTime) {
    return DateFormat('dd-MMM-yyyy hh:mm a').format(isoStringToLocalDate(dateTime));
  }

  ///Jum, Des 16
  ///
  ///DAY, MONTH DATE
  static String formatDateEEEMMMd(DateTime dateTime) {
    String _locale = 'id_ID';
    return DateFormat('EEE, MMM d', _locale).format(dateTime);
  }

  ///Jum, Des 16
  ///
  ///DAY, MONTH DATE
  static String formatDateEEEMMMdHHmm(DateTime dateTime) {
    String _locale = 'id_ID';
    return DateFormat('EEEE, d MMMM HH:mm', _locale).format(dateTime);
  }
}
