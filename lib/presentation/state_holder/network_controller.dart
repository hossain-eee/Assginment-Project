import 'package:get/get.dart';
import 'package:soft_bd/application/data/model/data_model.dart';
import 'package:soft_bd/application/data/model/network_response.dart';
import 'package:soft_bd/application/data/service/network_caller.dart';
import 'package:soft_bd/application/data/utility/urls.dart';

class NetworkController extends GetxController {
  bool _dataInProgress = false;
  String _message = '';

  DataModel _dataModel = DataModel();
  bool get dataInProgress => _dataInProgress;
  String get message => _message;
  DataModel get dataModel => _dataModel;

  Future<bool> getData() async {
    _dataInProgress = true;
    update();
    NetworkResponse response = await NetworkCaller.getRequest(Urls.getData);
    _dataInProgress = false;
    if (response.isSuccess) {
      _dataModel = DataModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    } else {
      _message = 'data fetch failed';
      update();
      return false;
    }
  }
}
