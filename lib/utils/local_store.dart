import 'package:get_storage/get_storage.dart';
import '../app.dart';
import '../models/login_resp.dart';

abstract class LocalStore {
  static void setData(String key, dynamic value) =>
      GetStorage().write(key, value);

  static int? getInt(String key) => GetStorage().read(key);

  static String? getString(String key) => GetStorage().read(key);

  static bool? getBool(String key) => GetStorage().read(key);

  static double? getDouble(String key) => GetStorage().read(key);

  static dynamic getData(String key) => GetStorage().read(key);

  static void clearData() async => GetStorage().erase();
}

class FetchDataFromLocalStore {
  userData() async {
    App.user = User(
      userid: LocalStore.getInt('user_id'),
      token: LocalStore.getString('token'),
      firstname: LocalStore.getString('user_firstname'),
      lastname: LocalStore.getString('user_lastname'),
      emailVerified: LocalStore.getBool('user_email_verified'),
      twoFactorRequired: LocalStore.getBool('user_two_factor_required'),
      rolename: LocalStore.getString('user_rolename'),
      custid: LocalStore.getInt('user_cust_id'),
      custname: LocalStore.getString('user_cust_name'),
      username: LocalStore.getString('user_name'),
      roleid: LocalStore.getInt('user_role_id'),
      root: LocalStore.getBool('user_root'),
    );
    App.token = LocalStore.getString('token') ?? '';
  }

  // suborgData() async {
  //   List suborgList = LocalStore.getData('sub_orgs')??[];
  //   for (var element in suborgList) {
  //     App.subOrgs.add(Suborg.fromJson(element));
  //   }
  //
  //   App.selectedSuborg = SelectedSuborg(
  //     id: LocalStore.getInt('selected_suborgid')??-1,
  //     name: LocalStore.getString('selected_suborgname')??"All",
  //   );
  // }
}
