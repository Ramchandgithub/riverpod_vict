

import 'dart:math';
import 'package:flutter_riverpod/legacy.dart';
import 'package:victous/State/cart_state.dart';
import 'package:victous/model/cart_model.dart';

import '../Utils/constants.dart';
import '../Utils/local_package_info.dart';
import '../Utils/logger.dart';
import '../Utils/network_call.dart';
import '../Utils/session_manager.dart';

final cartProvider = StateNotifierProvider<CartNotifier, CartState>((ref) => CartNotifier());



 // Here CartNotifier is the Brain of the Cart it means it contains only Business Logic no UI Part
 // It is better to use Notifier Provider instead of StateNotifierProvider
// Cart State is immutable class which hold cart information it contains only values

class CartNotifier extends StateNotifier<CartState> {
  CartNotifier() : super(const CartState());

  CartState _buildStateFromApi(List data) {
    final items = data.map<CartModel>((e) => CartModel.fromJson(e)).toList();
    // What is CartModel.fromJson(e)?
    // It converts raw JSON data into a strongly typed Dart object.
    //“Take this JSON map and create a CartModel object from it.”
    // .toList() method converts iterable to List
    // so final result will be in the below manner
    //[
    //   CartModel(id: 101, name: Soap, qty: 2, price: 120),
    //   CartModel(id: 102, name: Shampoo, qty: 1, price: 250),
    // ]
    int count = 0;

    double totalAmount = 0;
    double totalGst = 0;
    double totalTaxable = 0;
    double totalBV = 0;
    int totalQty = 0;
// calculating totalAmount and other necessary parameters
    for (final item in items) {
      count += int.parse(item.qty.toString());
      totalAmount += item.totalMRP ?? 0;
      totalGst += item.totGSTAmt ?? 0;
      totalTaxable += item.totalBasicPrice ?? 0;
      totalBV += item.totBV ?? 0;
      totalQty += item.qty ?? 0;
    }
    Logger.logger("qty:::${count}");
    SessionManager.setInt(Constants.PREF_CartCount, count);

    // copyWith method creates mew cartState Object with initial values.

    return state.copyWith(
      isLoading: false,
      items: items,
      totalAmount: totalAmount,
      totalGst: totalGst,
      totalTaxable: totalTaxable,
      totalBV: totalBV,
      totalQty: totalQty,
    );
  }

  /* ---------------------------------- */
  /* Add Cart Product                   */
  /* ---------------------------------- */

  Future<dynamic> addCartProduct({
    required String pid,
    required String qty,
    required String fromPackage,
  }) async {

    // No need to mention or create bool value for isLoading. Here we are initiating isLoading parameter.
    state = state.copyWith(isLoading: true);

    final ranint = Random().nextInt(10000) + 10;
    String sessionId;
    String uid;

    if (SessionManager.getString(Constants.PREF_CartSessionId).isEmpty && SessionManager.getString(Constants.PREF_CartUUID).isEmpty) {
      sessionId = '${DateTime.now().millisecondsSinceEpoch}${ranint}_M${LocalPackageInfo.getPlatformType()}';
      uid = '${DateTime.now().millisecondsSinceEpoch}$ranint';
    } else {
      sessionId = SessionManager.getString(Constants.PREF_CartSessionId);
      uid = SessionManager.getString(Constants.PREF_CartUUID);
    }

    final params = {
      'action': 'Add',
      'Regid': SessionManager.getInt(Constants.PREF_Regid),
      'SprRegID': SessionManager.getInt(Constants.PREF_Regid),
      'OrderType': '1',
      'pid': int.parse(pid),
      'qty': int.parse(qty),
      'FCode': 'Stores',
      'sessionid': sessionId,
      'UID': uid,
      'purtype': SessionManager.getInt(Constants.PREF_Mstatus),
      'OrderFrom':
      SessionManager.getInt(Constants.PREF_IsCustomer) == 0
          ? 'Member'
          : 'Customer',
      'MOD': 'By Courier',
    };

    final value = await NetworkCall().onCallServer(endPoint: Constants.api_TempRepurchaseItems, parameters: params,);
    final data = NetworkCall.getParse(value) ?? [];

    if (data.isNotEmpty && data[0]['result'].toString().isEmpty) {
      SessionManager.setString(
          Constants.PREF_CartSessionId, sessionId);
      SessionManager.setString(Constants.PREF_CartUUID, uid);

      state = _buildStateFromApi(data);
    } else {
      state = state.copyWith(isLoading: false);
    }
  }

  /* ---------------------------------- */
  /* Update Cart Product (Qty +/-)      */
  /* ---------------------------------- */

  Future<void> updateCartProduct(
      String pid,
      String qty,
      String fromPackage,
      ) async {
    state = state.copyWith(isLoading: true);

    final sessionId = SessionManager.getString(Constants.PREF_CartSessionId);
    final uid = SessionManager.getString(Constants.PREF_CartUUID);

    final params = {
      'action': fromPackage == 'nopackage'
          ? 'Edit'
          : 'EditPackage',
      'Regid': SessionManager.getInt(Constants.PREF_Regid),
      'SprRegID': SessionManager.getInt(Constants.PREF_Regid),
      'OrderType': '1',
      'pid': int.parse(pid),
      'qty': int.parse(qty),
      'FCode': 'Stores',
      'sessionid': sessionId,
      'UID': uid,
      'purtype': SessionManager.getInt(Constants.PREF_Mstatus),
      'OrderFrom':
      SessionManager.getString(Constants.PREF_customer) == '0'
          ? 'Member'
          : 'Customer',
      'MOD': 'By Courier',
    };

    final value = await NetworkCall().onCallServer(
      endPoint: Constants.api_TempRepurchaseItems,
      parameters: params,
    );

    final data = NetworkCall.getParse(value) ?? [];

    if (data.isNotEmpty &&
        data[0]['result'].toString().isEmpty) {
      state = _buildStateFromApi(data);
    } else {
      state = state.copyWith(isLoading: false);
    }
  }

  /* ---------------------------------- */
  /* View Cart Items                    */
  /* ---------------------------------- */

  Future<dynamic> viewCartItems() async {
    state = state.copyWith(isLoading: true);

    final params = {
      'action': 'BindData',
      'Regid': SessionManager.getInt(Constants.PREF_Regid),
      'SprRegID': SessionManager.getInt(Constants.PREF_Regid),
      'OrderType': '1',
      'pid': 0,
      'qty': 0,
      'FCode': 'Stores',
      'sessionid': SessionManager.getString(Constants.PREF_CartSessionId),
      'UID': SessionManager.getString(Constants.PREF_CartUUID),
      'purtype': SessionManager.getInt(Constants.PREF_Mstatus),
      'OrderFrom':
      SessionManager.getString(Constants.PREF_customer) == '0'
          ? 'Member'
          : 'Customer',
      'MOD': 'By Courier',
    };

    final value = await NetworkCall().onCallServer(
      endPoint: Constants.api_TempRepurchaseItems,
      parameters: params,
    );

    final data = NetworkCall.getParse(value) ?? [];

    if (data.isNotEmpty) {
      state = _buildStateFromApi(data);
    } else {
      state = state.copyWith(isLoading: false);
    }
    return data;
  }



  Future<void> deleteCartProduct(
      String pid,
      String qty,
      String fromPackage,
      ) async {
    state = state.copyWith(isLoading: true);

    final sessionId = SessionManager.getString(Constants.PREF_CartSessionId);
    final uid = SessionManager.getString(Constants.PREF_CartUUID);


     final params = {
        'action':fromPackage == "nopackage" ? 'Delete' : "DeletePackage", //Edit/Delete/Reset/BindData',
        'Regid': SessionManager.getInt(Constants.PREF_Regid),
        'SprRegID':SessionManager.getInt(Constants.PREF_Regid),
        'OrderType':"1",
        'pid':int.parse(pid),
        'qty':int.parse(qty),
        'FCode':"Stores",
        'sessionid':sessionId,
        'UID':uid,
        'purtype':(SessionManager.getInt(Constants.PREF_Mstatus)),
        'OrderFrom':SessionManager.getString(Constants.PREF_customer) == '0' ? 'Member': 'Customer',//SessionManager.getString(Constants.PREF_UserType),
        'MOD':"By Courier",
      };


    final value = await NetworkCall().onCallServer(
      endPoint: Constants.api_TempRepurchaseItems,
      parameters: params,
    );

    final data = NetworkCall.getParse(value) ?? [];

    if (data.isNotEmpty &&
        data[0]['result'].toString().isEmpty) {
      state = _buildStateFromApi(data);
    } else {
      state = state.copyWith(isLoading: false);
    }
  }


}



