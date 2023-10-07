import 'package:freezed_annotation/freezed_annotation.dart';

part 'note_creation_state.freezed.dart';

@freezed
class NoteCreationState with _$NoteCreationState {
  const factory NoteCreationState({
    required String title,
    required String content,
    required DateTime date,
  }) = _NoteCreationState;
}
