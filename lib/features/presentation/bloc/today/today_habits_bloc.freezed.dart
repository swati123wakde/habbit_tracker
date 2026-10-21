// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'today_habits_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TodayHabitsEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TodayHabitsEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TodayHabitsEvent()';
  }
}

/// @nodoc
class $TodayHabitsEventCopyWith<$Res> {
  $TodayHabitsEventCopyWith(
      TodayHabitsEvent _, $Res Function(TodayHabitsEvent) __);
}

/// Adds pattern-matching-related methods to [TodayHabitsEvent].
extension TodayHabitsEventPatterns on TodayHabitsEvent {
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
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TodayHabitsStarted value)? started,
    TResult Function(TodayHabitsDayCheckRequested value)? dayCheckRequested,
    TResult Function(TodayHabitsToggled value)? toggled,
    TResult Function(_TodayHabitsUpdated value)? updated,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case TodayHabitsStarted() when started != null:
        return started(_that);
      case TodayHabitsDayCheckRequested() when dayCheckRequested != null:
        return dayCheckRequested(_that);
      case TodayHabitsToggled() when toggled != null:
        return toggled(_that);
      case _TodayHabitsUpdated() when updated != null:
        return updated(_that);
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
  TResult map<TResult extends Object?>({
    required TResult Function(TodayHabitsStarted value) started,
    required TResult Function(TodayHabitsDayCheckRequested value)
        dayCheckRequested,
    required TResult Function(TodayHabitsToggled value) toggled,
    required TResult Function(_TodayHabitsUpdated value) updated,
  }) {
    final _that = this;
    switch (_that) {
      case TodayHabitsStarted():
        return started(_that);
      case TodayHabitsDayCheckRequested():
        return dayCheckRequested(_that);
      case TodayHabitsToggled():
        return toggled(_that);
      case _TodayHabitsUpdated():
        return updated(_that);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TodayHabitsStarted value)? started,
    TResult? Function(TodayHabitsDayCheckRequested value)? dayCheckRequested,
    TResult? Function(TodayHabitsToggled value)? toggled,
    TResult? Function(_TodayHabitsUpdated value)? updated,
  }) {
    final _that = this;
    switch (_that) {
      case TodayHabitsStarted() when started != null:
        return started(_that);
      case TodayHabitsDayCheckRequested() when dayCheckRequested != null:
        return dayCheckRequested(_that);
      case TodayHabitsToggled() when toggled != null:
        return toggled(_that);
      case _TodayHabitsUpdated() when updated != null:
        return updated(_that);
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
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? dayCheckRequested,
    TResult Function(DailyHabit item)? toggled,
    TResult Function(Either<Failure, List<DailyHabit>> result)? updated,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case TodayHabitsStarted() when started != null:
        return started();
      case TodayHabitsDayCheckRequested() when dayCheckRequested != null:
        return dayCheckRequested();
      case TodayHabitsToggled() when toggled != null:
        return toggled(_that.item);
      case _TodayHabitsUpdated() when updated != null:
        return updated(_that.result);
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
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() dayCheckRequested,
    required TResult Function(DailyHabit item) toggled,
    required TResult Function(Either<Failure, List<DailyHabit>> result) updated,
  }) {
    final _that = this;
    switch (_that) {
      case TodayHabitsStarted():
        return started();
      case TodayHabitsDayCheckRequested():
        return dayCheckRequested();
      case TodayHabitsToggled():
        return toggled(_that.item);
      case _TodayHabitsUpdated():
        return updated(_that.result);
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? dayCheckRequested,
    TResult? Function(DailyHabit item)? toggled,
    TResult? Function(Either<Failure, List<DailyHabit>> result)? updated,
  }) {
    final _that = this;
    switch (_that) {
      case TodayHabitsStarted() when started != null:
        return started();
      case TodayHabitsDayCheckRequested() when dayCheckRequested != null:
        return dayCheckRequested();
      case TodayHabitsToggled() when toggled != null:
        return toggled(_that.item);
      case _TodayHabitsUpdated() when updated != null:
        return updated(_that.result);
      case _:
        return null;
    }
  }
}

/// @nodoc

class TodayHabitsStarted implements TodayHabitsEvent {
  const TodayHabitsStarted();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TodayHabitsStarted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TodayHabitsEvent.started()';
  }
}

/// @nodoc

class TodayHabitsDayCheckRequested implements TodayHabitsEvent {
  const TodayHabitsDayCheckRequested();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TodayHabitsDayCheckRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TodayHabitsEvent.dayCheckRequested()';
  }
}

/// @nodoc

class TodayHabitsToggled implements TodayHabitsEvent {
  const TodayHabitsToggled(this.item);

  final DailyHabit item;

  /// Create a copy of TodayHabitsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TodayHabitsToggledCopyWith<TodayHabitsToggled> get copyWith =>
      _$TodayHabitsToggledCopyWithImpl<TodayHabitsToggled>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TodayHabitsToggled &&
            (identical(other.item, item) || other.item == item));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item);

  @override
  String toString() {
    return 'TodayHabitsEvent.toggled(item: $item)';
  }
}

/// @nodoc
abstract mixin class $TodayHabitsToggledCopyWith<$Res>
    implements $TodayHabitsEventCopyWith<$Res> {
  factory $TodayHabitsToggledCopyWith(
          TodayHabitsToggled value, $Res Function(TodayHabitsToggled) _then) =
      _$TodayHabitsToggledCopyWithImpl;
  @useResult
  $Res call({DailyHabit item});

  $DailyHabitCopyWith<$Res> get item;
}

/// @nodoc
class _$TodayHabitsToggledCopyWithImpl<$Res>
    implements $TodayHabitsToggledCopyWith<$Res> {
  _$TodayHabitsToggledCopyWithImpl(this._self, this._then);

  final TodayHabitsToggled _self;
  final $Res Function(TodayHabitsToggled) _then;

  /// Create a copy of TodayHabitsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? item = null,
  }) {
    return _then(TodayHabitsToggled(
      null == item
          ? _self.item
          : item // ignore: cast_nullable_to_non_nullable
              as DailyHabit,
    ));
  }

  /// Create a copy of TodayHabitsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DailyHabitCopyWith<$Res> get item {
    return $DailyHabitCopyWith<$Res>(_self.item, (value) {
      return _then(_self.copyWith(item: value));
    });
  }
}

/// @nodoc

class _TodayHabitsUpdated implements TodayHabitsEvent {
  const _TodayHabitsUpdated(this.result);

  final Either<Failure, List<DailyHabit>> result;

  /// Create a copy of TodayHabitsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TodayHabitsUpdatedCopyWith<_TodayHabitsUpdated> get copyWith =>
      __$TodayHabitsUpdatedCopyWithImpl<_TodayHabitsUpdated>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TodayHabitsUpdated &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result);

  @override
  String toString() {
    return 'TodayHabitsEvent.updated(result: $result)';
  }
}

/// @nodoc
abstract mixin class _$TodayHabitsUpdatedCopyWith<$Res>
    implements $TodayHabitsEventCopyWith<$Res> {
  factory _$TodayHabitsUpdatedCopyWith(
          _TodayHabitsUpdated value, $Res Function(_TodayHabitsUpdated) _then) =
      __$TodayHabitsUpdatedCopyWithImpl;
  @useResult
  $Res call({Either<Failure, List<DailyHabit>> result});
}

/// @nodoc
class __$TodayHabitsUpdatedCopyWithImpl<$Res>
    implements _$TodayHabitsUpdatedCopyWith<$Res> {
  __$TodayHabitsUpdatedCopyWithImpl(this._self, this._then);

  final _TodayHabitsUpdated _self;
  final $Res Function(_TodayHabitsUpdated) _then;

  /// Create a copy of TodayHabitsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? result = null,
  }) {
    return _then(_TodayHabitsUpdated(
      null == result
          ? _self.result
          : result // ignore: cast_nullable_to_non_nullable
              as Either<Failure, List<DailyHabit>>,
    ));
  }
}

/// @nodoc
mixin _$TodayHabitsState {
  TodayHabitsStatus get status;
  List<DailyHabit> get habits;
  DateTime? get day;
  String? get errorMessage;
  String? get actionError;

  /// Create a copy of TodayHabitsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TodayHabitsStateCopyWith<TodayHabitsState> get copyWith =>
      _$TodayHabitsStateCopyWithImpl<TodayHabitsState>(
          this as TodayHabitsState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TodayHabitsState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.habits, habits) &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.actionError, actionError) ||
                other.actionError == actionError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(habits),
      day,
      errorMessage,
      actionError);

  @override
  String toString() {
    return 'TodayHabitsState(status: $status, habits: $habits, day: $day, errorMessage: $errorMessage, actionError: $actionError)';
  }
}

/// @nodoc
abstract mixin class $TodayHabitsStateCopyWith<$Res> {
  factory $TodayHabitsStateCopyWith(
          TodayHabitsState value, $Res Function(TodayHabitsState) _then) =
      _$TodayHabitsStateCopyWithImpl;
  @useResult
  $Res call(
      {TodayHabitsStatus status,
      List<DailyHabit> habits,
      DateTime? day,
      String? errorMessage,
      String? actionError});
}

/// @nodoc
class _$TodayHabitsStateCopyWithImpl<$Res>
    implements $TodayHabitsStateCopyWith<$Res> {
  _$TodayHabitsStateCopyWithImpl(this._self, this._then);

  final TodayHabitsState _self;
  final $Res Function(TodayHabitsState) _then;

  /// Create a copy of TodayHabitsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? habits = null,
    Object? day = freezed,
    Object? errorMessage = freezed,
    Object? actionError = freezed,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as TodayHabitsStatus,
      habits: null == habits
          ? _self.habits
          : habits // ignore: cast_nullable_to_non_nullable
              as List<DailyHabit>,
      day: freezed == day
          ? _self.day
          : day // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      actionError: freezed == actionError
          ? _self.actionError
          : actionError // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [TodayHabitsState].
extension TodayHabitsStatePatterns on TodayHabitsState {
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
    TResult Function(_TodayHabitsState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TodayHabitsState() when $default != null:
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
    TResult Function(_TodayHabitsState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TodayHabitsState():
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
    TResult? Function(_TodayHabitsState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TodayHabitsState() when $default != null:
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
    TResult Function(TodayHabitsStatus status, List<DailyHabit> habits,
            DateTime? day, String? errorMessage, String? actionError)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TodayHabitsState() when $default != null:
        return $default(_that.status, _that.habits, _that.day,
            _that.errorMessage, _that.actionError);
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
    TResult Function(TodayHabitsStatus status, List<DailyHabit> habits,
            DateTime? day, String? errorMessage, String? actionError)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TodayHabitsState():
        return $default(_that.status, _that.habits, _that.day,
            _that.errorMessage, _that.actionError);
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
    TResult? Function(TodayHabitsStatus status, List<DailyHabit> habits,
            DateTime? day, String? errorMessage, String? actionError)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TodayHabitsState() when $default != null:
        return $default(_that.status, _that.habits, _that.day,
            _that.errorMessage, _that.actionError);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _TodayHabitsState extends TodayHabitsState {
  const _TodayHabitsState(
      {this.status = TodayHabitsStatus.initial,
      final List<DailyHabit> habits = const [],
      this.day,
      this.errorMessage,
      this.actionError})
      : _habits = habits,
        super._();

  @override
  @JsonKey()
  final TodayHabitsStatus status;
  final List<DailyHabit> _habits;
  @override
  @JsonKey()
  List<DailyHabit> get habits {
    if (_habits is EqualUnmodifiableListView) return _habits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_habits);
  }

  @override
  final DateTime? day;
  @override
  final String? errorMessage;
  @override
  final String? actionError;

  /// Create a copy of TodayHabitsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TodayHabitsStateCopyWith<_TodayHabitsState> get copyWith =>
      __$TodayHabitsStateCopyWithImpl<_TodayHabitsState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TodayHabitsState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._habits, _habits) &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.actionError, actionError) ||
                other.actionError == actionError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_habits),
      day,
      errorMessage,
      actionError);

  @override
  String toString() {
    return 'TodayHabitsState(status: $status, habits: $habits, day: $day, errorMessage: $errorMessage, actionError: $actionError)';
  }
}

/// @nodoc
abstract mixin class _$TodayHabitsStateCopyWith<$Res>
    implements $TodayHabitsStateCopyWith<$Res> {
  factory _$TodayHabitsStateCopyWith(
          _TodayHabitsState value, $Res Function(_TodayHabitsState) _then) =
      __$TodayHabitsStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {TodayHabitsStatus status,
      List<DailyHabit> habits,
      DateTime? day,
      String? errorMessage,
      String? actionError});
}

/// @nodoc
class __$TodayHabitsStateCopyWithImpl<$Res>
    implements _$TodayHabitsStateCopyWith<$Res> {
  __$TodayHabitsStateCopyWithImpl(this._self, this._then);

  final _TodayHabitsState _self;
  final $Res Function(_TodayHabitsState) _then;

  /// Create a copy of TodayHabitsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? habits = null,
    Object? day = freezed,
    Object? errorMessage = freezed,
    Object? actionError = freezed,
  }) {
    return _then(_TodayHabitsState(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as TodayHabitsStatus,
      habits: null == habits
          ? _self._habits
          : habits // ignore: cast_nullable_to_non_nullable
              as List<DailyHabit>,
      day: freezed == day
          ? _self.day
          : day // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      actionError: freezed == actionError
          ? _self.actionError
          : actionError // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
