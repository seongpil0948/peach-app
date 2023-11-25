import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peach_app/home/bloc/home_bloc.dart';

class HomeProviders extends StatelessWidget {
  const HomeProviders({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => HomeBloc())],
      child: child,
    );
  }
}
