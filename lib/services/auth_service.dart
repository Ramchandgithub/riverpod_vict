

import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:victous/Utils/local_package_info.dart';

import '../Utils/DeviceData.dart';
import '../Utils/constants.dart';
import '../Utils/logger.dart';
import '../Utils/network_call.dart';
import '../Utils/session_manager.dart';


final authServiceProvider = Provider<AuthService>((ref) => AuthService());

class AuthService {

  Future<Map<String,dynamic>> login({
    required String userId,
    required String password,
    required String type,
    required String ipAddress,
}) async {
    final ranint = Random().nextInt(10000) + 10;
    final sessionId = '${DateTime.now().millisecondsSinceEpoch}$ranint''_M${LocalPackageInfo.getPlatformType()}';

    final params = {
      "username": userId,
      "password": password,
      "Version": int.parse(LocalPackageInfo.getBuildId()),
      "MobileInfo": await DeviceData.getDeviceInfo(),
      "FCMID": '',
      "LoginFrom": await LocalPackageInfo.getPlatformType(),
      "IPAddress": ipAddress,
      "SessionID": sessionId
    };
    final value = await NetworkCall().onCallServer(endPoint: Constants.api_MemberLogin, parameters: params);
    Logger.logger("value:::$value");
    final data = jsonDecode(NetworkCall.getParse(value));
    Logger.logger("data:::$data");

    SessionManager.setBool(Constants.loginState, data['Result']?.toString().toUpperCase() == Constants.success);
    SessionManager.setString(Constants.PREF_Name, data['Username']);
    SessionManager.setString(Constants.PREF_UserId, data['Idno']);
    SessionManager.setString(Constants.PREF_UserType, data['UserType']);
    SessionManager.setString(Constants.PREF_Mobile, data['Mobile']);
    SessionManager.setString(Constants.PREF_Email, data['Email']);
    SessionManager.setInt(Constants.PREF_IsCustomer, data['isCustomer']);
    SessionManager.setInt(Constants.PREF_Mstatus, data['MStatus']);
    SessionManager.setInt(Constants.PREF_Regid, data['Uid']);
    SessionManager.setBool(Constants.prefIsLogin, true);
    SessionManager.setBool(Constants.loginState, data['Result']?.toString().toUpperCase() == Constants.success);
     return {
      "success": data['Result']?.toString().toUpperCase() == Constants.success || data['status']?.toString().toUpperCase() == Constants.success,
      "data": data,
      "sessionId": sessionId,
    };
  }
}






