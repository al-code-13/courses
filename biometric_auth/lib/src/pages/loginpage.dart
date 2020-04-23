
import 'package:biometric_auth/backend/authentication_bloc/authentication_bloc.dart';
import 'package:biometric_auth/backend/authentication_bloc/authentication_event.dart';
import 'package:biometric_auth/backend/bloc/bloc.dart';
import 'package:biometric_auth/backend/user_repository/user_repository.dart';
import 'package:biometric_auth/src/pages/main_indicators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import 'dart:ui';


class LoginPage extends StatefulWidget {
  final UserRepository _userRepository;
  LoginPage({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  LoginBloc _loginBloc;
  final LocalAuthentication auth = LocalAuthentication();
  String user;
  String password;

  UserRepository get _userRepository => widget._userRepository;
  bool get isPopulated =>
      _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;
  bool isLoginButtonEnable(LoginState state) {
    return state.isFormValid && isPopulated && !state.isSubmitting;
  }

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
    // _scrollController.addListener(() {
    //   if (_scrollController.position.pixels ==
    //       _scrollController.position.maxScrollExtent) {}
    // });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onEmailChanged() {
    _loginBloc.add(EmailChanged(email: _emailController.text));
  }

  void _onPasswordChanged() {
    _loginBloc.add(PasswordChanged(password: _passwordController.text));
  }

  void _onFormSubmitted() {
    _loginBloc.add(LoginWithEmailAndPassword(
        email: _emailController.text, password: _passwordController.text));
  }

  Widget circulo() {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        color: Color.fromRGBO(0, 0, 0, 0.08),
        shape: BoxShape.circle,
      ),
    );
  }

  double _sigmaX = 0.0; // from 0-10
  double _sigmaY = 0.0; // from 0-10
  double _opacity = 0.3; // from 0-1.0
  bool valueTheme = false;
  @override
  Widget build(BuildContext context) {
    AuthenticationBloc _themeChanger = Provider.of<AuthenticationBloc>(context);
    final size = MediaQuery.of(context).size;
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.isFailure) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Fallo al Iniciar Sesión"),
                    Icon(Icons.error),
                  ],
                ),
                backgroundColor: Colors.red,
              ),
            );
        }
        if (state.isSubmitting) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Iniciando Sesión..."),
                    CircularProgressIndicator(),
                  ],
                ),
              ),
            );
        }
        if (state.isSuccess) {
          BlocProvider.of<AuthenticationBloc>(context).add(LoggedIn());
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          final size = MediaQuery.of(context).size;
          return Stack(
            children: <Widget>[
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  height: size.height,
                  width: size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/background.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: _sigmaX, sigmaY: _sigmaY),
                    child: Container(
                      color: Colors.black.withOpacity(_opacity),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: size.width * 0,
                top: -size.height * 0.5,
                child: RotationTransition(
                  turns: AlwaysStoppedAnimation(45 / 360),
                  child: Container(
                    height: size.height * 2,
                    width: size.width,
                    alignment: Alignment.center,
                    child: BackdropFilter(
                      filter:
                          ImageFilter.blur(sigmaX: _sigmaX, sigmaY: _sigmaY),
                      child: Container(
                        color: Colors.white.withOpacity(0.4),
                      ),
                    ),
                  ),
                ),
              ),
              Scaffold(
                backgroundColor: Colors.transparent,
                body: SingleChildScrollView(
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: size.height,
                      width: size.width * 0.8,
                      child: SafeArea(
                        top: true,
                        child: Theme(
                          data: ThemeData(
                            primaryColor: Colors.white,
                            hintColor: Colors.white,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Align(
                                alignment: Alignment.topRight,
                                child: Image.asset(
                                  'assets/logoirys.PNG',
                                  height: size.width * 0.6,
                                  width: size.width * 0.6,
                                ),
                              ),
                              Column(
                                children: <Widget>[
                                  TextField(
                                    onChanged: (v) {
                                      setState(() {
                                        user = v;
                                      });
                                    },
                                    style: TextStyle(
                                      fontSize: 25.0,
                                      color: Colors.blueAccent,
                                    ),
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      contentPadding: EdgeInsets.fromLTRB(
                                          20.0, 15.0, 20.0, 15.0),
                                      prefixIcon: Icon(
                                        Icons.people,
                                        color: Colors.white,
                                      ),
                                      hintText: "Usuario",
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blueAccent,
                                            width: 32.0),
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color.fromRGBO(
                                                255, 255, 255, 0.5),
                                            width: 32.0),
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color.fromRGBO(
                                                255, 255, 255, 0.8),
                                            width: 32.0),
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  TextField(
                                    onChanged: (v) {
                                      setState(() {
                                        password = v;
                                      });
                                    },
                                    style: TextStyle(
                                      fontSize: 25.0,
                                      color: Colors.blueAccent,
                                    ),
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      contentPadding: EdgeInsets.fromLTRB(
                                          20.0, 15.0, 20.0, 15.0),
                                      prefixIcon: Icon(
                                        Icons.lock_outline,
                                        color: Colors.white,
                                      ),
                                      hintText: "Contraseña",
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blueAccent,
                                            width: 32.0),
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color.fromRGBO(
                                                255, 255, 255, 0.5),
                                            width: 32.0),
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color.fromRGBO(
                                                255, 255, 255, 0.8),
                                            width: 32.0),
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 32,
                                  ),
                                  ButtonTheme(
                                    minWidth: size.width,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 15),
                                    child: RaisedButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      onPressed: password != null &&
                                              user != null
                                          ? () {
                                              if (password == "exito" &&
                                                  user == "exito") {
                                                  setState(() {
                                                    
                                                  });
                                                valueTheme = false;

                                                _themeChanger
                                                    .setTheme(valueTheme);
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        MainIndicators(),
                                                  ),
                                                );
                                              }
                                              if (password == "d1" &&
                                                  user == "d1") {
                                                print("object");
                                                setState(() {
                                                    
                                                  });
                                                valueTheme = true;
                                                _themeChanger
                                                    .setTheme(valueTheme);
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        MainIndicators(),
                                                  ),
                                                );
                                              }
                                            }
                                          : null,
                                      child: Text(
                                        'Login',
                                        style: TextStyle(
                                            fontSize: 24, color: Colors.white),
                                      ),
                                      color: Colors.cyan,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 32,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      _biometric();
                                    },
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                            "https://pc-solucion.es/wp-content/uploads/2019/09/que-es-apple-touch-id.png",
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 32,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Future _biometric() async {
    bool flag = true;
    if (flag) {
      bool authenticated = false;
      const androidString = const AndroidAuthMessages(
          cancelButton: "Cancelar",
          goToSettingsButton: "Ajustes",
          signInTitle: "Autentiquese",
          fingerprintNotRecognized: "Huella no reconocida",
          fingerprintSuccess: "Success",
          goToSettingsDescription: "Configura tu huella");
      try {
        authenticated = await auth
            .authenticateWithBiometrics(
          localizedReason: "",
          useErrorDialogs: true,
          stickyAuth: true,
          androidAuthStrings: androidString,
        )
            .then((onValue) {
          if (onValue) {
            print(onValue);
            //print(authenticated);
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (BuildContext context) => MainIndicators()),
            );
          }
        });
        if (!authenticated) {
          print("ay que esperar que no se joda");
          //exit(0);
        }
      } catch (e) {
        print(e);
      }
      if (!mounted) {
        return;
      }
    }
  }
}
