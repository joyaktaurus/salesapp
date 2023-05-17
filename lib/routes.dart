import 'package:get/get.dart';
import 'package:salesapp/screens/addorder/addorder_binding.dart';
import 'package:salesapp/screens/addorder/addorder_view.dart';
import 'package:salesapp/screens/addproduct/addproduct_binding.dart';
import 'package:salesapp/screens/addproduct/addproduct_view.dart';
import 'package:salesapp/screens/addshop/addshop_binding.dart';
import 'package:salesapp/screens/addshop/addshop_view.dart';
import 'package:salesapp/screens/dashboard/dashboard_binding.dart';
import 'package:salesapp/screens/dashboard/dashboard_view.dart';
import 'package:salesapp/screens/forgot_password/forgot_pass_binding.dart';
import 'package:salesapp/screens/forgot_password/forgot_pass_view.dart';
import 'package:salesapp/screens/login/login_binding.dart';
import 'package:salesapp/screens/login/login_view.dart';
import 'package:salesapp/screens/mailcheck/mail_check_binding.dart';
import 'package:salesapp/screens/mailcheck/mail_check_view.dart';
import 'package:salesapp/screens/marketing/marketing_binding.dart';
import 'package:salesapp/screens/marketing/marketing_view.dart';
import 'package:salesapp/screens/personaldetails/personal_binding.dart';
import 'package:salesapp/screens/personaldetails/personal_view.dart';
import 'package:salesapp/screens/shoplists/shoplist_binding.dart';
import 'package:salesapp/screens/shoplists/shoplist_view.dart';
import 'package:salesapp/screens/splashscreen.dart';

class Routes {
  static const splash = '/';
  static const login = '/login';
  static const forgotPassPage = '/forgotpasspage';
  static const mailCheckPage = '/mailcheckpage';
  static const dashBoardPage = '/dashboardpage';
  static const personalPage = '/personalpage';
  static const addShopPage = '/addshopPage';
  static const shopListPage = '/shoplistPage';
  static const addOrderPage = '/addorderPage';
  static const addProductPage = '/addproductPage';
  static const marketingPage = '/marketingPage';

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
    GetPage(
      binding: PersonalBindings(),
      name: personalPage,
      page: () => const PersonalView(),
    ),
    GetPage(
      binding: AddShopBindings(),
      name: addShopPage,
      page: () => const AddShopView(),
    ),
    GetPage(
      binding: ShopListBindings(),
      name: shopListPage,
      page: () => const ShopListView(),
    ),
    GetPage(
      binding: AddOrderBindings(),
      name: addOrderPage,
      page: () =>  AddOrderView(widgetId: 0,),
    ),
    GetPage(
      binding: AddProductBindings(),
      name: addProductPage,
      page: () => const AddProductView(),
    ),
    GetPage(
      binding: MarketingBindings(),
      name: marketingPage,
      page: () =>  MarketingView(widgetId: 0,),
    ),
  ];
}
