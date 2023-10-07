// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'note_creation_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NoteCreationState {
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NoteCreationStateCopyWith<NoteCreationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteCreationStateCopyWith<$Res> {
  factory $NoteCreationStateCopyWith(
          NoteCreationState value, $Res Function(NoteCreationState) then) =
      _$NoteCreationStateCopyWithImpl<$Res, NoteCreationState>;
  @useResult
  $Res call({String title, String content, DateTime date});
}

/// @nodoc
class _$NoteCreationStateCopyWithImpl<$Res, $Val extends NoteCreationState>
    implements $NoteCreationStateCopyWith<$Res> {
  _$NoteCreationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? content = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NoteCreationStateImplCopyWith<$Res>
    implements $NoteCreationStateCopyWith<$Res> {
  factory _$$NoteCreationStateImplCopyWith(_$NoteCreationStateImpl value,
          $Res Function(_$NoteCreationStateImpl) then) =
      __$$NoteCreationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String content, DateTime date});
}

/// @nodoc
class __$$NoteCreationStateImplCopyWithImpl<$Res>
    extends _$NoteCreationStateCopyWithImpl<$Res, _$NoteCreationStateImpl>
    implements _$$NoteCreationStateImplCopyWith<$Res> {
  __$$NoteCreationStateImplCopyWithImpl(_$NoteCreationStateImpl _value,
      $Res Function(_$NoteCreationStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? content = null,
    Object? date = null,
  }) {
    return _then(_$NoteCreationStateImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$NoteCreationStateImpl implements _NoteCreationState {
  const _$NoteCreationStateImpl(
      {required this.title, required this.content, required this.date});

  @override
  final String title;
  @override
  final String content;
  @override
  final DateTime date;

  @override
  String toString() {
    return 'NoteCreationState(title: $title, content: $content, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoteCreationStateImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, content, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NoteCreationStateImplCopyWith<_$NoteCreationStateImpl> get copyWith =>
      __$$NoteCreationStateImplCopyWithImpl<_$NoteCreationStateImpl>(
          this, _$identity);
}

abstract class _NoteCreationState implements NoteCreationState {
  const factory _NoteCreationState(
      {required final String title,
      required final String content,
      required final DateTime date}) = _$NoteCreationStateImpl;

  @override
  String get title;
  @override
  String get content;
  @override
  DateTime get date;
  @override
  @JsonKey(ignore: true)
  _$$NoteCreationStateImplCopyWith<_$NoteCreationStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
