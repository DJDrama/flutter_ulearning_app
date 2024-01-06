import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/pages/register/bloc/register_blocs.dart';
import 'package:ulearning_app/pages/register/bloc/register_events.dart';
import 'package:ulearning_app/pages/register/bloc/register_states.dart';

import '../common_widgets.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
      return Container(
        color: Colors.white,
        child: SafeArea(
            child: Scaffold(
                backgroundColor: Colors.white,
                appBar: buildAppBar("Sign up"),
                body: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 16.h,
                    ),
                    Center(
                        child: reusableText(
                            "Enter your details below and please sign up.")),
                    Container(
                      margin: EdgeInsets.only(top: 32.h),
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reusableText("User Name"),
                          buildTextField("Enter your user name", "name", "user",
                              (value) {
                            context
                                .read<RegisterBloc>()
                                .add(RegisterInputUserName(value));
                          }),
                          reusableText("Email"),
                          buildTextField(
                              "Enter your email address", "email", "user",
                              (value) {
                            context
                                .read<RegisterBloc>()
                                .add(RegisterInputEmail(value));
                          }),
                          reusableText("Password"),
                          buildTextField(
                              "Enter your password", "password", "lock",
                              (value) {
                            context
                                .read<RegisterBloc>()
                                .add(RegisterInputPassword(value));
                          }),
                          reusableText("Confirm Password"),
                          buildTextField(
                              "Enter your confirm password", "password", "lock",
                              (value) {
                            context
                                .read<RegisterBloc>()
                                .add(RegisterInputConfirmPassword(value));
                          }),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 25.w),
                      child: reusableText(
                          "By creating an account, you have to agree with our term and conditions."),
                    ),
                    buildLogInAndRegisterButton("Sign up", "login", () {
                      Navigator.of(context).pushNamed("register");
                    }),
                  ],
                )))),
      );
    });
  }
}
