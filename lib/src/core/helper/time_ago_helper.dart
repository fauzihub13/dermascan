class TimeAgoHelper {
  static String timeAgo(DateTime dateTime) {
    final Duration diff = DateTime.now().difference(dateTime);

    if (diff.inHours < 24) {
      return 'hari ini';
    } else if (diff.inDays < 7) {
      return '${diff.inDays} hari yang lalu';
    } else {
      return '${(diff.inDays / 7).floor()} minggu yang lalu';
    }
  }
}
