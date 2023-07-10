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
        appBar: AppBar(
          title: Text(loginAppBarText),
          backgroundColor: mainColor,
        ),
        body: _buildBody());
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildSpace(),
            _buildImage(),
            _buildMaxSpace(),
            _buildUsernameTextField(),
            _buildSpace(),
            _buildPasswordTextField(),
            _buildMaxSpace(),
            _buildButton(),
            _buildSpace(),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Image.asset(
      logo,
      height: Get.height * .3,
    );
  }

  Widget _buildUsernameTextField() {
    return Material(
      elevation: 10,
      color: white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(300),
          topLeft: Radius.circular(10),
        ),
      ),
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(300),
          bottomRight: Radius.circular(10),
        ),
      ),
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
              print('boşa çıktı');
            }
          },
          child: Text(loginButton),
          style: ElevatedButton.styleFrom(
            primary: mainColor,
          )),
    );
  }

  Widget _buildSpace() {
    return SizedBox(
      height: 20,
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
      backgroundColor: red,
    );
  }

  void _emptyDialog() {
    Get.snackbar(
      errorTitle,
      emptyText,
      colorText: white,
      backgroundColor: red,
    );
  }

  void _errorTextsDialog(String description) {
    Get.snackbar(
      errorTitle,
      description,
      colorText: white,
      backgroundColor: red,
    );
  }
}
