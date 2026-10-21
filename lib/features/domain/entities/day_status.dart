import 'package:freezed_annotation/freezed_annotation.dart';

part 'day_status.freezed.dart';

@freezed
abstract class DayStatus with _$DayStatus {
  const factory DayStatus({
    required DateTime date,
    required bool isDone,
  }) = _DayStatus;
}
