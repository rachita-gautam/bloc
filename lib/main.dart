import 'package:epaisa_bloc_assignment/HomeScreen.dart';
import 'package:epaisa_bloc_assignment/Login/LogInScreen.dart';
import 'package:epaisa_bloc_assignment/Login/loginForm.dart';
import 'package:epaisa_bloc_assignment/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/authentication_bloc.dart';
import 'blocs/authentication_event.dart';
import 'blocs/authentication_state.dart';
import 'blocs/simple_bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  Bloc.observer = SimpleBlocObserver();
  final UserRepository userRepository = UserRepository();
  runApp(
    BlocProvider(
      create: (context) => AuthenticationBloc(
        userRepository: userRepository,
      )..add(AuthenticationStarted()),
      child: MyApp(
        userRepository: userRepository,
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  final UserRepository _userRepository;

  MyApp({UserRepository userRepository}) : _userRepository = userRepository;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationFailure) {
            return LogInScreen(
                // userRepository: _userRepository,
                );
          }

          if (state is AuthenticationSuccess) {
            return HomeScreen();
          }

          return Container();
        },
      ),
    );
  }
}
