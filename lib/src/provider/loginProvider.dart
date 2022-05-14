import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:noviindus/src/globalVariable/globalVariables.dart';
import 'package:noviindus/src/ui/reUsableWidget/reUsableWidget.dart';

class LoginProvider extends ChangeNotifier {

  TextEditingController _nameCnt= TextEditingController();
  TextEditingController get nameCnt => _nameCnt;


  TextEditingController _pswCnt= TextEditingController();
  TextEditingController get pswCnt => _pswCnt;

  Dio dio = Dio();
  Future<void> onLoginClick(
      {required String userName, required String password,required BuildContext context}) async {
    final data = {"username": userName, "password": password};
    try {
      Response response = await dio.post(
        "${baseUrl}LoginApi",
        data: FormData.fromMap(data),
      );
      if(response.data["status"]==true){
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        apiKey=response.data["url_id"];
        token=response.data["access"];
        Navigator.of(context).pushNamed("/dashBoardScreen");
      }else{
        showSnackCm(context: context,msg: "Invalid username or password");
      }

      print(response.data);
    } on DioError catch (e) {
      print(e);
    }
  }
}
