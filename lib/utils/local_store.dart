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
    App.user = EmployeeDetails(
      userId: LocalStore.getString('userId'),
      apiToken: LocalStore.getString('apiToken'),
      name: LocalStore.getString('name'),
      gender: LocalStore.getString('gender'),
      dob: LocalStore.getString('dob'),
      phone: LocalStore.getString('phone'),
      email: LocalStore.getString('email'),
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
