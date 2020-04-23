import 'package:biometric_auth/src/pages/main_indicators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'backend/authentication_bloc/authentication_bloc.dart';
import 'backend/authentication_bloc/authentication_event.dart';
import 'backend/authentication_bloc/authentication_state.dart';
import 'backend/authentication_bloc/simple_bloc_delegate.dart';
import 'backend/ui/login_screen.dart';
import 'backend/ui/splash_screen.dart';
import 'backend/user_repository/user_repository.dart';
import 'src/pages/homepage.dart';

 
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final UserRepository userRepository = UserRepository();
  runApp(
    BlocProvider(
      create: (context) =>
          AuthenticationBloc(userRepository: userRepository)..add(AppStarted()),
      child: MyApp(userRepository: userRepository),
    ),
  );
}
 
class MyApp extends StatelessWidget {
  final UserRepository _userRepository;
  const MyApp({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
  final theme = Provider.of<AuthenticationBloc>(context);
    return MaterialApp(
      
      theme: theme.getTheme(),
      routes: {
        '/mainIndicators': (context) => MainIndicators(),
        '/homePage': (context) => HomePage(),
      },
      debugShowCheckedModeBanner: false,
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
        if (state is Uninitialized) {
          return SplassScreen();
        }
        if (state is Authenticated) {
          return HomePage(
              // user: state.user,
              // userRepository: _userRepository,
              );
        }
        if (state is Unauthenticated) {
          return LoginScreen(
            userRepository: _userRepository,
          );
        }
        return Container();
      }),
    );
  }
}