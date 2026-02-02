import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:victous/Controllers/address_notifier.dart';
import 'package:victous/Controllers/cart_notifier.dart';
import 'package:victous/Presentation/shipping_address_view.dart';
import 'package:victous/Widgets/leadingIconWidget.dart';
import 'package:victous/Widgets/sub_child_item.dart';
import 'package:victous/services/repository.dart';

import '../Utils/constants.dart';
import '../Utils/logger.dart';
import '../Widgets/cart_item_tile_widget.dart';
import '../model/cart_model.dart';

class CartView extends ConsumerStatefulWidget {
  const CartView({
    super.key,
  });

  static const String routeName = '/CartView';

  @override
  ConsumerState<CartView> createState() => _ConsumerCartViewState();
}

class _ConsumerCartViewState extends ConsumerState<CartView> {
  var args;
  List<CartModel> CartList = [];

  @override
  void initState() {
    super.initState();
    args = Get.arguments;
    CartList.addAll(args.map<CartModel>((e) => CartModel.fromJson(e)));
    Logger.logger("args:::$args");
    Logger.logger("cartlist:::$CartList");
  }

  @override
  Widget build(BuildContext context) {
    final cart = ref.watch(cartProvider);
    final repo = ref.watch(repoProvider);

    return Scaffold(
      appBar: AppBar(
        leading: LeadingIconWidget(),
        title: const Text(
          'Cart ',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
      body: cart.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : cart.items.isEmpty || cart.items[0].qty == 0
              ? const Center(
                  child: Text("No Products in Your Cart, Please Add "),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: cart.items.length, // CartList.length,
                            itemBuilder: (BuildContext context, int index) {
                              final item = cart.items[index];
                              print('item:::${item}');

                              return Stack(
                                children: [
                                  SizedBox(
                                    height:
                                        MediaQuery.sizeOf(context).height /10,
                                    width: MediaQuery.sizeOf(context).width,
                                    child: Card(
                                      elevation: 3,
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              CachedNetworkImage(
                                                imageUrl:
                                                    '${Constants.ProductImg_URL}${CartList[index].prdImage}',
                                                 width: Get.width / 7,

                                              ),
                                              // const SizedBox(width: 5,),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text('${cart.items[index].pName}',
                                                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                                                  ),
                                                  Text(
                                                      'DP : ${cart.items[index].dp}',
                                                      style: TextStyle(
                                                          fontSize: 10)),
                                                  Text(
                                                      'Total PV : ${cart.items[index].totBV!.toInt()}',
                                                      style: TextStyle(
                                                          fontSize: 10)),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                ],
                                              ),
                                              CartItemTile(
                                                key: ValueKey(item.pid),
                                                pid: item.pid.toString(),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }),
                        const SizedBox(height: 20,),

                        SubChildItem("Total Amount", '\u{20B9} ${cart.totalAmount}', true),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                           ButtonWidget("Continue to Shop", ref),
                           ButtonWidget("Check Out", ref),
                          ],
                        )



                      ],
                    ),
                  ),
                ),
    );
  }
}


Widget ButtonWidget(String title, WidgetRef ref) {

  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      side: BorderSide(color: Colors.red, width: 2, strokeAlign: BorderSide.strokeAlignCenter)
    ),
      onPressed: () async {
        if(title == "Continue to Shop"){
          Get.back();
        } else{
           ref.read(addressProvider.notifier).load();
           Get.toNamed(ShippingAddressView.routeName,);

        }
      },
      child: Text(title, style: TextStyle(color: Colors.black),));
}
