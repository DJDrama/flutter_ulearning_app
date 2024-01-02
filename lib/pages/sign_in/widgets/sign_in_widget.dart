import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar() {
  return AppBar(
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(
        color: Colors.grey.withOpacity(0.5),
        // height defines the thickness of the line
        height: 1.0,
      ),
    ),
    title: Text("Log In",
        style: TextStyle(
            color: Colors.black,
            fontSize: 16.sp,
            fontWeight: FontWeight.normal)),
  );
}

// need context for accessing bloc
Widget buildThirdPartyLogIn(BuildContext context) {
  return Center(
    child: Container(
      margin: EdgeInsets.only(
        top: 40.h,
        bottom: 20.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _reusableIcons("google"),
          _reusableIcons("apple"),
          _reusableIcons("facebook"),
        ],
      ),
    ),
  );
}

Widget _reusableIcons(String iconName) {
  return GestureDetector(
      onTap: () {},
      child: SizedBox(
        width: 40.w,
        height: 40.w,
        child: Image.asset(
          "assets/icons/$iconName.png",
        ),
      ));
}

Widget reusableText(String text) {
  return Container(
    margin: EdgeInsets.only(
      bottom: 5.h,
    ),
    child: Text(text,
        style: TextStyle(
            color: Colors.grey.withOpacity(0.5),
            fontWeight: FontWeight.normal,
            fontSize: 14.sp)),
  );
}

Widget buildTextField(String hintText, String textType, String iconName) {
  return Container(
      width: 325.w,
      height: 50.h,
      margin: EdgeInsets.only(bottom: 20.h),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15.w)),
          border: Border.all(color: Colors.black)),
      child: Row(
        children: [
          Container(
            width: 16.w,
            height: 16.w,
            margin: EdgeInsets.only(left: 17.w),
            child: Image.asset("assets/icons/$iconName.png"),
          ),
          SizedBox(
              width: 270.w,
              height: 50.h,
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: hintText,
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  disabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
                ),
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Avenir",
                    fontWeight: FontWeight.normal,
                    fontSize: 14.sp),
                autocorrect: false,
                obscureText: textType == "password" ? true : false,
              ))
        ],
      ));
}

Widget forgotPassword() {
  return Container(
    width: 260.w,
    height: 44.h,
    margin: EdgeInsets.only(left: 25.w),
    child: GestureDetector(
      onTap: () {},
      child: Text(
        "Forgot password?",
        style: TextStyle(
            color: Colors.black,
            fontSize: 12.sp,
            decoration: TextDecoration.underline,
            decorationColor: Colors.blue // underline color
            ),
      ),
    ),
  );
}

Widget buildLogInAndRegisterButton(String buttonName, String buttonType) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      width: 325.w,
      // double.infinity.w,
      height: 50.h,
      margin: EdgeInsets.symmetric(horizontal: 25.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: buttonType=="login"? Colors.blue: Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(15.w)),
        boxShadow: [
          BoxShadow(
            blurRadius: 1,
            spreadRadius: 2,
            offset: const Offset(0, 1),
            color: Colors.grey.withOpacity(0.1),
          )
        ],
      ),
      child: Center(
          child: Text(
        buttonName,
        style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.normal,
            color: Colors.white),
      )),
    ),
  );
}
