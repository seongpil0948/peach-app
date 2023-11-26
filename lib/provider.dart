import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peach_app/auth/authentication_repository.dart';
import 'package:peach_app/bloc/app_bloc.dart';

class AppProviders extends StatelessWidget {
  const AppProviders(
      {super.key, required this.child, required this.authenticationRepository});
  final Widget child;
  final AuthenticationRepository authenticationRepository;
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: authenticationRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  AppBloc(authenticationRepository: authenticationRepository))
        ],
        child: child,
      ),
    );
  }
}
