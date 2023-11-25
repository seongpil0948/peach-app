part of 'app_bloc.dart';

sealed class AppState extends Equatable {
  const AppState();

  @override
  List<Object> get props => [];
}

final class AppLoading extends AppState {}

final class AppLoaded extends AppState {
  const AppLoaded();

  @override
  List<Object> get props => [];
}

final class AppError extends AppState {}
