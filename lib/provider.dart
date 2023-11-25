import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peach_app/bloc/app_bloc.dart';

class AppProviders extends StatelessWidget {
  const AppProviders({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => AppBloc())],
      child: child,
    );
  }
}
