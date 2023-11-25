import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeLoading()) {
    on<HomeStarted>(_onStarted);
    on<SelectPageIndex>(_onSelectPageIndex);
  }

  Future<void> _onStarted(
    HomeStarted event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeLoading());
    await Future.delayed(const Duration(seconds: 5));
    try {
      emit(const HomeLoaded(selectedPageIndex: 0));
    } catch (_) {
      emit(const HomeError());
    }
  }

  void _onSelectPageIndex(
    SelectPageIndex event,
    Emitter<HomeState> emit,
  ) {
    emit(HomeLoaded(selectedPageIndex: event.index));
  }
}
