import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../src/colors.dart';

class ticariEvraklar extends StatelessWidget {
  const ticariEvraklar({super.key});
  static const String routeName = '/views/sicil/sicil_bilgileri';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: ticariEvrak(),
    );
  }

  Widget ticariEvrak() {
    return Container(
      color: Color(0xFFF4F1F1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            height: 50,
            alignment: Alignment.center,
            child: Text(
              'Ticari Evraklar',
              style: TextStyle(fontSize: 30),
            ),
          ),
          Divider(),
          SizedBox(height: 10),
          _header(),
          SizedBox(height: 10),
          Divider(
            height: 1,
          ),
          FlexMethod('Oda Kayıt Belgesi'),
          FlexMethod('İmza Sirküleri'),
          FlexMethod('Kapasite Raporu -1'),
          FlexMethod('Sanayi Sicil Belgesi'),
          FlexMethod('Yatırım Teşvik Belgesi'),
          FlexMethod('KDV İstisna Belgesi Belgesi'),
        ],
      ),
    );
  }

  Flexible FlexMethod(
    String name,
  ) {
    return Flexible(
        child: Padding(
            padding: EdgeInsets.only(),
            child: Row(
              children: [
                _element(Text(
                  name,
                  textAlign: TextAlign.center,
                )),
                _element(
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: mainColor),
                    onPressed: null,
                    child: Text('İndir'),
                  ),
                ),
                _element(
                  Text(
                    'Sistemte Yok',
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            )));
  }

  _header() {
    return Row(
      children: <Widget>[
        _element(Text(
          'AÇIKLAMA',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
        _element(Text(
          'EKLE',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
        _element(
          Text(
            'DURUM',
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
