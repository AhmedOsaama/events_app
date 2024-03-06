import 'dart:developer';

import 'package:events_app/core/firebase_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../../core/app_colors.dart';
import '../../../../../core/style_utils.dart';
import '../../../../../core/validator.dart';
import '../../../../../core/widgets/generic_button.dart';
import '../../../../../core/widgets/generic_text_field.dart';
import '../../../../events/presentation/views/events_screen.dart';

class RegisterScreenBody extends StatefulWidget {
  RegisterScreenBody({Key? key}) : super(key: key);

  @override
  State<RegisterScreenBody> createState() => _RegisterScreenBodyState();
}

class _RegisterScreenBodyState extends State<RegisterScreenBody> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();

  bool _isLogin = false;

  String _email = "";

  String _password = "";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 100,
              ),
              Center(
                child: Text(
                  _isLogin ? "Welcome Back" : "Create an account",
                  style: TextStyles.textViewSemiBold30.copyWith(color: prussian),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Email",
                style: TextStyles.textViewBold12.copyWith(color: gunmetal),
              ),
              const SizedBox(
                height: 10,
              ),
              GenericField(
                hintText: "Brandonelouis@gmail.com",
                validation: (value) => Validator.email(value),
                onSaved: (value) {
                  _email = value!;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Password",
                style: TextStyles.textViewBold12.copyWith(color: gunmetal),
              ),
              const SizedBox(
                height: 10,
              ),
              GenericField(
                controller: _passwordController,
                hintText: "password",
                obscureText: true,
                validation: (value) => Validator.password(value),
                onSaved: (value){
                  _password = value!;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              if(!_isLogin) Text(
                "Confirm Password",
                style: TextStyles.textViewBold12.copyWith(color: gunmetal),
              ),
              const SizedBox(
                height: 10,
              ),
             if(!_isLogin) GenericField(
                hintText: "confirm password",
                obscureText: true,
                validation: (confirmPassword) =>
                    Validator.confirmPassword(confirmPassword, _passwordController.text.trim()),
              ),
              const SizedBox(
                height: 10,
              ),
              GenericButton(
                  shadow: [BoxShadow(blurRadius: 9, offset: const Offset(0, 10), color: verdigris.withOpacity(0.25))],
                  height: 70,
                  color: brightOrange,
                  borderRadius: BorderRadius.circular(6),
                  width: double.infinity,
                  onPressed: () {
                    authenticateUser(context);
                  },
                  child: Text(
                    _isLogin ? "Login" : "Sign up",
                    style: TextStyles.textViewSemiBold16,
                  )),
              const SizedBox(
                height: 12,
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: GestureDetector(
                  onTap: switchRegistrationMode,
                  child: Text.rich(
                    TextSpan(
                        text: _isLogin ? "Don't have an account ?" : "Have an account ?",
                        style: TextStyles.textViewRegular12.copyWith(
                          color: const Color.fromRGBO(82, 75, 107, 1),
                        ),
                        children: [
                          TextSpan(
                              text: " ${_isLogin ? "Sign up" : "Login"}",
                              style: TextStyles.textViewRegular12.copyWith(
                                  decoration: TextDecoration.underline, color: const Color.fromRGBO(255, 146, 40, 1)))
                        ]),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void switchRegistrationMode() {
    setState(() {
      _isLogin = !_isLogin;
    });
  }

  Future<void> authenticateUser(BuildContext context) async {
    var isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
      if (_isLogin) {
        try {
          print(_email);
          print(_password);
          await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
          log("user successfully signed in");
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => EventsScreen()));
        } on FirebaseException catch (e) {
          log("Couldn't login user: $e");
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(e.message.toString()),
            backgroundColor: Theme.of(context).colorScheme.error,
          ));
        }
      } else {
        try {
          var userCredentials =
              await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
          log("user successfully signed up");
          var userData = {
            "email": _email,
            "id": userCredentials.user!.uid,
          };
          await FirestoreUtils.firestoreUserCollection.add(userData);
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => EventsScreen()));
        } on FirebaseException catch (e) {
          log("Couldn't register user: $e");
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(e.message.toString()),
            backgroundColor: Theme.of(context).colorScheme.error,
          ));
        }
        //register user
      }
    }
  }
}
