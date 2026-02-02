

/*Repository should only:
✔ Fetch data
✔ Return data
✔ Throw errors

❌ Repository should NOT:
Show dialogs
Navigate
Know UI*/

import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:victous/main.dart';
import 'package:victous/model/payout_model.dart';
import '../Model/orders_rpt_model.dart';
import '../Presentation/SupportTicket/support_tkt_rpt.dart';
import '../Presentation/main_view.dart';
import '../State/repositry_state.dart';
import '../Utils/constants.dart';
import '../Utils/logger.dart';
import '../Utils/network_call.dart';
import '../Utils/session_manager.dart';
import '../model/address_model.dart';
import '../model/dashboard_model.dart';
import '../model/notification_model.dart';
import '../model/profile_model.dart';
import '../model/referal_model.dart';
import '../model/visualgenealogy_model.dart';
import '../model/wallet_model.dart';

final repoProvider = StateNotifierProvider<RepoNotifier, RepoState>((ref) => RepoNotifier());

class RepoNotifier extends StateNotifier<RepoState>{
    RepoNotifier() :  super(RepoState.initial());

    Future<dynamic> GetHomeData( ) async{

      Map<String, dynamic> param = {
        "action":"MobileAppHome",
        "Condition1":"",
        "Condition2":"",
      };

      final value = await NetworkCall().onCallServer(parameters: param, endPoint: Constants.api_HomePage);
      final data = jsonDecode(NetworkCall.getParse(value));
          Logger.logger("Data::$data");
      return data;


    }


    Future<DashboardModel> getDashboardData() async{

      Map<String, dynamic> params = {};
      SessionManager.getInt(Constants.PREF_IsCustomer) == 0
          ? params = {
        "Action": "Basic_Data",
        "uid": SessionManager.getInt(Constants.PREF_Regid).toString()
      }
          : params = {
        "Action": "Basic_Data_Customer",
        "uid": SessionManager.getInt(Constants.PREF_Regid).toString()
      };
      final value = await NetworkCall().onCallServer(endPoint: Constants.api_DashBoard_Member, parameters: params);
      Logger.logger("value::$value");
      final data1 = NetworkCall.getParse(value);
        final data = jsonDecode(data1);

        Logger.logger("Data::$data");
        return  DashboardModel.fromJson(data);


    }

   Future<List<ProfileModel>> getProfileData(String type) async {
      state= state.copyWith(isLoading: true);
      Map<String, dynamic> params = {
        'regid': SessionManager.getInt(Constants.PREF_Regid)
      };
     final value =  await NetworkCall().onCallServer(endPoint: Constants.api_MemberProfile, parameters: params);
     final data = NetworkCall.getParse(value);
     state = state.copyWith(isLoading: false);
     Logger.logger("data:::$data");
     return   List<ProfileModel>.from(data.map<ProfileModel>((e) => ProfileModel.fromJson(e)));
    }



    Future<dynamic> getCustomerProfile(type) async {
      state = state.copyWith(isLoading: true);
      Map<String, dynamic> param = {
        'CustId': SessionManager.getInt(Constants.PREF_Regid),
      };
      final value = await  NetworkCall().onCallServer(endPoint: Constants.api_CustomerProfile, parameters: param);
      final data = NetworkCall.getParse(value);
      Logger.logger("Data:::$data");
      state = state.copyWith(isLoading: false);
      return data;
    }

    Future<dynamic> PurchaseSelection() async {
      Map<String, dynamic> params = {
        "Action": "PurType",
        "Condition": "",
        "ItemID": SessionManager.getInt(Constants.PREF_Regid) //  Regid"
      };
      final resp = await NetworkCall().onCallServer(
          endPoint: Constants.api_GetDropDown, parameters: params);
      final data = NetworkCall.getParse(resp);
      Logger.logger("data:::$data");
      state = state.copyWith(isLoading: false);
      return data;
    }

    Future<dynamic>  OrderNow() async {
      state = state.copyWith(isLoading: true);
      return callProductsData();

    }

   Future<dynamic>  callProductsData() async {
      Map<String, dynamic> param = {
        "action":"MobileAppHome",
        "Condition1":"",
        "Condition2":"",
      };

      final value = await NetworkCall().onCallServer(parameters: param, endPoint: Constants.api_HomePage);
      final data = jsonDecode(NetworkCall.getParse(value));

      if(data.length > 0){
        List Categories = data['Categories'] ?? [];
        Map<String, dynamic> param = {
          "action":"AllProducts",
          "Condition1":"stores",
          "Condition2":"0",
        };
        final  value =  await NetworkCall().onCallServer(parameters: param, endPoint: Constants.api_HomePage);
        final data1 =  jsonDecode(NetworkCall.getParse(value));
        return data1;

      }else{
        return [];
      }

    }

    Future<List<AddressModel>> getshippingAddress() async {
      Map<String, dynamic> param = {
        "RegID": SessionManager.getInt(Constants.PREF_Regid),
        "UserType": 1,
      };
     final value =  await NetworkCall().onCallServer(parameters: param, endPoint: Constants.api_ShippingAddressesByRegID);
     final data = NetworkCall.getParse(value);
     Logger.logger("Data:::$data");

    return data.map<AddressModel>((e) => AddressModel.fromJson(e)).toList();


    }


    updatePassword(String oldpassowrd,
        String newpassword,) {
      Map<String, dynamic> params = {
        "action": "ChgMemPwd",
        "regid": SessionManager.getInt(Constants.PREF_Regid).toString(),
        'thru': SessionManager.getInt(Constants.PREF_Regid).toString(),
        'oldpwd': oldpassowrd,
        "newpwd": newpassword
      };
      NetworkCall()
          .onCallServer(
          endPoint: Constants.api_DistributorChangePassword,
          parameters: params)
          .then((value) {
        var data = NetworkCall.getParse(value);
        Logger.logger("Data:::${data}");
        if (data.length > 0) {
          if (data[0]['result'].toString().contains('Invalid')) {
            Logger.showWarningAlert("Alert", '${data[0]['result']}');
          } else {
            Get.offAllNamed(Main.routeName);
            Logger.showError("Message", '${data[0]['result']}');
          }
        }
      });
    }


    updateCustomerPassword(String oldpassowrd,
        String newpassword,) {
      Map<String, dynamic> params = {
        "action": "ChgCustPwd",
        "regid": SessionManager.getInt(Constants.PREF_Regid).toString(),
        'thru': SessionManager.getInt(Constants.PREF_Regid).toString(),
        'oldpwd': oldpassowrd,
        "newpwd": newpassword
      };
      NetworkCall()
          .onCallServer(
          endPoint: Constants.api_ChangePassword,
          parameters: params)
          .then((value) {
        var data = NetworkCall.getParse(value);
        Logger.logger("Data:::${data}");
        if (data.length > 0) {
          if (data[0]['result'].toString().contains('Invalid')) {
            Logger.showWarningAlert("Alert", '${data[0]['result']}');
          } else {
            Get.offAllNamed(Main.routeName);
            Logger.showError("Message", '${data[0]['result']}');
          }
        }
      });
    }


   Future<List<ReferralModel>> getMyReferralsRpt() async{
     state = state.copyWith(isLoading: true);
      Map<String, dynamic> param = {
        'regid': SessionManager.getInt(Constants.PREF_Regid).toString()
      };
     final value =  await NetworkCall().onCallServer(endPoint: Constants.api_DirectConsultantsReport, parameters: param);
     final data = NetworkCall.getParse(value);
     state = state.copyWith(isLoading: false);
     return List<ReferralModel>.from(data.map<ReferralModel>((e) => ReferralModel.fromJson(e)).toList());
    }


   Future<List<GenealogyModel>> getGraphicalData(Map<String, dynamic> params) async {
     state = state.copyWith(isLoading: true);
     final value = await  NetworkCall().onCallServer(parameters: params, endPoint: Constants.api_GraphicalViewBinary);
      final data = jsonDecode(NetworkCall.getParse(value));
      state = state.copyWith(isLoading: false);
      return List<GenealogyModel>.from(data.map<GenealogyModel>((e) => GenealogyModel.fromJson(e)));

    }



   Future<List<WalletModel>> getWalletSummary(String action, String t) async {
      String formatter = DateFormat("MM/dd/yyyy").format(DateTime.now());
      Map<String, dynamic> params = {
        "Action": action,
        "fromdate": '01/01/1900',
        "todate": formatter,
        'Id': SessionManager.getInt(Constants.PREF_Regid).toString()
      };
     final value = await NetworkCall().onCallServer(endPoint: Constants.api_EwalletSummaryRpt, parameters: params);
     final data = NetworkCall.getParse(value);
     Logger.logger("Data:::$data");
     return List<WalletModel>.from(data.map<WalletModel>((e) => WalletModel.fromJson(e)).toList());
    }


   Future getCreditRequestReport(from, to, status) async {
      String rtype = "";
      rtype = (from == to) ? "ON" : "FROM";

      Map<String, dynamic> params = {
        "Action": "Member",
        "fromdate": from,
        "todate": to,
        "regid": SessionManager.getInt(Constants.PREF_Regid).toString(),
        "rtype": rtype,
        "status": status
      };
      final value = await NetworkCall().onCallServer(endPoint: Constants.api_CreditRequestReport, parameters: params);
      final data =  NetworkCall.getParse(value);
      //     .then((
      //     value) {
      //   var data = NetworkCall.getParse(value);
      //   Logger.logger("Data:::$data");
      //   if (data.length > 0) {
      //     Get.toNamed(CreditReqReport.routeName, arguments: data);
      //   }
      //   else {
      //     Logger.showWarningAlert("Alert", "No Data Found");
      //   }
      // });
    }


    adjustEwallet(String dwnRegid, String amount, String remarks) {
      Map<String, dynamic> params = {
        "action": "Member",
        "Id": dwnRegid, //Downline Regid
        "typeofinc": "TRANSFERTOEWALLET",
        'Amount': amount,
        "Remarks": remarks,
        "thru": SessionManager.getString(Constants.PREF_UserId),
        "SessId": SessionManager.getString(Constants.PREF_LoginSessionId)
      };
      NetworkCall()
          .onCallServer(endPoint: Constants.api_AdjustEwallet, parameters: params)
          .then((value) {
        var data = NetworkCall.getParse(value);
        Logger.logger("Data:::$data");
        if (data.length > 0) {
          if (data[0]['result'].toString() == '') {
            Logger.showSucessAlert(
                "Message", 'Your Wallet has been Successfully updated');
            Get.offAllNamed(Main.routeName);
          } else {
            Logger.showWarningAlert("Alert", data[0]['result']);
          }
        }
        Logger.logger("Data:::${data}");
      });
    }


    Future<List<OrdersRptModel>> getOrdersRpt(from, to) async {
      state = state.copyWith(isLoading: true);
      Map<String, dynamic> param = {};
      SessionManager.getInt(Constants.PREF_IsCustomer) == 0
          ? param = {
        "rtype": "MEMBER",
        "Idno": SessionManager.getInt(Constants.PREF_Regid).toString(),
        "fromdate": from,
        "todate": to,
        "Reptype": 0,
        "RStatus": 0,
        "StateId": 0
      }
          : param = {
        "rtype": "CUSTOMER",
        "Idno": SessionManager.getInt(Constants.PREF_Regid).toString(),
        "fromdate": from,
        "todate": to,
        "Reptype": 0,
        "RStatus": 0,
        "StateId": SessionManager.getInt(Constants.PREF_CustStateID), //0,
        "PageNumber": 0,
        "RowsCountPerPage": 0,
        "WHid": 0,
        "PV": 0,
        "search": "",
        "IsExport": 0,
      };
      final value = await NetworkCall().onCallServer(endPoint: Constants.api_RepurchaseOrderRpt, parameters: param);
       final data = NetworkCall.getParse(value);
       state = state.copyWith(isLoading: false);
       return List<OrdersRptModel>.from(data.map<OrdersRptModel>((e)=> OrdersRptModel.fromJson(e))).toList();

    }

    Future<List<NotificationModel>> getNotificationRpt() async {
      Map<String, dynamic> param = {
        'Action': "DistributorNotificationReport",
        'NID': 0,
        'CreatedBy': SessionManager.getInt(Constants.PREF_Regid),
        'EnterIdno': "",
        'Title': "",
        'Message': "",
        'Status': 0,
        'IPAdderess': "",
        'Session': "",
        'Updatedby': 0,
        'MID': 0,
      };
      final value = await  NetworkCall().onCallServer(endPoint: Constants.PREF_GetNotification, parameters: param);
      final data = NetworkCall.getParse(value);

      return List<NotificationModel>.from(data.map<NotificationModel>((e) => NotificationModel.fromJson(e))).toList();
      //     .then((value) {
      //   var data = NetworkCall.getParse(value);
      //   Logger.logger("Data:::$data");
      //   if (data.length > 0) {
      //     Get.toNamed(NotificationReport.routeName, arguments: data);
      //   } else {
      //     Logger.showWarningAlert("Alert", "No Data Found");
      //   }
      // });
    }

    Future getSupportTktRpt(from, to) async {
      Map<String, dynamic> params = {};
      SessionManager.getInt(Constants.PREF_IsCustomer) == 0
          ? params = {
        "Action": "ServiceRequest",
        "fromdate": from,
        "todate": to,
        "Id": SessionManager.getString(Constants.PREF_UserId),
        "Gstatus": 0,
        "natureofticket": "0"
      }
          : params = {
        "Action": "CustomerServiceRequest",
        "fromdate": from,
        "todate": to,
        "Id": SessionManager.getString(Constants.PREF_UserId),
        "Gstatus": 0,
        "natureofticket": "0"
      };
    final value =   await NetworkCall().onCallServer(endPoint: Constants.api_SupportTicketReport, parameters: params);
    final data = NetworkCall.getParse(value);
    Logger.logger("data:::$data");
      //     .then((value) {
      //   var data = NetworkCall.getParse(value);
      //   Logger.logger("Data:::$data");
      //   if (data.length > 0) {
      //     Get.toNamed(SupportTktRpt.routeName, arguments: data);
      //   } else {
      //     Logger.showWarningAlert("Alert", "No Records Found");
      //   }
      // });
    }


    Future<List<PayoutModel>> getPayoutReport(action) async {

      Map<String, dynamic> params = {
        "Action": action,
        "payOutNo": action == "VZonePayableReport" ? SessionManager.getInt(Constants.PREF_Regid) : 0,
        "UserID": SessionManager.getString(Constants.PREF_UserId)
      };

      final value = await  NetworkCall().onCallServer(endPoint: Constants.api_tdsreport, parameters: params, isLoad: false);
      final data = NetworkCall.getParse(value);
      if(data == null || data.toString() =='') {
        return [];
      }
      var data1 = jsonDecode(data);
      return List<PayoutModel>.from(data1.map<PayoutModel>((e) => PayoutModel.fromJson(e))); // we are forcing to convert it into List of PayoutModel



      // .then((value) {
      //   var data1 = (NetworkCall.getParse(value));
      //   if (data1 == "" || data1 == null) {
      //     Logger.showWarningAlert("Alert", "No Data Found");
      //   } else {
      //     var data = jsonDecode(data1);
      //     if (data.length > 0) {
      //       if (action == "MemberCommunityBonusReport") {
      //         Get.toNamed(CommunityBonusReportView.routeName, arguments: data);
      //       } else if (action == "MemberBonusReport") {
      //         Get.toNamed(BonusReportView.routeName, arguments: data);
      //       } else if (action == "MemberPayableReport") {
      //         Get.toNamed(PayableReportView.routeName, arguments: data);
      //       } else if (action == "MemberPayoutOnHold") {
      //         Get.toNamed(PayoutOnholdRpt.routeName, arguments: data);
      //       } else if (action == "VZonePayableReport") {
      //         Get.toNamed(TDSReportView.routeName, arguments: data);
      //       }
      //       else {
      //         Logger.showWarningAlert("Alert", "No Data Found");
      //       }
      //     }
      //   }
      // });
    }

}


