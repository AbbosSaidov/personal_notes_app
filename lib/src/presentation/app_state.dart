import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.freezed.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState());

  void changeMode() async {
    emit(state.copyWith(isDarkMode: !state.isDarkMode));
  }
}

@freezed
class AppState with _$AppState {
  const factory AppState({
    @Default(false) bool isDarkMode,
  }) = _AppState;
}
