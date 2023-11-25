part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();
}

final class HomeStarted extends HomeEvent {
  @override
  List<Object> get props => [];
}

final class SelectPageIndex extends HomeEvent {
  final int index;
  const SelectPageIndex(this.index);

  @override
  List<Object> get props => [index];
}
