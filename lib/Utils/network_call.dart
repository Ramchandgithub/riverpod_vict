



import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:lottie/lottie.dart';

import 'constants.dart';
import 'logger.dart';
import 'package:encrypt/encrypt.dart' as enc;


class NetworkCall {
  Future<Map<String, dynamic>> onCallServer({required String endPoint, required Map<String, dynamic> parameters, bool isLoad = true, bool isPlan = true}) async {
    var dio = Dio();
    dio.options.baseUrl = Constants.baseUrl;

    dio.options.headers['content-Type'] = 'application/json';
    //  dio.options.headers["authorization"]="Bearer ${SessionManager.getString(Constants.prefToken)}";
    try {
      Map<String, dynamic> param = {};
      Logger.logger(Constants.baseUrl+endPoint);
      Logger.logger(jsonEncode(parameters));
      if(isLoad) {
        EasyLoading.show(
            dismissOnTap: false,
            maskType: EasyLoadingMaskType.none,
           // indicator:ColorLoader()
           indicator: Container(
              child: Column(
                children: [
                   Lottie.asset('assets/gifs/loader.json', width: 150, height: 100),
                   Text('Loading...',style: TextStyle(color: Constants.hexToColor('#792B90'),fontSize: 8),)
                ],
              )
              // color: Colors.white,
            )

        );
      }
      if(isPlan) {
        param = getEnCreptData(parameters);
        Logger.logger(jsonEncode(param));
      } else {
        param = parameters;
      }
      Response response = await dio.post(endPoint, data: jsonEncode(param));
      Logger.logger("Response::::${response}");
      Map<String, dynamic> returnRes = await onResponseProcess(response: response,endpoint: endPoint,parameters: parameters);
      EasyLoading.dismiss();
      return returnRes;
    } on DioError catch (e) {
      if (e.response != null) {
        EasyLoading.dismiss();
        Map<String, dynamic> param = {};
        if(e.response!.statusCode==401) {
          if(isPlan) {
            param = getEnCreptData(parameters);
            Logger.logger(jsonEncode(param));
          } else {
            param = parameters;
          }
          Map<String, dynamic> returnRes = await onResponseProcess(response: e.response!,endpoint: endPoint,parameters: parameters);
          return returnRes;
        }else {
          Logger.logger(e.response!.data);
          Logger.logger(e.response!.headers);
          Logger.logger(e.response!.requestOptions);
          return {'status':'failed','data': e.response!.statusMessage};
        }
      } else {
        Logger.logger(e.requestOptions);
        Logger.logger(e.message);
        EasyLoading.dismiss();
        return {'status':'failed','data': e.response!.statusMessage};
      }
    }
  }


  Future<Map<String, dynamic>> onCallGetServer({
    required String endPoint,
    required Map<String, dynamic> parameters,
    bool isLoad = true,
    bool isPlan = false,
  }) async {
    var dio = Dio();
    dio.options.baseUrl = Constants.baseUrl;
    dio.options.headers['content-Type'] = 'application/json';
   // dio.options.headers["authorization"]="Bearer ${SessionManager.getString(Constants.prefToken)}";
    Response response = await dio.get(endPoint, queryParameters: parameters);
    Logger.logger(Constants.baseUrl+endPoint);
    Logger.logger(jsonEncode(parameters));
    Logger.logger("Response::::${response}");
    Map<String, dynamic> returnRes = await onResponseProcess(response: response,endpoint: endPoint,parameters: parameters);
    EasyLoading.dismiss();
    return returnRes;
  }




  Future<Map<String, dynamic>> onResponseProcess(
      {required Response response,
        String endpoint = '',
        Map<String, dynamic> parameters = const {}
      }) async {

    if(response.statusCode==200) {
      return {'status':'success','data':response.data};
    } else if(response.statusCode==404)  {
      return {'status':'failed','data': response.statusMessage};
    } else if(response.statusCode==400)  {
      return {'status':'failed','data': response.statusMessage};
    } else if(response.statusCode==500) {
      return {'status': 'failed', 'data': response.statusMessage};
    }
    else if(response.statusCode==401)  {
      return {'status': 'failed', 'data': response.statusMessage};
    }
    else {
      return {'status':'failed','data':response.statusMessage};
    }
  }

  Map<String, dynamic> getEnCreptData(Map<String,dynamic> param) {
    final key1 = enc.Key.fromUtf8("VerhoIesicvixatCoCaAU7frziytavtS");
    final iv = enc.IV.fromUtf8("VGIHVCYPTCODAURS");
    final plainText = jsonEncode(param);
    var encrypter = enc.Encrypter(enc.AES(key1,mode: enc.AESMode.cbc));
    var encrypted = encrypter.encrypt(plainText,iv: iv);
    Map<String,dynamic> enparam = {
      'Info':encrypted.base64,
    };
    return enparam;
  }

  static getParse(Map<String, dynamic> res) {
    if(res['status']=='success') {
      var data = res['data'];
      return data;
    } else {
      Logger.showWarningAlert("Alert",res['data']);
    }
  }

  Future<Map<String, dynamic>> onCallPanChkServer({required String endPoint, required Map<String, dynamic> parameters, bool isLoad = true, bool isPlan = false}) async {
    var dio = Dio();
    dio.options.baseUrl = Constants.baseUrl2;

    dio.options.headers['content-Type'] = 'application/json';
    //  dio.options.headers["authorization"]="Bearer ${SessionManager.getString(Constants.prefToken)}";
    try {
      Map<String, dynamic> param = {};
      Logger.logger(Constants.baseUrl2+endPoint);
      Logger.logger(jsonEncode(parameters));
      if(isLoad) {
       // EasyLoading.show(status: 'Loading');
        EasyLoading.show(
            dismissOnTap: false,
            maskType: EasyLoadingMaskType.none,
            indicator:
            CircleAvatar(
              child: Lottie.asset('assets/gifs/loader.json'),
              // child: Image.asset(
              //   '${Constants.gif}loader.gif',
              //   // '${Constants.gif}lottie_loader.gif',
              //   width: 90,
              //   height: 90,
              // ),

            )
          //status: 'loading...',dismissOnTap: false
        );
      }
      if(isPlan) {
        param = getEnCreptData(parameters);
        Logger.logger(jsonEncode(param));
      } else {
        param = parameters;

      }
      Response response = await dio.post(endPoint, data: jsonEncode(param));
      Logger.logger("Response::::${response}");
      Map<String, dynamic> returnRes = await onResponseProcess(response: response,endpoint: endPoint,parameters: parameters);
      EasyLoading.dismiss();
      return returnRes;
    } on DioError catch (e) {
      if (e.response != null) {
        EasyLoading.dismiss();
        Map<String, dynamic> param = {};
        if(e.response!.statusCode==401) {
          if(isPlan) {
            param = getEnCreptData(parameters);
            Logger.logger(jsonEncode(param));
          } else {
            param = parameters;
          }
          Map<String, dynamic> returnRes = await onResponseProcess(response: e.response!,endpoint: endPoint,parameters: parameters);
          return returnRes;
        }else {
          Logger.logger(e.response!.data);
          Logger.logger(e.response!.headers);
          Logger.logger(e.response!.requestOptions);
          return {'status':'failed','data': e.response!.statusMessage};
        }
      } else {
        Logger.logger(e.requestOptions);
        Logger.logger(e.message);
        EasyLoading.dismiss();
        return {'status':'failed','data': e.response!.statusMessage};
      }
    }
  }


}





