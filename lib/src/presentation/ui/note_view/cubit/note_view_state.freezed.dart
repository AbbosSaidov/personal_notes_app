// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'note_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NoteViewState {
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  Note get originalNote => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NoteViewStateCopyWith<NoteViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteViewStateCopyWith<$Res> {
  factory $NoteViewStateCopyWith(
          NoteViewState value, $Res Function(NoteViewState) then) =
      _$NoteViewStateCopyWithImpl<$Res, NoteViewState>;
  @useResult
  $Res call({String title, String content, DateTime date, Note originalNote});
}

/// @nodoc
class _$NoteViewStateCopyWithImpl<$Res, $Val extends NoteViewState>
    implements $NoteViewStateCopyWith<$Res> {
  _$NoteViewStateCopyWithImpl(this._value, this._then);

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
    Object? originalNote = null,
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
      originalNote: null == originalNote
          ? _value.originalNote
          : originalNote // ignore: cast_nullable_to_non_nullable
              as Note,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NoteViewStateImplCopyWith<$Res>
    implements $NoteViewStateCopyWith<$Res> {
  factory _$$NoteViewStateImplCopyWith(
          _$NoteViewStateImpl value, $Res Function(_$NoteViewStateImpl) then) =
      __$$NoteViewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String content, DateTime date, Note originalNote});
}

/// @nodoc
class __$$NoteViewStateImplCopyWithImpl<$Res>
    extends _$NoteViewStateCopyWithImpl<$Res, _$NoteViewStateImpl>
    implements _$$NoteViewStateImplCopyWith<$Res> {
  __$$NoteViewStateImplCopyWithImpl(
      _$NoteViewStateImpl _value, $Res Function(_$NoteViewStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? content = null,
    Object? date = null,
    Object? originalNote = null,
  }) {
    return _then(_$NoteViewStateImpl(
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
      originalNote: null == originalNote
          ? _value.originalNote
          : originalNote // ignore: cast_nullable_to_non_nullable
              as Note,
    ));
  }
}

/// @nodoc

class _$NoteViewStateImpl implements _NoteViewState {
  const _$NoteViewStateImpl(
      {required this.title,
      required this.content,
      required this.date,
      required this.originalNote});

  @override
  final String title;
  @override
  final String content;
  @override
  final DateTime date;
  @override
  final Note originalNote;

  @override
  String toString() {
    return 'NoteViewState(title: $title, content: $content, date: $date, originalNote: $originalNote)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoteViewStateImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.originalNote, originalNote) ||
                other.originalNote == originalNote));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, title, content, date, originalNote);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NoteViewStateImplCopyWith<_$NoteViewStateImpl> get copyWith =>
      __$$NoteViewStateImplCopyWithImpl<_$NoteViewStateImpl>(this, _$identity);
}

abstract class _NoteViewState implements NoteViewState {
  const factory _NoteViewState(
      {required final String title,
      required final String content,
      required final DateTime date,
      required final Note originalNote}) = _$NoteViewStateImpl;

  @override
  String get title;
  @override
  String get content;
  @override
  DateTime get date;
  @override
  Note get originalNote;
  @override
  @JsonKey(ignore: true)
  _$$NoteViewStateImplCopyWith<_$NoteViewStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
