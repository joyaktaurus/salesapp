// import 'models/user_model.dart';
//
// abstract class App {
//   static const String appTitle = "Lakeshore";
//   static const String appVersionName = "1.0.0";
//   static String token = '';
//   static UserModel customer = Customer() as UserModel;
//   //static List<Suborg> subOrgs = [];//Suborg(id: -1,name: "All")
//   static String appCurrency = '\u0024';
// //  static List<ResourcePrivilege> resourcePrivilege = [];
//   static bool isAdmin = customer.token == "ADMIN"?true:false;
// }

import 'package:salesapp/services/privileges_resp.dart';

import 'models/login_resp.dart';

abstract class App{
  static const String appTitle = "Workhorse ERP";
  static const String appVersionName = "1.0.2";
  static String token = '';
  static String appCurrency = '\u0024';
  static EmployeeDetails user = EmployeeDetails();
//  static bool isAdmin = user.rolename == "ADMIN"?true:false;
  static List<Suborg> subOrgs = [];//Suborg(id: -1,name: "All")
  static List<ResourcePrivilege> resourcePrivilege = [];
  static List<GridView> gridView = [];
  static List<SelectedSuborg> suborgDropdown = [SelectedSuborg(id: -1,name: "All")];
  static SelectedSuborg selectedSuborg = SelectedSuborg(id: -1,name: "All");


}