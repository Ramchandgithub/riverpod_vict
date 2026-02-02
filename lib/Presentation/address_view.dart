
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:victous/Presentation/shipping_address_view.dart';
import 'package:victous/Utils/session_manager.dart';
import 'package:victous/Widgets/leadingIconWidget.dart';
import 'package:victous/Widgets/sub_child_item.dart';
import 'package:get/get.dart';
import '../Utils/constants.dart';
import '../Utils/logger.dart';
import 'mode_of_payment_view.dart';

class AddressView extends ConsumerStatefulWidget {
  const AddressView({super.key});
  static const String routeName = '/AddressView';

  @override
  ConsumerState<AddressView> createState() => _ConsumerAddressViewState();
}

class _ConsumerAddressViewState extends ConsumerState<AddressView> {


  @override
  Widget build(BuildContext context) {
    final selectedAddress = ref.watch(selectedAddressProvider);
    Logger.logger("selectedAddress::${selectedAddress!.state}");
    if(selectedAddress == null){
      return const Text("please Select Address");
    }
    return Scaffold(
      appBar: AppBar(
        leading: LeadingIconWidget(),
        title: const Text("Shipping Address", style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
      body:
      SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10 ),
                border: Border.all(color: Theme.of(context).primaryColor)
            ),
            padding: EdgeInsets.all(5.0),
            child: Column(
              children: [
                SubChildItem("Name", '${selectedAddress.name}', true),
                SubChildItem("Address", '${selectedAddress.residence}', true),
                SubChildItem("PinCode", '${selectedAddress.pincode}', true),
                SubChildItem("City", '${selectedAddress.city}', true),
                SubChildItem("District", '${selectedAddress.districtName}', true),
                SubChildItem("State", '${selectedAddress.state}', true),
                SubChildItem("Mobile", '${selectedAddress.mobileNo}', true),

                const SizedBox(height: 30,),
                ElevatedButton(
                    onPressed: () async {
                     await SessionManager.setString(Constants.PREF_Name, selectedAddress.name!);
                     await SessionManager.setString(Constants.PREF_ShipAddress, selectedAddress.residence!);
                     await SessionManager.setString(Constants.PREF_ShipCityName, selectedAddress.city!);
                     await  SessionManager.setInt(Constants.PREF_ShipCityId, selectedAddress.cityID!);
                      // SessionManager.setInt(Constants.PREF_ShipDistrictId, selectedAddress.!);
                     await SessionManager.setString(Constants.PREF_ShipDistrictName, selectedAddress.districtName!);
                     await SessionManager.setString(Constants.PREF_ShipStateName, selectedAddress.state!);
                     await  SessionManager.setInt(Constants.PREF_ShipStateId, selectedAddress.stateID!);
                     Get.toNamed(ModeOfPaymentView.routeName);
                    },
                    child: const  Text("NEXT", style: TextStyle(color: Colors.white),))

              ],
            ),
          ),
        ),
      ),
    );
  }
}
