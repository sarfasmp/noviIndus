import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:noviindus/src/model/apiModels.dart';
import 'package:noviindus/src/publicData/publicData.dart';

class DashBoardProvider extends ChangeNotifier {
  Dio dio = Dio();

  BusListModel? _busListModel;
  BusListModel? get busListModel => _busListModel;

  //Api call for fetching Buslist
  Future<List<BusList>?> fetchBusList(
      {required String token,
      required String key,
      required BuildContext context}) async {
    try {
      Response response = await dio.get(
          "http://flutter.noviindus.co.in/api/BusListApi/$apiKey",
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      if (response.data["status"] == true) {
        _busListModel = BusListModel.fromJson(response.data);
        print(response.data);
      }
      print(response.data);
      return _busListModel?.busList;
    } on DioError catch (e) {
      print(e);
    }
  }

  DriverListModel? _driverListModel;
  DriverListModel? get driverListModel => _driverListModel;

  //Api call for fetching Buslist
  Future<List<DriverList>?> fetchDriverList(
      {required String token,
        required String key,
        required BuildContext context}) async {
    try {
      Response response = await dio.get(
          "http://flutter.noviindus.co.in/api/DriverApi/$apiKey",
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      if (response.data["status"] == true) {
        _driverListModel = DriverListModel.fromJson(response.data);
        print(response.data);
      }
      print(response.data);
      return _driverListModel?.driverList;
    } on DioError catch (e) {
      print(e);
    }
  }
}
