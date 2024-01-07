import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/pages/application/widgets/application_widgets.dart';

import '../../common/values/colors.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            body: buildPage(_index),
            bottomNavigationBar: Container(
                width: double.infinity,
                height: 58.h,
                decoration: BoxDecoration(
                    color: AppColors.primaryElement,
                    // topLeft, topRight like margin
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.h),
                        topRight: Radius.circular(20.h)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 1,
                          spreadRadius: 1)
                    ]),
                child: BottomNavigationBar(
                  elevation: 0,
                  currentIndex: _index,
                  onTap: (value) {
                    setState(() {
                      _index = value;
                    });
                  },
                  type: BottomNavigationBarType.fixed,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  selectedItemColor: AppColors.primaryElement,
                  unselectedItemColor: AppColors.primaryFourthElementText,
                  items: [
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
                          child: Image.asset("assets/icons/message-circle.png"),
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
                  ],
                )),
          ),
        ));
  }
}
