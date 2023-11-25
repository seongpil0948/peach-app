part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  final int selectedPageIndex;
  const HomeState({int? selectedPageIndex})
      : selectedPageIndex = selectedPageIndex ?? 0;

  @override
  List<Object> get props => [];
}

final class HomeLoading extends HomeState {
  const HomeLoading();
}

final class HomeLoaded extends HomeState {
  const HomeLoaded({required super.selectedPageIndex});

  @override
  List<Object> get props => [selectedPageIndex];
}

final class HomeError extends HomeState {
  const HomeError();
}
