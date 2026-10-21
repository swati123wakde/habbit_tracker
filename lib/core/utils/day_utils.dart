/// Pure-Dart date helpers shared by every layer.
/// A "day key" is the local calendar date formatted as `yyyy-MM-dd`.
abstract final class DayUtils {
  static DateTime dateOnly(DateTime d) => DateTime(d.year, d.month, d.day);

  static String dayKey(DateTime d) {
    String two(int v) => v.toString().padLeft(2, '0');
    return '${d.year.toString().padLeft(4, '0')}-${two(d.month)}-${two(d.day)}';
  }

  static bool isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  /// Returns [count] consecutive days ending with [today], oldest first.
  /// Uses calendar arithmetic (not Duration) so DST changes are safe.
  static List<DateTime> lastDays(DateTime today, int count) => List.generate(
    count,
        (i) => DateTime(today.year, today.month, today.day - (count - 1 - i)),
  );
}
