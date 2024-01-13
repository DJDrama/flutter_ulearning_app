import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/colors.dart';
import 'package:ulearning_app/pages/home/bloc/home_page_bloc.dart';
import 'package:ulearning_app/pages/home/bloc/home_page_event.dart';
import 'package:ulearning_app/pages/home/bloc/home_page_state.dart';

AppBar buildAppBar() {
  return AppBar(
      title: Container(
          margin: EdgeInsets.only(left: 7.w, right: 7.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 15.w,
                height: 12.h,
                child: Image.asset("assets/icons/menu.png"),
              ),
              GestureDetector(
                child: Container(
                  width: 40.w,
                  height: 40.h,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage("assets/icons/person.png"),
                  )),
                ),
              )
            ],
          )));
}

Widget homePageText(String text,
    {Color color = AppColors.primaryText, int marginTop = 20}) {
  return Container(
    margin: EdgeInsets.only(top: marginTop.h),
    child: Text(
      text,
      style:
          TextStyle(color: color, fontSize: 24.sp, fontWeight: FontWeight.bold),
    ),
  );
}

Widget searchView() {
  return Row(
    children: [
      Container(
        width: 280.w,
        height: 40.h,
        decoration: BoxDecoration(
            color: AppColors.primaryBackground,
            borderRadius: BorderRadius.circular(15.h),
            border: Border.all(color: AppColors.primaryFourthElementText)),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(
                left: 16.w,
              ),
              width: 16.w,
              height: 16.h,
              child: Image.asset("assets/icons/search.png"),
            ),
            SizedBox(
                width: 240.w,
                height: 40.h,
                child: TextField(
                  //onChanged: (value) => func!(value),
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(5, 5, 0, 5),
                    // center vertically
                    hintText: "Search your course",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    hintStyle:
                        TextStyle(color: AppColors.primarySecondaryElementText),
                  ),
                  style: TextStyle(
                      color: AppColors.primaryText,
                      fontFamily: "Avenir",
                      fontWeight: FontWeight.normal,
                      fontSize: 14.sp),
                  autocorrect: false,
                  obscureText: false,
                ))
          ],
        ),
      ),
      GestureDetector(
        child: Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.all(Radius.circular(13.w)),
              border: Border.all(color: AppColors.primaryElement)),
          child: Image.asset("assets/icons/options.png"),
        ),
      )
    ],
  );
}

Widget sliderView(BuildContext context, HomePageState state) {
  return Column(
    children: [
      Container(
          margin: EdgeInsets.only(top: 20.h),
          width: 325.w,
          height: 160.h,
          child: PageView(
            onPageChanged: (value) {
              context.read<HomePageBloc>().add(HomePagePageSwipe(value));
            },
            children: [
              _sliderPage(imagePath: "assets/icons/art.png"),
              _sliderPage(imagePath: "assets/icons/Image_1.png"),
              _sliderPage(imagePath: "assets/icons/Image_2.png")
            ],
          )),
      Container(
          child: DotsIndicator(
        dotsCount: 3,
        position: state.pageIndex,
        decorator: DotsDecorator(
            color: AppColors.primaryThirdElementText,
            activeColor: AppColors.primaryElement,
            size: const Size.square(5.0),
            activeSize: const Size(17.0, 5.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            )),
      ))
    ],
  );
}

// slider's pages
Widget _sliderPage({String imagePath = "assets/icons/art.png"}) {
  return Container(
    width: double.infinity,
    height: 160.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(20.h)),
      image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage(imagePath),
      ),
    ),
  );
}

// menu view for showing items
