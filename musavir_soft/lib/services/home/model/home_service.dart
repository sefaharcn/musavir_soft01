import 'package:http/http.dart' as http;
import 'package:musavir_soft/common/common_values.dart';
import 'package:musavir_soft/services/home/model/home_response_models.dart';

abstract class HomeService {
  //Future getNotesTitle();
  //Future getNotesDescription();
  //Future getNotesDate();

//user notes
  Future getOrnekId();
  Future getOrnek01();
  Future getOrnek02();
}

class HomeServiceImp extends HomeService {
  /*
  @override
  Future getNotesTitle() async {
    const String _baseUrl = 'http://kadriyemacit.com/notebook/get_notes.php';

    var _url = Uri.parse(_baseUrl);

    final response = await http.get(_url);

    var noteListTitle = [];

    if (response.statusCode == 200) {
      var data = homeResponseModelFromJson(response.body);
      for (int i = 0; i < data.length; i++) {
        noteListTitle.add(data[i].title);
      }
      return noteListTitle;
    } else {
      return '';
    }
  }

  @override
  Future getNotesDescription() async {
    const String _baseUrl = 'http://kadriyemacit.com/notebook/get_notes.php';

    var _url = Uri.parse(_baseUrl);

    final response = await http.get(_url);

    var noteListDescription = [];

    if (response.statusCode == 200) {
      var data = homeResponseModelFromJson(response.body);
      for (int i = 0; i < data.length; i++) {
        noteListDescription.add(data[i].description);
      }
      return noteListDescription;
    } else {
      return '';
    }
  }

  @override
  Future getNotesDate() async {
    const String _baseUrl = 'http://kadriyemacit.com/notebook/get_notes.php';

    var _url = Uri.parse(_baseUrl);

    final response = await http.get(_url);

    var noteListDate = [];

    if (response.statusCode == 200) {
      var data = homeResponseModelFromJson(response.body);
      for (int i = 0; i < data.length; i++) {
        noteListDate.add(data[i].date);
      }
      return noteListDate;
    } else {
      return '';
    }
  }
*/
//user notes
  @override
  Future getOrnekId() async {
    const String _baseUrl = 'http://192.168.1.38/musavir/ornektabloveri.php';

    var _url = Uri.parse(_baseUrl);

    final response = await http.post(
      _url,
      body: {"userId": userId.value},
    );

    var ornekIdListe = [];

    if (response.statusCode == 200) {
      var data = homeResponseModelFromJson(response.body);
      for (int i = 0; i < data.length; i++) {
        ornekIdListe.add(data[i].ornekId);
      }
      return ornekIdListe;
    } else {
      return '';
    }
  }

  @override
  Future getOrnek01() async {
    const String _baseUrl = 'http://192.168.1.38/musavir/ornektabloveri.php';

    var _url = Uri.parse(_baseUrl);

    final response = await http.post(
      _url,
      body: {"userId": userId.value},
    );

    var ornek01Liste = [];

    if (response.statusCode == 200) {
      var data = homeResponseModelFromJson(response.body);
      for (int i = 0; i < data.length; i++) {
        ornek01Liste.add(data[i].ornek01);
      }
      return ornek01Liste;
    } else {
      return '';
    }
  }

  @override
  Future getOrnek02() async {
    const String _baseUrl = 'http://192.168.1.38/musavir/ornektabloveri.php';

    var _url = Uri.parse(_baseUrl);

    final response = await http.post(
      _url,
      body: {"userId": userId.value},
    );

    var ornek02Liste = [];

    if (response.statusCode == 200) {
      var data = homeResponseModelFromJson(response.body);
      for (int i = 0; i < data.length; i++) {
        ornek02Liste.add(data[i].ornek02);
      }
      return ornek02Liste;
    } else {
      return '';
    }
  }
}
