import 'package:intl/intl.dart';

class DateTimeFormatter {
  /// تنسيق التاريخ كـ: 2026/04/15
  static String formatToYMD(DateTime date) {
    return DateFormat('yyyy/MM/dd').format(date);
  }

  static String formatToFullDate(DateTime date, {String locale = 'en'}) {
    return DateFormat.yMMMMd(locale).format(date);
  }

  /// تنسيق الوقت: 10:30 PM
  static String formatToTime(DateTime date) {
    return DateFormat.jm().format(date);
  }

  /// تنسيق "منذ متى" (Time Ago) بشكل مبسط
  /// مثال: "منذ 5 دقائق" أو "Yesterday"
  static String formatTimeAgo(DateTime date) {
    final Duration diff = DateTime.now().difference(date);

    if (diff.inDays > 7) {
      return formatToYMD(date);
    } else if (diff.inDays >= 1) {
      return '${diff.inDays} day(s) ago';
    } else if (diff.inHours >= 1) {
      return '${diff.inHours} hour(s) ago';
    } else if (diff.inMinutes >= 1) {
      return '${diff.inMinutes} minute(s) ago';
    } else {
      return 'Just now';
    }
  }

  /// تحويل النص (String) القادم من الـ API إلى كائن DateTime
  static DateTime? parseString(String? dateStr) {
    if (dateStr == null) return null;
    return DateTime.tryParse(dateStr);
  }
}

extension DateTimeEx on DateTime {
  String get toTimeStr => DateTimeFormatter.formatToTime(this);
  String get toDateStr => DateTimeFormatter.formatToYMD(this);
  String get timeAgo => DateTimeFormatter.formatTimeAgo(this);
}