import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../services/home/model/home_service.dart';

class HomeController extends GetxController {
  final Rx<bool> isLoading = RxBool(false);
  final Rxn<dynamic> error = Rxn<dynamic>();

  final Rxn<List> ornekId = Rxn();
  final Rxn<List> ornek01 = Rxn();
  final Rxn<List> ornek02 = Rxn();

  final Rxn<List> userNotes = Rxn();

  final HomeService _homeService;

  HomeController(this._homeService);

  @override
  void onInit() {
    // _callingGetNotesTitle();
    // _callingGetNotesDescription();
    // _callingGetNotesDate();

    _ornekIdGetir();
    _ornek01Getir();
    _ornek02Getir();

    super.onInit();
  }

/*
  void _callingGetNotesTitle() {
    isLoading.call(true);

    _homeService.getNotesTitle().then((not) {
      notesTitle.value = not;
    }).catchError((dynamic error) {
      this.error.trigger(error);
      print(error);
    }).whenComplete(() {
      isLoading.call(false);
    });
  }

  void _callingGetNotesDescription() {
    isLoading.call(true);

    _homeService.getNotesDescription().then((not) {
      notesDescription.value = not;
    }).catchError((dynamic error) {
      this.error.trigger(error);
      print(error);
    }).whenComplete(() {
      isLoading.call(false);
    });
  }

  void _callingGetNotesDate() {
    isLoading.call(true);

    _homeService.getNotesDate().then((not) {
      notesDate.value = not;
    }).catchError((dynamic error) {
      this.error.trigger(error);
      print(error);
    }).whenComplete(() {
      isLoading.call(false);
    });
  }
*/
  //user notes
  void _ornekIdGetir() {
    isLoading.call(true);

    _homeService.getOrnekId().then((not) {
      ornekId.value = not;
    }).catchError((dynamic error) {
      this.error.trigger(error);
      print(error);
    }).whenComplete(() {
      isLoading.call(false);
    });
  }

  void _ornek01Getir() {
    isLoading.call(true);

    _homeService.getOrnek01().then((not) {
      ornek01.value = not;
    }).catchError((dynamic error) {
      this.error.trigger(error);
      print(error);
    }).whenComplete(() {
      isLoading.call(false);
    });
  }

  void _ornek02Getir() {
    isLoading.call(true);

    _homeService.getOrnek02().then((not) {
      ornek02.value = not;
    }).catchError((dynamic error) {
      this.error.trigger(error);
      print(error);
    }).whenComplete(() {
      isLoading.call(false);
    });
  }
}
