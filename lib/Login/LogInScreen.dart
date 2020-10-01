import 'package:epaisa_bloc_assignment/blocs/login_bloc.dart';
import 'package:epaisa_bloc_assignment/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'loginForm.dart';

class LogInScreen extends StatelessWidget {
  final UserRepository _userRepository;

  const LogInScreen({Key key, UserRepository userRepository})
      : _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(userRepository: _userRepository),
          child: Container(
            margin: const EdgeInsets.only(top: 230),
            child: LogInForm(
              userRepository: _userRepository,
            ),
          )),
    );
  }
}
