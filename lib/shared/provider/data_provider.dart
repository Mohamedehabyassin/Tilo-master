import 'package:flutter/cupertino.dart';
import 'package:tilo/model/data_model.dart';
import 'package:tilo/shared/network/request/request_data.dart';

class DataProvider extends ChangeNotifier {
  var _dataRequest = APIService();

  List<Result> menData = [];
  List<Result> womenData = [];
  List<Result> babyData = [];

  DataProvider() {
    getData(0, 0);
    getData(1, 0);
    getData(2, 0);
  }

  void getData(int num, int page) {
    if (num == 0) {
      _dataRequest.get(num, page).then((value) {
        if (value != null) {
          menData = value;
        }
      });
    }
    if (num == 1) {
      _dataRequest.get(num, page).then((value) {
        if (value != null) {
          womenData = value;
        }
      });
    }
    if (num == 2) {
      _dataRequest.get(num, page).then((value) {
        if (value != null) {
          babyData = value;
        }
      });
    }
    notifyListeners();
  }
}
