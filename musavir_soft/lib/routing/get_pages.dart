import 'package:get/get.dart';

import '../views/home/home_page.dart';
import '../views/login/login_page.dart';

List<GetPage> getPages = [
  GetPage(name: LoginPage.routeName, page: () => LoginPage()),
  GetPage(name: HomePage.routeName, page: () => HomePage()),
];
