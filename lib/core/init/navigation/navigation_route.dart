import 'package:flutter/material.dart';
import 'package:musmeramedya/ui/add_balance/view/first_stage/add_balance_page.dart';
import 'package:musmeramedya/ui/add_balance/view/second_stage/add_balance_second.dart';
import 'package:musmeramedya/ui/contact_us/view/contact_us_detail.dart';
import 'package:musmeramedya/ui/forgotpassword/view/forgot_password_page.dart';
import 'package:musmeramedya/ui/main/view/main_page.dart';
import 'package:musmeramedya/ui/orders/view/orders_page.dart';
import 'package:musmeramedya/ui/payment_successful/view/payment_successful_page.dart';
import 'package:musmeramedya/ui/register/view/register_page.dart';
import 'package:musmeramedya/ui/settings/view/account_status/account_status_page.dart';
import 'package:musmeramedya/ui/settings/view/change_password/change_password_page.dart';
import 'package:musmeramedya/ui/splash/view/splash_page.dart';
import 'package:page_transition/page_transition.dart';

import '../../../product/exception/navigate_model_not_found.dart';
import '../../../ui/invite_system/view/invite_system_page.dart';
import '../../../ui/login/view/loginpage.dart';
import '../../../ui/profile/view/profile_page.dart';
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

      case NavigationConstants.FORGOT_PASSWORD:
        return normalNavigate(ForgotPasswordPage(), NavigationConstants.FORGOT_PASSWORD ,args.arguments);

      case NavigationConstants.MAIN:
        return normalNavigate(MainPage(), NavigationConstants.MAIN ,args.arguments);

      case NavigationConstants.ORDERS:
        return normalNavigate(const OrdersPage(), NavigationConstants.ORDERS ,args.arguments);

      case NavigationConstants.ADD_BALANCE:
        return normalNavigate(const AddBalancePage(), NavigationConstants.ADD_BALANCE ,args.arguments);

      case NavigationConstants.ADD_BALANCE_SECOND:
        return normalNavigate(const AddBalanceSecondStage(), NavigationConstants.ADD_BALANCE_SECOND ,args.arguments);

      case NavigationConstants.PAYMENT_SUCCESSFUL:
        return normalNavigate(PaymentSuccessfulPage(), NavigationConstants.PAYMENT_SUCCESSFUL ,args.arguments);

      case NavigationConstants.CONTACT_US:
        return normalNavigate(const ContactUsPage(), NavigationConstants.CONTACT_US ,args.arguments);

      case NavigationConstants.PROFILE:
        return normalNavigate(const ProfilePage(), NavigationConstants.PROFILE ,args.arguments);

      case NavigationConstants.CHANGE_PASSWORD:
        return normalNavigate(const ChangePasswordPage(), NavigationConstants.CHANGE_PASSWORD ,args.arguments);

      case NavigationConstants.ACCOUNT_STATUS:
        return normalNavigate(AccountSettingsPage(), NavigationConstants.ACCOUNT_STATUS ,args.arguments);

      case NavigationConstants.INVITED_SYSTEM:
        return normalNavigate(const InviteSystemPage(), NavigationConstants.INVITED_SYSTEM ,args.arguments);

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
