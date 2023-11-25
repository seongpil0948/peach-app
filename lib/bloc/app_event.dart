part of 'app_bloc.dart';

sealed class AppEvent extends Equatable {
  const AppEvent();
}

final class AppStarted extends AppEvent {
  @override
  List<Object> get props => [];
}
