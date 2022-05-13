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
        print("fetch bus list");
      }

      return _busListModel?.busList;
    } on DioError catch (e) {
      print(e);
    }
  }

  DriverListModel? _driverListModel;
  DriverListModel? get driverListModel => _driverListModel;

  //Api call for fetching Driverlist
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
        print("fetch driver list");
      }
      return _driverListModel?.driverList;
    } on DioError catch (e) {
      print(e);
    }
  }

  Future<void> deleteDriver({
    required String deleteId,
      required BuildContext context}) async {
    final data={
      "driver_id":deleteId,
    };
    try {

      Response response = await dio.delete(
          "http://flutter.noviindus.co.in/api/DriverApi/$apiKey",
          data: FormData.fromMap(data),
          options: Options(
              headers: {'Authorization': 'Bearer $token'}));
      if (response.data["status"] == true) {
        _driverListModel = DriverListModel.fromJson(response.data);
        print("deleted");
      }

    } on DioError catch (e) {
      print(e);
    }
  }

  TextEditingController nameCnt=TextEditingController();
  TextEditingController licenCnt=TextEditingController();

  //adding driver
  Future<void> addDriver(
      {required String name,
      required String licenceNumber,
      required BuildContext context}) async {
    final data = {
      "name": name,
      "license_no": licenceNumber,
    };
    try {
      Response response = await dio.post(
        "http://flutter.noviindus.co.in/api/DriverApi/$apiKey/",
        data: FormData.fromMap(data),
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      if (response.data["status"] == true) {
        print("added");
      }
    } on DioError catch (e) {
      print(e);
    }
  }
}
