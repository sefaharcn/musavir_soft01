import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musavir_soft/common/common_values.dart';
import 'package:musavir_soft/controller/bottom_navbar_controller.dart';
import 'package:musavir_soft/src/images.dart';
import 'package:musavir_soft/views/home/home_controller.dart';
import 'package:musavir_soft/views/is_atamalar%C4%B1/is_atamalari.dart';
import 'package:musavir_soft/views/sicil/sicil_bilgileri.dart';
import 'package:musavir_soft/views/ticari_evraklar/ticari_evraklar.dart';
import 'package:musavir_soft/views/yapilacaklar/yapilacaklar.dart';

import '../../src/colors.dart';
import '../../src/string.dart';
import '../login/login_page.dart';

class HomePage extends GetWidget<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  static const String routeName = '/views/home/home_page';

  @override
  Widget build(BuildContext context) {
    controller.error.listen((error) => _errorDialog());
    // Widget _selectedScreen = HomePage();
    final bottomNavigationBarController c =
        Get.put(bottomNavigationBarController());

    return Scaffold(
      appBar: appBarWidget(),
      drawer: buildDrawer(),
      body: homePageTable(),
      bottomNavigationBar: bottomNarbarWidget(c: c),
    );
  }

  AppBar appBarWidget() {
    return AppBar(
      iconTheme: CupertinoIconThemeData(color: Colors.blue),
      actions: [
        IconButton(
            icon: const Icon(Icons.notifications),
            tooltip: 'Bildirimler',
            onPressed: () {})
        // handle the pres},
      ],

      // handle the press

      backgroundColor: white,
      title: Center(
        child: const Image(
          image: AssetImage('assets/images/logo.png'),
          height: 35,
        ),
      ),
    );
  }

/*
  Widget _buildBody() {
    return Obx(
      () => ListView.builder(
        itemBuilder: (_, index) => Padding(
          padding: const EdgeInsets.all(5.0),
          child: _buildCard(
            controller.ornekId.value?[index] ?? "",
            controller.ornek01.value?[index] ?? "",
            controller.ornek02.value?[index].toString() ?? "",
          ),
        ),
        itemCount: controller.ornekId.value?.length ?? 0,
      ),
    );
  }

  Widget _buildCard(
    String title,
    String description,
    String date,
  ) {
    return Card(
      child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: _buildCardColumn(title, description, date)),
    );
  }

  Widget _buildCardColumn(
    String title,
    String description,
    String date,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Divider(),
        _buildSpace(),
        Text(
          description,
        ),
        _buildSpace(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              date,
            ),
          ],
        )
      ],
    );
  }

*/
  Widget _buildSpace() {
    return SizedBox(
      height: 10,
    );
  }

  Widget buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _buildDrawerHeader(),
          _buildTitle('Maliye', () {}),
          Divider(),
          _buildTitle('Vergi Borcu', () {}),
          Divider(),
          _buildTitle('Borcu Yoktur - Mükellef Yazısı', () {}),
          Divider(),
          _buildTitle('Pos Sorgulama', () {}),
          Divider(),
          _buildTitle('İşveren Prim Borcu', () {}),
          Divider(),
          _buildTitle('İşveren Rapor Sorgulama', () {}),
          Divider(),
          _buildTitle('SGK Borcu Yoktur', () {}),
          Divider(),
          _buildTitle('Tahakkuk Hizmet Görüntüleme', () {}),
          Divider(),
          _buildTitle('Oda Borç Görüntüleme', () {}),
          Divider(),
          _buildTitle('Sicil Gazetesi Görüntüleme', () {}),
          Divider(),
          _buildTitle('Gelir Görüntüleme', () {}),
          Divider(),
          _buildTitle('Gidel Görüntüleme', () {}),
          Divider(),
          _buildTitle('Ödemeler', () {}),
          _buildTitle2(logoutText, Icons.logout, _goToLogout),
        ],
      ),
    );
  }

  Widget _buildDrawerHeader() {
    return UserAccountsDrawerHeader(
      accountName: Text('Merhaba'),
      accountEmail: Text('Sefa'),
      decoration: BoxDecoration(color: mainColor),
    );
  }

  Widget _buildTitle(String text, Function function) {
    return ListTile(
      titleAlignment: ListTileTitleAlignment.center,
      title: Text(text),
      trailing: Icon(Icons.arrow_right_rounded),
      onTap: () => function(),
    );
  }

  Widget _buildTitle2(String text, IconData, function) {
    return ListTile(
      titleAlignment: ListTileTitleAlignment.center,
      title: Text(text),
      trailing: Icon(Icons.arrow_right_rounded),
      onTap: () => function(),
    );
  }

/*
  void _goToBack() {
    Get.back();
  }

  void _goToProfile() {
    Get.toNamed(ProfilePage.routeName);
  }

  void _goToInfo() {
    Get.toNamed(InfoPage.routeName);
  }
*/
  void _goToLogout() {
    Get.offNamedUntil(LoginPage.routeName, (route) => false);
  }

/*
  void _goToAddNotePage() {
    Get.toNamed(AddNotesPage.routeName);
  }

  void _goToSearchPage() {
    Get.toNamed(SearchPage.routeName);
  }
*/
  void _errorDialog() {
    Get.snackbar(
      errorTitle,
      errorDescription,
      colorText: white,
      backgroundColor: black,
    );
  }

  Widget homePageTable() {
    return Obx(() => Container(
          color: Color(0xFFF4F1F1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 10),
              _header(),
              SizedBox(height: 10),
              Divider(
                height: 1,
              ),
              Flexible(
                child: ListView.separated(
                  itemBuilder: (_, index) {
                    return Padding(
                        padding: EdgeInsets.only(top: index == 0 ? 10 : 0),
                        child: Row(
                          children: [
                            _element(Text(
                              controller.ornekId.value?[index] ?? "".toString(),
                              textAlign: TextAlign.center,
                            )),
                            _element(Text(
                              controller.ornek01.value?[index] ?? "".toString(),
                              textAlign: TextAlign.center,
                            )),
                            _element(
                              Text(
                                controller.ornek02.value?[index] ??
                                    "".toString(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ));
                  },
                  separatorBuilder: (_, __) => Divider(),
                  itemCount: controller.ornekId.value?.length ?? 0,
                ),
              )
            ],
          ),
        ));
  }

  _header() {
    return Row(
      children: <Widget>[
        _element(Text(
          'ÖRNEK ID',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
        _element(Text(
          'ÖRNEK 01',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
        _element(
          Text(
            'ÖRNEK 02',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Flexible _element(Widget widget, [flex = 1]) {
    return Flexible(
      fit: FlexFit.tight,
      flex: flex,
      child: widget,
    );
  }
}

class bottomNarbarWidget extends StatelessWidget {
  const bottomNarbarWidget({
    super.key,
    required this.c,
  });

  final bottomNavigationBarController c;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 20.0,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: "Sicil Bilgileri"),
            BottomNavigationBarItem(
                icon: Icon(Icons.checklist_rtl_sharp), label: "Yapılacaklar"),
            BottomNavigationBarItem(
                icon: Icon(Icons.access_alarm_outlined), label: "İş Atama"),
            BottomNavigationBarItem(
                icon: Icon(Icons.message), label: "Mesajlaşma"),
            BottomNavigationBarItem(
                icon: Icon(Icons.library_books_outlined),
                label: "Ticari Evraklar"),
          ],
          currentIndex: c.currentBottomIndex.value,
          //onTap: (index) => read.setCurrentIndex(index),
          onTap: (index) {
            c.currentBottomIndex.value = index;
            switch (index) {
              case 0:
                Get.to(sicilView());

                break; // The switch statement must be told to exit, or it will execute every case.
              case 1:
                Get.to(yapilacaklar());
                break;
              case 2:
                Get.to(isAtama());
                break;
              case 3:
                print('two!');
                break;
              case 4:
                Get.to(ticariEvraklar());
                break;

              default:
                print('choose a different number!');
            }
          },

          //iconSize: Get.height / 25,
          /*activeIndex: c.currentBottomIndex.value,
              //buradaki int yada x parametresi active indexsi alır
              onTap: (x) {
                //set state kullandım çünkü widget bulamadım obs sarmalayacak bir yöntem varsa bakalım
                //setState(() {});
                c.currentBottomIndex.value = x;
                //bottomnav bar seelvted inder
                //_selectedScreen = ((x == 0) ? GrapScreen() : HistoryScreen());
               */
        ),
      ),
    );
  }
}


 

///////////////////////////////////////////////





