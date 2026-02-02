import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:victous/Widgets/leadingIconWidget.dart';
import 'package:get/get.dart';
import 'package:victous/Widgets/sub_child_item.dart';
import '../Controllers/address_notifier.dart';
import '../Utils/logger.dart';
import '../model/address_model.dart';
import 'address_view.dart';

final selectedAddressProvider = StateProvider<AddressModel?>((ref) => null);


class ShippingAddressView extends ConsumerStatefulWidget {
  const ShippingAddressView({super.key});
  static const String routeName = '/ShippingAddressView';

  @override
  ConsumerState<ShippingAddressView> createState() => _ConsumerShippingAddressViewState();
}

class _ConsumerShippingAddressViewState extends ConsumerState<ShippingAddressView> {
  var args;
  var addressList;
  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(addressProvider);
    return state.when(
        data: (list) => Scaffold(
          appBar: AppBar(
            leading: LeadingIconWidget(),
            title: const  Text("Your Addresses", style: TextStyle(color: Colors.white, fontSize: 16),),),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView.separated(
              itemCount: list.length,
                itemBuilder: (context, index){
                final adress = list[index];
                  return InkWell(
                    onTap: (){
                      ref.read(selectedAddressProvider.notifier).state = adress;
                      Get.toNamed(AddressView.routeName);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10 ),
                        border: Border.all(color: Theme.of(context).primaryColor)
                      ),
                      padding: EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          SubChildItem("Name", '${list[index].name}', true),
                          SubChildItem("Address", '${list[index].residence}', true),
                          SubChildItem("PinCode", '${list[index].pincode}', true),
                          SubChildItem("City", '${list[index].city}', true),
                          SubChildItem("District", '${list[index].districtName}', true),
                          SubChildItem("State", '${list[index].state}', true),
                          SubChildItem("Mobile", '${list[index].mobileNo}', true),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>  const SizedBox(height: 5,)),
          ),
        ),
      error: (Object error, StackTrace stackTrace)=> const Text("Failed"),
      loading: () { return const SizedBox(height: 5,child: SizedBox(height: 20,child: CircularProgressIndicator()),); },
        );
  }
}
