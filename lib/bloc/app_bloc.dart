import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppLoading()) {
    on<AppStarted>(_onStarted);
  }

  Future<void> _onStarted(
    AppStarted event,
    Emitter<AppState> emit,
  ) async {
    emit(AppLoading());
    await Future.delayed(const Duration(seconds: 5));
    try {
      emit(const AppLoaded());
    } catch (_) {
      emit(AppError());
    }
  }
}
