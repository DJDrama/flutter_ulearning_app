import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/pages/application/bloc/app_blocs.dart';
import 'package:ulearning_app/pages/application/bloc/app_events.dart';
import 'package:ulearning_app/pages/application/bloc/app_states.dart';
import 'package:ulearning_app/pages/application/widgets/application_widgets.dart';

import '../../common/values/colors.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(builder: (context, state) {
      return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              body: buildPage(state.index),
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
                    currentIndex: state.index,
                    onTap: (value) {
                      context.read<AppBloc>().add(AppEventTapBottomBar(value));
                    },
                    type: BottomNavigationBarType.fixed,
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    selectedItemColor: AppColors.primaryElement,
                    unselectedItemColor: AppColors.primaryFourthElementText,
                    items: bottomTabs,
                  )),
            ),
          ));
    });
  }
}