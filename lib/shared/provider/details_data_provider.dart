import 'package:flutter/cupertino.dart';
import 'package:tilo/model/details_data_model.dart';
import '../network/request/request_details_data.dart';

class DetailsDataProvider extends ChangeNotifier {
  var _dataRequest = DetailsAPIService();
Product dataItem;

  DetailsDataProvider(String productCode) {
    getData(productCode);
  }

  void getData(String productCode) async {
    dataItem = await _dataRequest.get(productCode);
    notifyListeners();
  }
}
