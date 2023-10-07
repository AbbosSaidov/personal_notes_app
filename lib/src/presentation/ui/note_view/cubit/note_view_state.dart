import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:personal_notes_app/src/data/models/note/note_model.dart';

part 'note_view_state.freezed.dart';

@freezed
class NoteViewState with _$NoteViewState {
  const factory NoteViewState({
    required String title,
    required String content,
    required DateTime date,
    required Note originalNote,
  }) = _NoteViewState;
}
