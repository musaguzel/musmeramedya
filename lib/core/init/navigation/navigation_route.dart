import 'package:flutter/material.dart';
import 'package:musmeramedya/ui/add_balance/view/first_stage/add_balance_page.dart';
import 'package:musmeramedya/ui/add_balance/view/second_stage/add_balance_second.dart';
import 'package:musmeramedya/ui/main/view/main_page.dart';
import 'package:musmeramedya/ui/orders/view/orders_page.dart';
import 'package:musmeramedya/ui/register/view/register_page.dart';
import 'package:musmeramedya/ui/splash/view/splash_page.dart';
import 'package:page_transition/page_transition.dart';

import '../../../product/exception/navigate_model_not_found.dart';
import '../../../ui/login/view/loginpage.dart';
import '../constants/navigation/navigation_constants.dart';


class NavigationRoute {
  NavigationRoute._init();

  static final NavigationRoute _instance = NavigationRoute._init();

  static NavigationRoute get instance => _instance;

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.DEFAULT:
        return normalNavigate(const SplashPage(), NavigationConstants.DEFAULT ,args.arguments);

      case NavigationConstants.LOGIN:
        return normalNavigate(const LoginPage(), NavigationConstants.LOGIN ,args.arguments);

      case NavigationConstants.REGISTER:
        return normalNavigate(const RegisterPage(), NavigationConstants.REGISTER ,args.arguments);

      case NavigationConstants.MAIN:
        return normalNavigate(MainPage(), NavigationConstants.MAIN ,args.arguments);

      case NavigationConstants.ORDERS:
        return normalNavigate(const OrdersPage(), NavigationConstants.ORDERS ,args.arguments);

      case NavigationConstants.ADD_BALANCE:
        return normalNavigate(const AddBalancePage(), NavigationConstants.ADD_BALANCE ,args.arguments);

      case NavigationConstants.ADD_BALANCE_SECOND:
        return normalNavigate(const AddBalanceSecondStage(), NavigationConstants.ADD_BALANCE_SECOND ,args.arguments);

      case NavigationConstants.NOTFOUND:
        return normalNavigate( const NotFoundNavigationWidget(), NavigationConstants.NOTFOUND ,args.arguments);

      default:
        return MaterialPageRoute(
          builder: (context) => const NotFoundNavigationWidget(),
        );
    }
  }

  PageTransition normalNavigate(Widget widget, String pageName,Object? data) {
    return PageTransition(
        type: PageTransitionType.fade,
      settings: RouteSettings(name: pageName,arguments: data),child: widget,
    );
  }
}
