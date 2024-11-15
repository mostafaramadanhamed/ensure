import 'package:easy_localization/easy_localization.dart';

String formatPostTime(DateTime postDate) {
  final deofault = DateTime.now();
  final nowFormat = DateFormat('yyyy-MM-dd HH:mm:ss').format(deofault);
  final postDateFormat = DateFormat('yyyy-MM-dd HH:mm:ss').format(postDate);
  final difference =
      DateTime.parse(nowFormat).difference(DateTime.parse(postDateFormat));

  if (difference.inSeconds < 60) {
    return 'Just now'.tr();
  } else if (difference.inMinutes < 60) {
    return '${difference.inMinutes} ${difference.inMinutes == 1 ? 'minute'.tr() : 'minutes'.tr()}'
        .tr();
  } else if (difference.inHours < 24) {
  return '${difference.inHours.toString().tr()} ${difference.inHours == 1 ? 'hour'.tr() : 'hours'.tr()}'
        .tr();
  } else if (difference.inDays == 1 && difference.inHours < 24) {
    return 'Yesterday at'.tr() + _formatTime(postDate);
  } else if (difference.inDays < 7) {
    return '${difference.inDays} ${difference.inDays == 1 ? 'day'.tr() : 'days'.tr()}';
  } else {
    return _formatDate(postDate);
  }
}

String _formatDate(DateTime date) {
  // Formats the date in "Month Day" format (e.g., June 3)
  return '${_getMonthName(date.month).tr()} ${date.day}';
}

String _formatTime(DateTime date) {
  // Formats time in "h:mm AM/PM" format
  final hour = date.hour % 12 == 0 ? 12 : date.hour % 12;
  final minute = date.minute.toString().padLeft(2, '0');
  final period = date.hour >= 12 ? 'PM'.tr() : 'AM'.tr();
  return '$hour:$minute $period';
}

String _getMonthName(int month) {
  const months = [
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
  ];
  return months[month - 1];
}
