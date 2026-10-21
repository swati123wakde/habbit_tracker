// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'habit_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HabitDetailEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is HabitDetailEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'HabitDetailEvent()';
  }
}

/// @nodoc
class $HabitDetailEventCopyWith<$Res> {
  $HabitDetailEventCopyWith(
      HabitDetailEvent _, $Res Function(HabitDetailEvent) __);
}

/// Adds pattern-matching-related methods to [HabitDetailEvent].
extension HabitDetailEventPatterns on HabitDetailEvent {
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
    TResult Function(HabitDetailStarted value)? started,
    TResult Function(HabitDetailTodayToggled value)? todayToggled,
    TResult Function(HabitDetailDeleteRequested value)? deleteRequested,
    TResult Function(_HabitDetailUpdated value)? updated,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case HabitDetailStarted() when started != null:
        return started(_that);
      case HabitDetailTodayToggled() when todayToggled != null:
        return todayToggled(_that);
      case HabitDetailDeleteRequested() when deleteRequested != null:
        return deleteRequested(_that);
      case _HabitDetailUpdated() when updated != null:
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
    required TResult Function(HabitDetailStarted value) started,
    required TResult Function(HabitDetailTodayToggled value) todayToggled,
    required TResult Function(HabitDetailDeleteRequested value) deleteRequested,
    required TResult Function(_HabitDetailUpdated value) updated,
  }) {
    final _that = this;
    switch (_that) {
      case HabitDetailStarted():
        return started(_that);
      case HabitDetailTodayToggled():
        return todayToggled(_that);
      case HabitDetailDeleteRequested():
        return deleteRequested(_that);
      case _HabitDetailUpdated():
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
    TResult? Function(HabitDetailStarted value)? started,
    TResult? Function(HabitDetailTodayToggled value)? todayToggled,
    TResult? Function(HabitDetailDeleteRequested value)? deleteRequested,
    TResult? Function(_HabitDetailUpdated value)? updated,
  }) {
    final _that = this;
    switch (_that) {
      case HabitDetailStarted() when started != null:
        return started(_that);
      case HabitDetailTodayToggled() when todayToggled != null:
        return todayToggled(_that);
      case HabitDetailDeleteRequested() when deleteRequested != null:
        return deleteRequested(_that);
      case _HabitDetailUpdated() when updated != null:
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
    TResult Function(String habitId)? started,
    TResult Function()? todayToggled,
    TResult Function()? deleteRequested,
    TResult Function(Either<Failure, HabitDetail> result)? updated,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case HabitDetailStarted() when started != null:
        return started(_that.habitId);
      case HabitDetailTodayToggled() when todayToggled != null:
        return todayToggled();
      case HabitDetailDeleteRequested() when deleteRequested != null:
        return deleteRequested();
      case _HabitDetailUpdated() when updated != null:
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
    required TResult Function(String habitId) started,
    required TResult Function() todayToggled,
    required TResult Function() deleteRequested,
    required TResult Function(Either<Failure, HabitDetail> result) updated,
  }) {
    final _that = this;
    switch (_that) {
      case HabitDetailStarted():
        return started(_that.habitId);
      case HabitDetailTodayToggled():
        return todayToggled();
      case HabitDetailDeleteRequested():
        return deleteRequested();
      case _HabitDetailUpdated():
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
    TResult? Function(String habitId)? started,
    TResult? Function()? todayToggled,
    TResult? Function()? deleteRequested,
    TResult? Function(Either<Failure, HabitDetail> result)? updated,
  }) {
    final _that = this;
    switch (_that) {
      case HabitDetailStarted() when started != null:
        return started(_that.habitId);
      case HabitDetailTodayToggled() when todayToggled != null:
        return todayToggled();
      case HabitDetailDeleteRequested() when deleteRequested != null:
        return deleteRequested();
      case _HabitDetailUpdated() when updated != null:
        return updated(_that.result);
      case _:
        return null;
    }
  }
}

/// @nodoc

class HabitDetailStarted implements HabitDetailEvent {
  const HabitDetailStarted(this.habitId);

  final String habitId;

  /// Create a copy of HabitDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HabitDetailStartedCopyWith<HabitDetailStarted> get copyWith =>
      _$HabitDetailStartedCopyWithImpl<HabitDetailStarted>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HabitDetailStarted &&
            (identical(other.habitId, habitId) || other.habitId == habitId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, habitId);

  @override
  String toString() {
    return 'HabitDetailEvent.started(habitId: $habitId)';
  }
}

/// @nodoc
abstract mixin class $HabitDetailStartedCopyWith<$Res>
    implements $HabitDetailEventCopyWith<$Res> {
  factory $HabitDetailStartedCopyWith(
          HabitDetailStarted value, $Res Function(HabitDetailStarted) _then) =
      _$HabitDetailStartedCopyWithImpl;
  @useResult
  $Res call({String habitId});
}

/// @nodoc
class _$HabitDetailStartedCopyWithImpl<$Res>
    implements $HabitDetailStartedCopyWith<$Res> {
  _$HabitDetailStartedCopyWithImpl(this._self, this._then);

  final HabitDetailStarted _self;
  final $Res Function(HabitDetailStarted) _then;

  /// Create a copy of HabitDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? habitId = null,
  }) {
    return _then(HabitDetailStarted(
      null == habitId
          ? _self.habitId
          : habitId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class HabitDetailTodayToggled implements HabitDetailEvent {
  const HabitDetailTodayToggled();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is HabitDetailTodayToggled);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'HabitDetailEvent.todayToggled()';
  }
}

/// @nodoc

class HabitDetailDeleteRequested implements HabitDetailEvent {
  const HabitDetailDeleteRequested();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HabitDetailDeleteRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'HabitDetailEvent.deleteRequested()';
  }
}

/// @nodoc

class _HabitDetailUpdated implements HabitDetailEvent {
  const _HabitDetailUpdated(this.result);

  final Either<Failure, HabitDetail> result;

  /// Create a copy of HabitDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HabitDetailUpdatedCopyWith<_HabitDetailUpdated> get copyWith =>
      __$HabitDetailUpdatedCopyWithImpl<_HabitDetailUpdated>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HabitDetailUpdated &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result);

  @override
  String toString() {
    return 'HabitDetailEvent.updated(result: $result)';
  }
}

/// @nodoc
abstract mixin class _$HabitDetailUpdatedCopyWith<$Res>
    implements $HabitDetailEventCopyWith<$Res> {
  factory _$HabitDetailUpdatedCopyWith(
          _HabitDetailUpdated value, $Res Function(_HabitDetailUpdated) _then) =
      __$HabitDetailUpdatedCopyWithImpl;
  @useResult
  $Res call({Either<Failure, HabitDetail> result});
}

/// @nodoc
class __$HabitDetailUpdatedCopyWithImpl<$Res>
    implements _$HabitDetailUpdatedCopyWith<$Res> {
  __$HabitDetailUpdatedCopyWithImpl(this._self, this._then);

  final _HabitDetailUpdated _self;
  final $Res Function(_HabitDetailUpdated) _then;

  /// Create a copy of HabitDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? result = null,
  }) {
    return _then(_HabitDetailUpdated(
      null == result
          ? _self.result
          : result // ignore: cast_nullable_to_non_nullable
              as Either<Failure, HabitDetail>,
    ));
  }
}

/// @nodoc
mixin _$HabitDetailState {
  HabitDetailStatus get status;
  String? get habitId;
  DateTime? get today;
  HabitDetail? get detail;
  bool get isUpdating;
  bool get isDeleting;
  String? get errorMessage;
  String? get actionError;

  /// Create a copy of HabitDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HabitDetailStateCopyWith<HabitDetailState> get copyWith =>
      _$HabitDetailStateCopyWithImpl<HabitDetailState>(
          this as HabitDetailState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HabitDetailState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.habitId, habitId) || other.habitId == habitId) &&
            (identical(other.today, today) || other.today == today) &&
            (identical(other.detail, detail) || other.detail == detail) &&
            (identical(other.isUpdating, isUpdating) ||
                other.isUpdating == isUpdating) &&
            (identical(other.isDeleting, isDeleting) ||
                other.isDeleting == isDeleting) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.actionError, actionError) ||
                other.actionError == actionError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, habitId, today, detail,
      isUpdating, isDeleting, errorMessage, actionError);

  @override
  String toString() {
    return 'HabitDetailState(status: $status, habitId: $habitId, today: $today, detail: $detail, isUpdating: $isUpdating, isDeleting: $isDeleting, errorMessage: $errorMessage, actionError: $actionError)';
  }
}

/// @nodoc
abstract mixin class $HabitDetailStateCopyWith<$Res> {
  factory $HabitDetailStateCopyWith(
          HabitDetailState value, $Res Function(HabitDetailState) _then) =
      _$HabitDetailStateCopyWithImpl;
  @useResult
  $Res call(
      {HabitDetailStatus status,
      String? habitId,
      DateTime? today,
      HabitDetail? detail,
      bool isUpdating,
      bool isDeleting,
      String? errorMessage,
      String? actionError});

  $HabitDetailCopyWith<$Res>? get detail;
}

/// @nodoc
class _$HabitDetailStateCopyWithImpl<$Res>
    implements $HabitDetailStateCopyWith<$Res> {
  _$HabitDetailStateCopyWithImpl(this._self, this._then);

  final HabitDetailState _self;
  final $Res Function(HabitDetailState) _then;

  /// Create a copy of HabitDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? habitId = freezed,
    Object? today = freezed,
    Object? detail = freezed,
    Object? isUpdating = null,
    Object? isDeleting = null,
    Object? errorMessage = freezed,
    Object? actionError = freezed,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as HabitDetailStatus,
      habitId: freezed == habitId
          ? _self.habitId
          : habitId // ignore: cast_nullable_to_non_nullable
              as String?,
      today: freezed == today
          ? _self.today
          : today // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      detail: freezed == detail
          ? _self.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as HabitDetail?,
      isUpdating: null == isUpdating
          ? _self.isUpdating
          : isUpdating // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeleting: null == isDeleting
          ? _self.isDeleting
          : isDeleting // ignore: cast_nullable_to_non_nullable
              as bool,
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

  /// Create a copy of HabitDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HabitDetailCopyWith<$Res>? get detail {
    if (_self.detail == null) {
      return null;
    }

    return $HabitDetailCopyWith<$Res>(_self.detail!, (value) {
      return _then(_self.copyWith(detail: value));
    });
  }
}

/// Adds pattern-matching-related methods to [HabitDetailState].
extension HabitDetailStatePatterns on HabitDetailState {
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
    TResult Function(_HabitDetailState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HabitDetailState() when $default != null:
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
    TResult Function(_HabitDetailState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HabitDetailState():
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
    TResult? Function(_HabitDetailState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HabitDetailState() when $default != null:
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
    TResult Function(
            HabitDetailStatus status,
            String? habitId,
            DateTime? today,
            HabitDetail? detail,
            bool isUpdating,
            bool isDeleting,
            String? errorMessage,
            String? actionError)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HabitDetailState() when $default != null:
        return $default(
            _that.status,
            _that.habitId,
            _that.today,
            _that.detail,
            _that.isUpdating,
            _that.isDeleting,
            _that.errorMessage,
            _that.actionError);
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
    TResult Function(
            HabitDetailStatus status,
            String? habitId,
            DateTime? today,
            HabitDetail? detail,
            bool isUpdating,
            bool isDeleting,
            String? errorMessage,
            String? actionError)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HabitDetailState():
        return $default(
            _that.status,
            _that.habitId,
            _that.today,
            _that.detail,
            _that.isUpdating,
            _that.isDeleting,
            _that.errorMessage,
            _that.actionError);
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
    TResult? Function(
            HabitDetailStatus status,
            String? habitId,
            DateTime? today,
            HabitDetail? detail,
            bool isUpdating,
            bool isDeleting,
            String? errorMessage,
            String? actionError)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HabitDetailState() when $default != null:
        return $default(
            _that.status,
            _that.habitId,
            _that.today,
            _that.detail,
            _that.isUpdating,
            _that.isDeleting,
            _that.errorMessage,
            _that.actionError);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _HabitDetailState implements HabitDetailState {
  const _HabitDetailState(
      {this.status = HabitDetailStatus.initial,
      this.habitId,
      this.today,
      this.detail,
      this.isUpdating = false,
      this.isDeleting = false,
      this.errorMessage,
      this.actionError});

  @override
  @JsonKey()
  final HabitDetailStatus status;
  @override
  final String? habitId;
  @override
  final DateTime? today;
  @override
  final HabitDetail? detail;
  @override
  @JsonKey()
  final bool isUpdating;
  @override
  @JsonKey()
  final bool isDeleting;
  @override
  final String? errorMessage;
  @override
  final String? actionError;

  /// Create a copy of HabitDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HabitDetailStateCopyWith<_HabitDetailState> get copyWith =>
      __$HabitDetailStateCopyWithImpl<_HabitDetailState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HabitDetailState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.habitId, habitId) || other.habitId == habitId) &&
            (identical(other.today, today) || other.today == today) &&
            (identical(other.detail, detail) || other.detail == detail) &&
            (identical(other.isUpdating, isUpdating) ||
                other.isUpdating == isUpdating) &&
            (identical(other.isDeleting, isDeleting) ||
                other.isDeleting == isDeleting) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.actionError, actionError) ||
                other.actionError == actionError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, habitId, today, detail,
      isUpdating, isDeleting, errorMessage, actionError);

  @override
  String toString() {
    return 'HabitDetailState(status: $status, habitId: $habitId, today: $today, detail: $detail, isUpdating: $isUpdating, isDeleting: $isDeleting, errorMessage: $errorMessage, actionError: $actionError)';
  }
}

/// @nodoc
abstract mixin class _$HabitDetailStateCopyWith<$Res>
    implements $HabitDetailStateCopyWith<$Res> {
  factory _$HabitDetailStateCopyWith(
          _HabitDetailState value, $Res Function(_HabitDetailState) _then) =
      __$HabitDetailStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {HabitDetailStatus status,
      String? habitId,
      DateTime? today,
      HabitDetail? detail,
      bool isUpdating,
      bool isDeleting,
      String? errorMessage,
      String? actionError});

  @override
  $HabitDetailCopyWith<$Res>? get detail;
}

/// @nodoc
class __$HabitDetailStateCopyWithImpl<$Res>
    implements _$HabitDetailStateCopyWith<$Res> {
  __$HabitDetailStateCopyWithImpl(this._self, this._then);

  final _HabitDetailState _self;
  final $Res Function(_HabitDetailState) _then;

  /// Create a copy of HabitDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? habitId = freezed,
    Object? today = freezed,
    Object? detail = freezed,
    Object? isUpdating = null,
    Object? isDeleting = null,
    Object? errorMessage = freezed,
    Object? actionError = freezed,
  }) {
    return _then(_HabitDetailState(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as HabitDetailStatus,
      habitId: freezed == habitId
          ? _self.habitId
          : habitId // ignore: cast_nullable_to_non_nullable
              as String?,
      today: freezed == today
          ? _self.today
          : today // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      detail: freezed == detail
          ? _self.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as HabitDetail?,
      isUpdating: null == isUpdating
          ? _self.isUpdating
          : isUpdating // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeleting: null == isDeleting
          ? _self.isDeleting
          : isDeleting // ignore: cast_nullable_to_non_nullable
              as bool,
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

  /// Create a copy of HabitDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HabitDetailCopyWith<$Res>? get detail {
    if (_self.detail == null) {
      return null;
    }

    return $HabitDetailCopyWith<$Res>(_self.detail!, (value) {
      return _then(_self.copyWith(detail: value));
    });
  }
}

// dart format on
