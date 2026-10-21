// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'habit_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HabitDetail {
  Habit get habit;
  List<DayStatus> get history;

  /// Create a copy of HabitDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HabitDetailCopyWith<HabitDetail> get copyWith =>
      _$HabitDetailCopyWithImpl<HabitDetail>(this as HabitDetail, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HabitDetail &&
            (identical(other.habit, habit) || other.habit == habit) &&
            const DeepCollectionEquality().equals(other.history, history));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, habit, const DeepCollectionEquality().hash(history));

  @override
  String toString() {
    return 'HabitDetail(habit: $habit, history: $history)';
  }
}

/// @nodoc
abstract mixin class $HabitDetailCopyWith<$Res> {
  factory $HabitDetailCopyWith(
          HabitDetail value, $Res Function(HabitDetail) _then) =
      _$HabitDetailCopyWithImpl;
  @useResult
  $Res call({Habit habit, List<DayStatus> history});

  $HabitCopyWith<$Res> get habit;
}

/// @nodoc
class _$HabitDetailCopyWithImpl<$Res> implements $HabitDetailCopyWith<$Res> {
  _$HabitDetailCopyWithImpl(this._self, this._then);

  final HabitDetail _self;
  final $Res Function(HabitDetail) _then;

  /// Create a copy of HabitDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? habit = null,
    Object? history = null,
  }) {
    return _then(_self.copyWith(
      habit: null == habit
          ? _self.habit
          : habit // ignore: cast_nullable_to_non_nullable
              as Habit,
      history: null == history
          ? _self.history
          : history // ignore: cast_nullable_to_non_nullable
              as List<DayStatus>,
    ));
  }

  /// Create a copy of HabitDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HabitCopyWith<$Res> get habit {
    return $HabitCopyWith<$Res>(_self.habit, (value) {
      return _then(_self.copyWith(habit: value));
    });
  }
}

/// Adds pattern-matching-related methods to [HabitDetail].
extension HabitDetailPatterns on HabitDetail {
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
    TResult Function(_HabitDetail value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HabitDetail() when $default != null:
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
    TResult Function(_HabitDetail value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HabitDetail():
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
    TResult? Function(_HabitDetail value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HabitDetail() when $default != null:
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
    TResult Function(Habit habit, List<DayStatus> history)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HabitDetail() when $default != null:
        return $default(_that.habit, _that.history);
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
    TResult Function(Habit habit, List<DayStatus> history) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HabitDetail():
        return $default(_that.habit, _that.history);
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
    TResult? Function(Habit habit, List<DayStatus> history)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HabitDetail() when $default != null:
        return $default(_that.habit, _that.history);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _HabitDetail extends HabitDetail {
  const _HabitDetail(
      {required this.habit, required final List<DayStatus> history})
      : _history = history,
        super._();

  @override
  final Habit habit;
  final List<DayStatus> _history;
  @override
  List<DayStatus> get history {
    if (_history is EqualUnmodifiableListView) return _history;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_history);
  }

  /// Create a copy of HabitDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HabitDetailCopyWith<_HabitDetail> get copyWith =>
      __$HabitDetailCopyWithImpl<_HabitDetail>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HabitDetail &&
            (identical(other.habit, habit) || other.habit == habit) &&
            const DeepCollectionEquality().equals(other._history, _history));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, habit, const DeepCollectionEquality().hash(_history));

  @override
  String toString() {
    return 'HabitDetail(habit: $habit, history: $history)';
  }
}

/// @nodoc
abstract mixin class _$HabitDetailCopyWith<$Res>
    implements $HabitDetailCopyWith<$Res> {
  factory _$HabitDetailCopyWith(
          _HabitDetail value, $Res Function(_HabitDetail) _then) =
      __$HabitDetailCopyWithImpl;
  @override
  @useResult
  $Res call({Habit habit, List<DayStatus> history});

  @override
  $HabitCopyWith<$Res> get habit;
}

/// @nodoc
class __$HabitDetailCopyWithImpl<$Res> implements _$HabitDetailCopyWith<$Res> {
  __$HabitDetailCopyWithImpl(this._self, this._then);

  final _HabitDetail _self;
  final $Res Function(_HabitDetail) _then;

  /// Create a copy of HabitDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? habit = null,
    Object? history = null,
  }) {
    return _then(_HabitDetail(
      habit: null == habit
          ? _self.habit
          : habit // ignore: cast_nullable_to_non_nullable
              as Habit,
      history: null == history
          ? _self._history
          : history // ignore: cast_nullable_to_non_nullable
              as List<DayStatus>,
    ));
  }

  /// Create a copy of HabitDetail
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
