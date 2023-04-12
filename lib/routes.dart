import 'package:get/get.dart';
import 'package:salesapp/screens/splashscreen.dart';

class Routes {
  static const splash = '/';
  static const login = '/login';
  static const resetPassPage = '/resetpasspage';
  static const dashBoardPage = '/dashboardpage';
  static const myLeavesPage = '/myleavespage';
  static const leaveRequestPage = '/leaverequestpage';
  static const myShiftPage = '/myshiftpage';
  static const noticeBoardPage = '/noticeboardpage';
  static const editViewPage = '/editviewpage';
  static const editFormViewPage = '/editformviewpage';
  static const profileImageViewPage = '/profileimageviewpage';
  static const myAttendViewPage = '/myattendviewpage';
  static const myInvoiceViewPage = '/myinvoiceviewpage';
  static const myTrialOnePage = '/mytrialonepage';
  static const myTrialTwoPage = '/mytrialtwopage';

  static final routes = [
    GetPage(
      name: splash,
      page: () => SplashScreen(),
    ),
    // GetPage(
    //   binding: LoginViewBindings(),
    //   name: login,
    //   page: () => const LoginView(),
    // ),
    // GetPage(
    //   binding: ResetViewBindings(),
    //   name: resetPassPage,
    //   page: () => const ResetPassView(),
    // ),
  ];
}
