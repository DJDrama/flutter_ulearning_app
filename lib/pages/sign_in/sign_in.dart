import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/routes/routes.dart';
import 'package:ulearning_app/pages/sign_in/bloc/signin_blocs.dart';
import 'package:ulearning_app/pages/sign_in/bloc/signin_events.dart';
import 'package:ulearning_app/pages/sign_in/bloc/signin_states.dart';
import 'package:ulearning_app/pages/sign_in/signin_controller.dart';

import '../common_widgets.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
      return Container(
        color: Colors.white,
        child: SafeArea(
            child: Scaffold(
                backgroundColor: Colors.white,
                appBar: buildAppBar("Log in"),
                body: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildThirdPartyLogIn(context),
                    Center(
                        child:
                            reusableText("Or use your email account to login")),
                    Container(
                      margin: EdgeInsets.only(top: 32.h),
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reusableText("Email"),
                          SizedBox(
                            height: 5.h,
                          ),
                          buildTextField(
                              "Enter your email address", "email", "user",
                              (value) {
                            context.read<SignInBloc>().add(EmailEvent(value));
                          }),
                          reusableText("Password"),
                          SizedBox(
                            height: 5.h,
                          ),
                          buildTextField(
                              "Enter your password", "password", "lock",
                              (value) {
                            context
                                .read<SignInBloc>()
                                .add(PasswordEvent(value));
                          }),
                        ],
                      ),
                    ),
                    forgotPassword(),
                    buildLogInAndRegisterButton("Log in", "login", () {
                      SignInController(context: context).handleSignIn("email");
                    }),
                    buildLogInAndRegisterButton("Sign up", "register", () {
                      Navigator.of(context).pushNamed(AppRoutes.REGISTER);
                    }),
                  ],
                )))),
      );
    });
  }
}
