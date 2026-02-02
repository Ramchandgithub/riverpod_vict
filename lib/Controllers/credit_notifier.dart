


import 'package:flutter_riverpod/legacy.dart';
import 'package:victous/State/credit_request_state.dart';

import '../Utils/constants.dart';
import '../Utils/logger.dart';
import '../Utils/network_call.dart';
import '../Utils/session_manager.dart';
import '../Utils/statemodel.dart';


final creditRequestProvider = StateNotifierProvider<CreditNotifier, CreditRequestState>(
        (ref) => CreditNotifier());

class CreditNotifier extends StateNotifier<CreditRequestState> {
  CreditNotifier() : super( CreditRequestState()) {
    load(); // ← AUTO LOAD
  }

  void load() {
    state = state.copyWith(modes:  [
      StateModel(Value: '0', Text: 'Select Payment'),
      StateModel(Value: '1', Text: 'Bank Transfer'),
      StateModel(Value: '2', Text: 'UPI/QR Code'),
    ]);
    fetchWallet();
  }

  Future<void> fetchWallet() async {
    Map<String, dynamic> param = {
      'action': 'Member',
      'idnnumber': "${SessionManager.getInt(Constants.PREF_Regid)}",
      'spnsridno': "",
    };

    final value = await NetworkCall().onCallServer(parameters: param, endPoint: Constants.api_EwalletBalance);

    final List data = NetworkCall.getParse(value);
    final bal = double.parse(data.first['balance'].toString());

    state = state.copyWith(balanceAmnt: bal);
  }

  void setPaymentMode(int index) {
    state = state.copyWith(modeOfPymntIndex: index);
    if (state.modes[index].Text == "Bank Transfer") fetchBanks();
  }

  Future<void> fetchBanks() async {
    Map<String, dynamic> params = {
      "Action": "CompanyBanks",
      "Condition": "",
      'ItemID': 0,
    };

    final value = await NetworkCall()
        .onCallServer(parameters: params, endPoint: Constants.api_CompanyBanks);

    final data = NetworkCall.getParse(value) as List;

    state = state.copyWith(
        banks:
        data.map<StateModel>((e) => StateModel.cityJson(e)).toList());
  }

  void pickImage(String base64) =>
      state = state.copyWith(isImagePicked: true, base64Img: base64);

  void setDate(String d) => state = state.copyWith(transactionDate: d);
}
