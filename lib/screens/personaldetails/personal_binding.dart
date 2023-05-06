import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:salesapp/screens/personaldetails/personal_controller.dart';

class PersonalBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PersonalController>(
          () => PersonalController(),
    );
  }
}