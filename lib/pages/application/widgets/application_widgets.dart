import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/pages/home/home_page.dart';

import '../../../common/values/colors.dart';

Widget buildPage(int index) {
  List<Widget> widget = [
    const HomePage(),
    const Center(child: Text("Search")),
    const Center(child: Text("Course")),
    const Center(child: Text("Chat")),
    const Center(child: Text("Profile")),
  ];
  return widget[index];
}


var bottomTabs = [
  BottomNavigationBarItem(
      icon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset("assets/icons/home.png"),
      ),
      label: "Home",
      activeIcon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset(
          "assets/icons/home.png",
          color: AppColors.primaryElement,
        ),
      )),
  BottomNavigationBarItem(
      icon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset("assets/icons/search2.png"),
      ),
      activeIcon: SizedBox(
          width: 15.w,
          height: 15.h,
          child: Image.asset(
            "assets/icons/search2.png",
            color: AppColors.primaryElement,
          )),
      label: "Search"),
  BottomNavigationBarItem(
      icon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset("assets/icons/play-circle1.png"),
      ),
      activeIcon: SizedBox(
          width: 15.w,
          height: 15.h,
          child: Image.asset(
            "assets/icons/play-circle1.png",
            color: AppColors.primaryElement,
          )),
      label: "Course"),
  BottomNavigationBarItem(
      icon: SizedBox(
        width: 15.w,
        height: 15.h,
        child:
        Image.asset("assets/icons/message-circle.png"),
      ),
      activeIcon: SizedBox(
          width: 15.w,
          height: 15.h,
          child: Image.asset(
            "assets/icons/message-circle.png",
            color: AppColors.primaryElement,
          )),
      label: "Chat"),
  BottomNavigationBarItem(
      icon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset("assets/icons/person2.png"),
      ),
      activeIcon: SizedBox(
          width: 15.w,
          height: 15.h,
          child: Image.asset(
            "assets/icons/person2.png",
            color: AppColors.primaryElement,
          )),
      label: "Profile"),
];