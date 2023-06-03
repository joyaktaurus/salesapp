import 'package:get/get.dart';
import 'package:salesapp/screens/addorder/addorder_binding.dart';
import 'package:salesapp/screens/addorder/addorder_view.dart';
import 'package:salesapp/screens/addproduct/addproduct_binding.dart';
import 'package:salesapp/screens/addproduct/addproduct_view.dart';
import 'package:salesapp/screens/addshop/addshop_binding.dart';
import 'package:salesapp/screens/addshop/addshop_view.dart';
import 'package:salesapp/screens/customer_detail/detail_binding.dart';
import 'package:salesapp/screens/customer_detail/detail_view.dart';
import 'package:salesapp/screens/dashboard/dashboard_binding.dart';
import 'package:salesapp/screens/dashboard/dashboard_view.dart';
import 'package:salesapp/screens/forgot_password/forgot_pass_binding.dart';
import 'package:salesapp/screens/forgot_password/forgot_pass_view.dart';
import 'package:salesapp/screens/itemlist/itemlist_binding.dart';
import 'package:salesapp/screens/itemlist/itemlist_view.dart';
import 'package:salesapp/screens/login/login_binding.dart';
import 'package:salesapp/screens/login/login_view.dart';
import 'package:salesapp/screens/mailcheck/mail_check_binding.dart';
import 'package:salesapp/screens/mailcheck/mail_check_view.dart';
import 'package:salesapp/screens/marketing/marketing_binding.dart';
import 'package:salesapp/screens/marketing/marketing_view.dart';
import 'package:salesapp/screens/personaldetails/personal_binding.dart';
import 'package:salesapp/screens/personaldetails/personal_view.dart';
import 'package:salesapp/screens/shoplists/shop_list_view.dart';
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
  static const detailViewPage = '/detailviewPage';
  static const itemListViewPage = '/itemlistviewPage';

  static final routes = [
    GetPage(
      name: splash,
      page: () => SplashScreen(),
    ),
    GetPage(
      binding: LoginViewBindings(),
      name: login,
      page: () =>  LoginView(),
    ),
    GetPage(
      binding: ForgotViewBindings(),
      name: forgotPassPage,
      page: () =>  ForgotPassView(),
    ),
    GetPage(
      binding: MailCheckBindings(),
      name: mailCheckPage,
      page: () =>  MailCheckView(),
    ),
    GetPage(
      binding: DashboardViewBindings(),
      name: dashBoardPage,
      page: () =>  DashBoardView(),
    ),
    GetPage(
      binding: PersonalBindings(),
      name: personalPage,
      page: () =>  PersonalView(),
    ),
    GetPage(
      binding: AddShopBindings(),
      name: addShopPage,
      page: () =>  AddShopView(),
    ),
    GetPage(
      binding: ShopListBindings(),
      name: shopListPage,
      page: () =>  ShopListView(),
    ),
    GetPage(
      binding: AddOrderBindings(),
      name: addOrderPage,
      page: () =>  AddOrderView(widgetId: 2,),
    ),
    GetPage(
      binding: AddProductBindings(),
      name: addProductPage,
      page: () =>  AddProductView(),
    ),
    GetPage(
      binding: MarketingBindings(),
      name: marketingPage,
      page: () =>  MarketingView(widgetId: 1),
    ),
    GetPage(
      binding: DetailViewBindings(),
      name: detailViewPage,
      page: () =>  DetailView(3),
    ),
    GetPage(
      binding: ItemListBindings(),
      name: itemListViewPage,
      page: () =>  ItemListView(),
    ),
  ];
}
