import 'package:epaisa_bloc_assignment/Registration/registration_form.dart';
import 'package:epaisa_bloc_assignment/blocs/registration_bloc.dart';
import 'package:epaisa_bloc_assignment/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  final UserRepository _userRepository;

  const RegisterScreen({Key key, UserRepository userRepository})
      : _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: BlocProvider<RegisterBloc>(
        create: (context) => RegisterBloc(userRepository: _userRepository),
        child: Container(
          margin: const EdgeInsets.only(top: 230),
          child: RegisterForm(),
        ),
      ),
    );
  }
}
