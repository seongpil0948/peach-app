import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:peach_app/auth/authentication_repository.dart';
import 'package:peach_app/auth/models/user.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const AppLoading()) {
    on<AppStarted>(_onStarted);
    on<_AppUserChanged>(_onUserChanged);
    on<AppLogoutRequested>(_onLogoutRequested);
    _userSubscription = _authenticationRepository.user.listen(
      (user) => add(_AppUserChanged(user)),
    );
  }
  final AuthenticationRepository _authenticationRepository;

  Future<void> _onStarted(
    AppStarted event,
    Emitter<AppState> emit,
  ) async {
    emit(const AppLoading());
    // await Future.delayed(const Duration(seconds: 5));
  }

  late final StreamSubscription<IUser> _userSubscription;

  void _onUserChanged(_AppUserChanged event, Emitter<AppState> emit) {
    try {
      emit(
        event.user.isNotEmpty
            ? AppLoadedWithAuth(user: event.user)
            : const AppLoadedWithoutAuth(),
      );
    } catch (_) {
      emit(const AppError());
    }
  }

  void _onLogoutRequested(AppLogoutRequested event, Emitter<AppState> emit) {
    // 주어진 Future를 기다리지 않고 계속 진행하도록 해줍니다.
    unawaited(_authenticationRepository.logOut());
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
