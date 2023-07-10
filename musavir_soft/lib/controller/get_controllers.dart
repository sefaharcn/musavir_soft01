import 'package:get/get.dart';

import '../services/home/model/home_service.dart';
import '../services/login/login_services.dart';
import '../views/home/home_controller.dart';
import '../views/login/login_controller.dart';

Future getControllers() async {
  //Pages
  Get.create(() => LoginController(Get.find()), permanent: false);

  Get.create(() => HomeController(Get.find()), permanent: false);

  //Services

  Get.lazyPut<LoginService>(() => LoginServiceImp());

  Get.lazyPut<HomeService>(() => HomeServiceImp());
}
