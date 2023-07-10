import 'package:http/http.dart' as http;
import 'package:musavir_soft/services/login/model/login_request_model.dart';

import 'model/login_response_model.dart';

abstract class LoginService {
  Future login(LoginRequestModel registerRequestModel);
}

class LoginServiceImp extends LoginService {
  @override
  Future login(LoginRequestModel loginRequestModel) async {
    const String _baseUrl = 'http://sefaharcn.website/musavir/login.php';

    var _url = Uri.parse(_baseUrl);

    final response = await http.post(_url, body: loginRequestModel.toJson());
    print('login servisteyim');
    if (response.statusCode == 200) {
      print('bağlantı sağlandı');
      return loginResponseModelFromJson(response.body);
    } else {
      print('bağlanamıyorum');
      return '';
    }
  }
}
