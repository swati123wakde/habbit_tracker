// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_habit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DailyHabit {
  Habit get habit;
  bool get isDone;

  /// Create a copy of DailyHabit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DailyHabitCopyWith<DailyHabit> get copyWith =>
      _$DailyHabitCopyWithImpl<DailyHabit>(this as DailyHabit, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DailyHabit &&
            (identical(other.habit, habit) || other.habit == habit) &&
            (identical(other.isDone, isDone) || other.isDone == isDone));
  }

  @override
  int get hashCode => Object.hash(runtimeType, habit, isDone);

  @override
  String toString() {
    return 'DailyHabit(habit: $habit, isDone: $isDone)';
  }
}

/// @nodoc
abstract mixin class $DailyHabitCopyWith<$Res> {
  factory $DailyHabitCopyWith(
          DailyHabit value, $Res Function(DailyHabit) _then) =
      _$DailyHabitCopyWithImpl;
  @useResult
  $Res call({Habit habit, bool isDone});

  $HabitCopyWith<$Res> get habit;
}

/// @nodoc
class _$DailyHabitCopyWithImpl<$Res> implements $DailyHabitCopyWith<$Res> {
  _$DailyHabitCopyWithImpl(this._self, this._then);

  final DailyHabit _self;
  final $Res Function(DailyHabit) _then;

  /// Create a copy of DailyHabit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? habit = null,
    Object? isDone = null,
  }) {
    return _then(_self.copyWith(
      habit: null == habit
          ? _self.habit
          : habit // ignore: cast_nullable_to_non_nullable
              as Habit,
      isDone: null == isDone
          ? _self.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of DailyHabit
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HabitCopyWith<$Res> get habit {
    return $HabitCopyWith<$Res>(_self.habit, (value) {
      return _then(_self.copyWith(habit: value));
    });
  }
}

/// Adds pattern-matching-related methods to [DailyHabit].
extension DailyHabitPatterns on DailyHabit {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_DailyHabit value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DailyHabit() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_DailyHabit value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DailyHabit():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_DailyHabit value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DailyHabit() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Habit habit, bool isDone)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DailyHabit() when $default != null:
        return $default(_that.habit, _that.isDone);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Habit habit, bool isDone) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DailyHabit():
        return $default(_that.habit, _that.isDone);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(Habit habit, bool isDone)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DailyHabit() when $default != null:
        return $default(_that.habit, _that.isDone);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _DailyHabit implements DailyHabit {
  const _DailyHabit({required this.habit, required this.isDone});

  @override
  final Habit habit;
  @override
  final bool isDone;

  /// Create a copy of DailyHabit
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DailyHabitCopyWith<_DailyHabit> get copyWith =>
      __$DailyHabitCopyWithImpl<_DailyHabit>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DailyHabit &&
            (identical(other.habit, habit) || other.habit == habit) &&
            (identical(other.isDone, isDone) || other.isDone == isDone));
  }

  @override
  int get hashCode => Object.hash(runtimeType, habit, isDone);

  @override
  String toString() {
    return 'DailyHabit(habit: $habit, isDone: $isDone)';
  }
}

/// @nodoc
abstract mixin class _$DailyHabitCopyWith<$Res>
    implements $DailyHabitCopyWith<$Res> {
  factory _$DailyHabitCopyWith(
          _DailyHabit value, $Res Function(_DailyHabit) _then) =
      __$DailyHabitCopyWithImpl;
  @override
  @useResult
  $Res call({Habit habit, bool isDone});

  @override
  $HabitCopyWith<$Res> get habit;
}

/// @nodoc
class __$DailyHabitCopyWithImpl<$Res> implements _$DailyHabitCopyWith<$Res> {
  __$DailyHabitCopyWithImpl(this._self, this._then);

  final _DailyHabit _self;
  final $Res Function(_DailyHabit) _then;

  /// Create a copy of DailyHabit
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? habit = null,
    Object? isDone = null,
  }) {
    return _then(_DailyHabit(
      habit: null == habit
          ? _self.habit
          : habit // ignore: cast_nullable_to_non_nullable
              as Habit,
      isDone: null == isDone
          ? _self.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of DailyHabit
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HabitCopyWith<$Res> get habit {
    return $HabitCopyWith<$Res>(_self.habit, (value) {
      return _then(_self.copyWith(habit: value));
    });
  }
}

// dart format on
