import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../src/colors.dart';

class yapilacaklar extends StatelessWidget {
  const yapilacaklar({super.key});
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
      body: Center(child: Text('Yapılacaklar')),
    );
  }
}
