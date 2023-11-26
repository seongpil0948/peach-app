part of 'app_bloc.dart';

enum AppStatus {
  authenticated,
  unauthenticated,
}

sealed class AppState extends Equatable {
  const AppState();

  @override
  List<Object> get props => [];
}

final class AppLoading extends AppState {
  const AppLoading();
}

final class AppLoadedWithAuth extends AppState {
  const AppLoadedWithAuth({
    required this.user,
  }) : status = AppStatus.authenticated;

  final AppStatus status;
  final IUser user;

  @override
  List<Object> get props => [];
}

final class AppLoadedWithoutAuth extends AppState {
  const AppLoadedWithoutAuth()
      : status = AppStatus.unauthenticated,
        user = IUser.empty;

  final AppStatus status;
  final IUser user;

  @override
  List<Object> get props => [];
}

final class AppError extends AppState {
  const AppError();
}
