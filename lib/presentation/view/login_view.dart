import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/core/bloc/login/login_bloc.dart';
import 'package:test_flutter/core/domain/usecase/login_usecase.dart';
import 'package:test_flutter/injection_container.dart';
import 'package:test_flutter/presentation/view/user_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginBloc loginBloc = sl();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _isObscure = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget apiCall() {
      return BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          switch (state) {
            case LoginSuccess():
              {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Berhasil Login"),
                ));

                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const UserView(),
                  ),
                );
              }
            case LoginError():
              {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Gagal Login"),
                ));
              }
          }
        },
        child: Container(),
      );
    }

    return BlocProvider<LoginBloc>(
      create: (context) => loginBloc,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                apiCall(),
                Text("TEST FLUTTER",
                    style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: 32),
                TextField(
                  inputFormatters: <TextInputFormatter>[
                    LengthLimitingTextInputFormatter(20),
                  ],
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1.5,
                        color: Colors.red,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(16),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1.5,
                        color: Color.fromARGB(255, 158, 158, 158),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(16),
                      ),
                    ),
                    hintText: "Email",
                    prefixIcon: Icon(
                      CupertinoIcons.person,
                      color: Colors.black,
                    ),
                  ),
                  onTapOutside: (event) {
                    setState(() {
                      FocusScopeNode currentFocus = FocusScope.of(context);
                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.focusedChild?.unfocus();
                      }
                    });
                  },
                ),
                const SizedBox(height: 8),
                TextField(
                  key: const Key('passwordTextField'),
                  inputFormatters: <TextInputFormatter>[
                    LengthLimitingTextInputFormatter(15),
                  ],
                  obscureText: _isObscure,
                  controller: passwordController,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1.5,
                        color: Colors.red,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(16),
                      ),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1.5,
                        color: Color.fromARGB(255, 158, 158, 158),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(16),
                      ),
                    ),
                    hintText: "Password",
                    prefixIcon: const Icon(
                      CupertinoIcons.lock,
                      color: Colors.black,
                    ),
                    suffixIcon: IconButton(
                      focusColor: Colors.black,
                      color: Colors.black,
                      icon: Icon(_isObscure
                          ? CupertinoIcons.eye
                          : CupertinoIcons.eye_slash),
                      onPressed: () {
                        _toggle();
                      },
                    ),
                  ),
                  onTapOutside: (event) {
                    setState(() {
                      FocusScopeNode currentFocus = FocusScope.of(context);
                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.focusedChild?.unfocus();
                      }
                    });
                  },
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      loginBloc.add(GetLogin(
                          loginParam: LoginParam(
                        // email: "eve.holt@reqres.in",
                        // password: "cityslicka",
                        email: emailController.text,
                        password: passwordController.text,
                      )));
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _toggle() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }
}
