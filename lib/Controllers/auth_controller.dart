import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:victous/State/auth_state.dart';
import 'package:riverpod/legacy.dart';
import 'package:victous/services/auth_service.dart';
import 'package:victous/main.dart';
import '../Presentation/main_view.dart';
import '../Utils/constants.dart';
import '../Utils/logger.dart';
import '../Utils/session_manager.dart';
import 'package:get/get.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final authService = ref.read(authServiceProvider);
 return AuthNotifier(authService);
});


class AuthNotifier extends StateNotifier<AuthState>{
  final AuthService _authService;


    AuthNotifier(this._authService): super(AuthState.initial()){
      _init();

  }

  Future<void> loadSession() async {
    final loggedIn = await SessionManager.getBool(Constants.loginState);
    Logger.logger("logged in:::${SessionManager.getBool(Constants.loginState)}");
    state = AuthState(isLoggedIn: loggedIn, isLoading: false, userId: '', userName: '', ip: '', error: '');
  }
  

 Future<void>  _init() async {
   await _fetchIpAddress();

  }

    Future<void> _fetchIpAddress() async {
      try{
        String? ipv4;
        String? ipv6;
        for(var interface in await NetworkInterface.list()){
          for(var addr in interface.addresses){
            if(addr.type == InternetAddressType.IPv6 && ipv6 == null){
              ipv6 = addr.address;
            }
            if(addr.type == InternetAddressType.IPv4 && ipv4 == null){
              ipv4 = addr.address;
            }
          }
        }

        final ip = ipv6 ?? ipv4 ?? "Unknown";

        state = state.copyWith(ip: ip);
        await SessionManager.setString(Constants.pref_ipAddress, ip);


      } catch( e){
        state = state.copyWith(error: e.toString());

      }
    }


    Future<void> login(
        String userId,
        String password,
        String type)async {
      state = state.copyWith(isLoading: true);

      try{
        final result = await _authService.login(
            userId: userId,
            password: password,
            type: type,
            ipAddress: state.ip);

        Logger.logger("result::$result");

        if(result['success'] == true){
         state =  state.copyWith(isLoading: false, isLoggedIn: true);
         Logger.logger("login response:::${result['data']}");
         SessionManager.setString(Constants.PREF_Name, result['data']['Username']);
         SessionManager.setString(Constants.PREF_UserId, result['data']['Idno']);
         SessionManager.setString(Constants.PREF_UserType, result['data']['UserType']);
         SessionManager.setString(Constants.PREF_Mobile, result['data']['Mobile']);
         SessionManager.setString(Constants.PREF_Email, result['data']['Email']);
         SessionManager.setInt(Constants.PREF_IsCustomer, result['data']['isCustomer']);
         SessionManager.setInt(Constants.PREF_Regid, result['data']['Uid']);
        } else{
         state =  state.copyWith(isLoading: false, isLoggedIn: false);

        }

      }catch(e){
        state = state.copyWith(isLoading: false, error: e.toString());

      }

    }


    logout(){
      state = state.copyWith(isLoggedIn:  false);
      SessionManager.clearAllPREF();
      SessionManager.setBool(Constants.loginState,false);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.offAllNamed(Main.routeName);
      });

    }


}