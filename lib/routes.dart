import 'package:get/get.dart';
import 'package:salesapp/screens/dashboard/dashboard_binding.dart';
import 'package:salesapp/screens/dashboard/dashboard_view.dart';
import 'package:salesapp/screens/forgot_password/forgot_pass_binding.dart';
import 'package:salesapp/screens/forgot_password/forgot_pass_view.dart';
import 'package:salesapp/screens/login/login_binding.dart';
import 'package:salesapp/screens/login/login_view.dart';
import 'package:salesapp/screens/mailcheck/mail_check_binding.dart';
import 'package:salesapp/screens/mailcheck/mail_check_view.dart';
import 'package:salesapp/screens/splashscreen.dart';

class Routes {
  static const splash = '/';
  static const login = '/login';
  static const forgotPassPage = '/forgotpasspage';
  static const mailCheckPage = '/mailcheckpage';
  static const dashBoardPage = '/dashboardpage';


  static final routes = [
    GetPage(
      name: splash,
      page: () => SplashScreen(),
    ),
    GetPage(
      binding: LoginViewBindings(),
      name: login,
      page: () => const LoginView(),
    ),
    GetPage(
      binding: ForgotViewBindings(),
      name: forgotPassPage,
      page: () => const ForgotPassView(),
    ),
    GetPage(
      binding: MailCheckBindings(),
      name: mailCheckPage,
      page: () => const MailCheckView(),
    ),
    GetPage(
      binding: DashboardViewBindings(),
      name: dashBoardPage,
      page: () => const DashBoardView(),
    ),

  ];
}
