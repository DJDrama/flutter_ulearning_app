import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/pages/application/application_page.dart';
import 'package:ulearning_app/pages/application/bloc/app_blocs.dart';
import 'package:ulearning_app/pages/register/bloc/register_blocs.dart';
import 'package:ulearning_app/pages/register/register.dart';
import 'package:ulearning_app/pages/sign_in/bloc/signin_blocs.dart';
import 'package:ulearning_app/pages/sign_in/sign_in.dart';
import 'package:ulearning_app/pages/welcome/welcome.dart';

import '../../pages/welcome/bloc/welcome_blocs.dart';
import 'names.dart';

class AppPages {
  static List<PageEntity> _getRoutes() {
    return [
      PageEntity(
        route: AppRoutes.INITIAL,
        page: const Welcome(),
        bloc: BlocProvider(create: (_) => WelcomeBloc()),
      ),
      PageEntity(
        route: AppRoutes.SIGN_IN,
        page: const SignIn(),
        bloc: BlocProvider(create: (_) => SignInBloc()),
      ),
      PageEntity(
        route: AppRoutes.REGISTER,
        page: const Register(),
        bloc: BlocProvider(create: (_) => RegisterBloc()),
      ),
      PageEntity(
        route: AppRoutes.APPLICATION,
        page: const ApplicationPage(),
        bloc: BlocProvider(create: (_) => AppBloc()),
      ),
    ];
  }

  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var route in _getRoutes()) {
      blocProviders.add(route.bloc);
    }
    return blocProviders;
  }

  // a modal that covers entire screen as we click on navigator object
  static MaterialPageRoute generateRouteSettings(RouteSettings routeSettings) {
    if (routeSettings.name != null) {
      // check for route name
      var result =
          _getRoutes().where((element) => element.route == routeSettings.name);
      if (result.isNotEmpty) {
        print("Valid route name : ${routeSettings.name}");
        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: routeSettings);
      }
    }
    print("Invalid route name : ${routeSettings.name}");

    return MaterialPageRoute(
        builder: (_) => const SignIn(), settings: routeSettings);
  }
}

// unified blocProvider and routes and pages
class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({
    required this.route,
    required this.page,
    this.bloc,
  });
}
