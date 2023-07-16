import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musavir_soft/src/colors.dart';
import 'package:musavir_soft/src/images.dart';
import 'package:musavir_soft/src/string.dart';
import 'package:musavir_soft/views/home/home_page.dart';
import 'package:musavir_soft/views/login/login_controller.dart';

class LoginPage extends GetWidget<LoginController> {
  static const String routeName = '/views/login/login_page';

  @override
  Widget build(BuildContext context) {
    controller.error.listen((error) => _errorDialog);
    controller.isLogin.listen((isLogin) {
      if (isLogin) _goToHomePage();
    });
    controller.errorTexts.listen((errorTexts) {
      if (errorTexts != null) _errorTextsDialog(errorTexts);
    });

    return Scaffold(
        /*appBar: AppBar(
          title: Text(loginAppBarText),
          backgroundColor: mainColor,
        ),*/
        body: _buildBody());
  }

  Widget _buildBody() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildSpace(100),
              _buildImage(),
              _buildMaxSpace(),
              _buildUsernameTextField(),
              _buildSpace(20),
              _buildPasswordTextField(),
              _buildSpace(20),
              _buildSicilTextField(),
              _buildSpace(20),
              _buildButton(),
              _buildSpace(100),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Image.asset(
      logo,
      height: Get.height * .11,
    );
  }

  Widget _buildUsernameTextField() {
    return Material(
      elevation: 10,
      color: white,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(40, 2, 8, 2),
        child: TextField(
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: usernameText,
          ),
          controller: controller.usernameController,
        ),
      ),
    );
  }

  Widget _buildPasswordTextField() {
    return Material(
      elevation: 10,
      color: white,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(40, 2, 8, 2),
        child: TextField(
          obscureText: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: passwordText,
          ),
          controller: controller.passwordControler,
        ),
      ),
    );
  }

  Widget _buildSicilTextField() {
    return Material(
      elevation: 10,
      color: white,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(40, 2, 8, 2),
        child: TextField(
          obscureText: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Sicil Şifresi',
          ),
          controller: controller.passwordControler,
        ),
      ),
    );
  }

  Widget _buildButton() {
    final double size = 40;
    return SizedBox(
      height: size,
      child: ElevatedButton(
          onPressed: () {
            if (controller.usernameController.text.isNotEmpty &&
                controller.passwordControler.text.isNotEmpty) {
              print('butondayım');
              controller.callingLoginService(
                controller.usernameController.text,
                controller.passwordControler.text,
              );
            } else {
              _emptyDialog();
            }
          },
          child: Text(loginButton),
          style: ElevatedButton.styleFrom(backgroundColor: mainColor)),
    );
  }

  Widget _buildSpace(double x) {
    return SizedBox(
      height: x,
    );
  }

  Widget _buildMaxSpace() {
    return SizedBox(
      height: 40,
    );
  }

  void _goToHomePage() {
    Get.offAndToNamed(HomePage.routeName);
  }

  void _errorDialog() {
    Get.snackbar(
      errorTitle,
      errorDescription,
      colorText: white,
      backgroundColor: black,
    );
  }

  void _emptyDialog() {
    Get.snackbar(
      errorTitle,
      emptyText,
      colorText: white,
      backgroundColor: black,
    );
  }

  void _errorTextsDialog(String description) {
    Get.snackbar(
      errorTitle,
      description,
      colorText: white,
      backgroundColor: black,
    );
  }
}
