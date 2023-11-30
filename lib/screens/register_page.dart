import 'package:chat_app/screens/blocs/auth_bloc/auth_bloc.dart';
import 'package:chat_app/screens/chat_page.dart';
import 'package:chat_app/screens/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../constants.dart';
import '../helper/show_snack_bar.dart';
import '../main.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_passfield.dart';
import '../widgets/custom_txtfield.dart';

class RegisterPage extends StatelessWidget {
  static String id = "RegisterPage";
  String? Email;

  String? password;

  bool isLoading = false;

  GlobalKey<FormState> globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          isLoading = true;
        } else if (state is RegisterSuccess) {
          isLoading = false;
          Navigator.popAndPushNamed(context, Login.id);
        } else if (state is RegisterFailure) {
          isLoading = false;
          showSnackBar(context, state.errorName);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Scaffold(
            body: Form(
              key: globalKey,
              child: Container(
                decoration: const BoxDecoration(color: PGColor
                    // image: DecorationImage(
                    //   image: kPrimaryImage,
                    //   fit: BoxFit.cover,
                    // ),
                    ),
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 200,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 50),
                      alignment: Alignment.topLeft,
                      child: const Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTxtFormField(
                      onChange: (data) {
                        Email = data.trim();
                      },
                      hitText: "Email",
                      prefixIcon: Icons.person,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomPassField(
                      onChange: (data) {
                        password = data.trim();
                      },
                      hitText: "Password",
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomButton(
                      onPressed: () async {
                        if (globalKey.currentState!.validate()) {
                          BlocProvider.of<AuthBloc>(context)
                              .add(RegisterEvent(email: Email! , password: password!));
                        }
                      },
                      text: "Signup",
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account?",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
