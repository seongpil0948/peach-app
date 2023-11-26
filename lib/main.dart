import 'package:flutter/material.dart';
import 'package:peach_app/auth/authentication_repository.dart';
import 'package:peach_app/bloc_observer.dart';
import 'package:peach_app/config/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:peach_app/provider.dart';
import 'firebase_options.dart';
import 'package:bloc/bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = const AppBlocObserver();

  await Firebase.initializeApp();

  final authenticationRepository = AuthenticationRepository();
  await authenticationRepository.user.first;

  runApp(PeachApp(authenticationRepository: authenticationRepository));
}

class PeachApp extends StatelessWidget {
  const PeachApp({super.key, required this.authenticationRepository});
  final AuthenticationRepository authenticationRepository;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AppProviders(
      authenticationRepository: authenticationRepository,
      child: MaterialApp.router(
        title: 'Peach App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: appRouter,
        // home: const HomeView(title: 'Home Screen'),
      ),
    );
  }
}
