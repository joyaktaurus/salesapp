import 'package:salesapp/services/privileges_resp.dart';

import 'models/login_resp.dart';
import 'models/shop_list.dart';

abstract class App {
  static const String appTitle = "Workhorse ERP";
  static const String appVersionName = "1.0.2";
  static String token = '';
  static String appCurrency = '\u0024';
  static EmployeeDetails user = EmployeeDetails();
  static List<Shop> shopdetatils = [];
  static List<ResourcePrivilege> resourcePrivilege = [];
  static List<GridView> gridView = [];
  static List<SelectedSuborg> suborgDropdown = [
    SelectedSuborg(id: -1, name: "All")
  ];
  static SelectedSuborg selectedSuborg = SelectedSuborg(id: -1, name: "All");
}
