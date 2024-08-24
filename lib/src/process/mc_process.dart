import 'dart:io';
import 'dart:ui';
import 'package:intl/intl.dart' as intl;

class McProcess {
  static String getFileType(String fileName) {
    // Get the file extension
    String extension = fileName.split('.').last.toLowerCase();

    // Check for image types
    if (extension == 'jpg' ||
        extension == 'jpeg' ||
        extension == 'png' ||
        extension == 'gif' ||
        extension == 'bmp' ||
        extension == 'webp') {
      return 'image';
    }

    // Check for video types
    if (extension == 'mp4' ||
        extension == 'mov' ||
        extension == 'avi' ||
        extension == 'wmv' ||
        extension == 'flv' ||
        extension == 'mkv') {
      return 'video';
    }

    // Check for document types
    if (extension == 'pdf' ||
        extension == 'docx' ||
        extension == 'pptx' ||
        extension == 'ppt' ||
        extension == 'xls' ||
        extension == 'xlsx' ||
        extension == 'txt' ||
        extension == 'rtf' ||
        extension == 'csv' ||
        extension == 'html' ||
        extension == 'xml' ||
        extension == 'json') {
      return 'document';
    }

    // Default to unknown type
    return 'unknown';
  }

  static TextDirection alignTxtMessage(String txt) {
    TextDirection? align;

    RegExp englishRegex = RegExp(r'[a-zA-Z]');
    if (englishRegex.hasMatch(txt)) {
      align = TextDirection.ltr;

      // set the text direction to RTL if line contains Arabic
    } else {
      align = TextDirection.rtl;
    }

    return align;
  }

  static bool checkFile(File pathFile) {
    if (pathFile.existsSync()) {
      return true;
    } else {
      return false;
    }
  }

  static bool checkIsNumirc(String txt) {
    RegExp regExp = RegExp(r'^\d+$');
    bool isNum = regExp.hasMatch(txt);
    return isNum;
  }

  static bool containsArabicLettersOrSpacesOrUnallowedSymbols(String text) {
    // Regular expression that matches Arabic characters, spaces, or unallowed symbols
    RegExp regex = RegExp(r'[\u0600-\u06FF\s]|[^\w-_]');

    // Returns true if the text contains Arabic letters, spaces, or unallowed symbols
    return regex.hasMatch(text);
  }

  static String changeTxtToDate(DateTime dateTime) {
    DateTime now = DateTime.now();
    final int differenceInSeconds = now.difference(dateTime).inSeconds;

    // If the message was sent in the last minute, show "Just Now"
    if (differenceInSeconds < 60) {
      return 'Just Now';
    }

    // If the message was sent in the last hour, show the minutes
    if (differenceInSeconds < 3600) {
      int minutes = differenceInSeconds ~/ 60;
      return ' $minutes ${minutes == 1 ? 'minute' : 'minutes'} ago';
    }
    // If the message was sent in the last 12 hours, show the hours
    if (differenceInSeconds < 43200) {
      int hours = differenceInSeconds ~/ 3600;
      return '$hours ${hours == 1 ? 'hour' : 'hours'} ago';
    }
    final int differenceInDays =
        DateTime(dateTime.year, dateTime.month, dateTime.day)
            .difference(DateTime(now.year, now.month, now.day))
            .inDays;

    if (differenceInDays == 0) {
      return 'Today';
    }
    if (differenceInDays == -1) {
      return 'Yesterday';
    }
    if (differenceInDays > -7) {
      return [
        'Monday',
        'Tuesday',
        'Wednesday',
        'Thursday',
        'Friday',
        'Saturday',
        'Sunday',
      ][dateTime.weekday - 1];
    }
    if (differenceInDays > -365) {
      return '${[
        'January',
        'February',
        'March',
        'April',
        'May',
        'June',
        'July',
        'August',
        'September',
        'October',
        'November',
        'December'
      ][dateTime.month - 1]} ${dateTime.day}';
    }
    return intl.DateFormat('yyyy/MM/dd').format(dateTime);
  }

  static String getTime(DateTime? dateTime) {
    DateTime now = dateTime != null ? dateTime : DateTime.now();
// Format the time. For example, 'hh:mm a' for hour:minute AM/PM
    String formattedTime = intl.DateFormat('hh:mm a').format(now);
    //   print("Formatted Time: $formattedTime");
    return formattedTime;
  }

  String calculateTimeDifference(DateTime dateNow, DateTime futureDate) {
    DateTime now = dateNow;
    if (futureDate.isBefore(now)) {
      return 'Finished';
    }

    Duration difference = futureDate.difference(now);

    if (difference.inDays > 0) {
      return '${difference.inDays} Day';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} Hour';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} Munite';
    } else {
      return '${difference.inSeconds} Seconds';
    }
  }

  static String getDateArabic(String date) {
    //print(date);
    DateTime now = DateTime.parse(date);
    //String formattedDate = intl.DateFormat.yMEd('ar_Ar').format(now);
    String formattedDate = intl.DateFormat.yMEd('en_US').format(now);

    return formattedDate;
  }

  static String formatNumber(String number) {
    var oCcy = intl.NumberFormat("#,##0", "en_US");
    return oCcy.format(number.isEmpty ? 0 : int.parse(number));
  }
}
