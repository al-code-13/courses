import 'package:biometric_auth/backend/bloc/bloc.dart';
import 'package:biometric_auth/backend/user_repository/user_repository.dart';
import 'package:biometric_auth/src/pages/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  final UserRepository _userRepository;

  LoginScreen({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(userRepository: _userRepository),
        child: LoginPage(
           userRepository: _userRepository,
        ),
      ),
    );
  }
}
