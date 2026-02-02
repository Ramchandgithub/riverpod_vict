
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:victous/Controllers/cart_notifier.dart';
import 'package:victous/Widgets/leadingIconWidget.dart';
import 'package:victous/Widgets/sub_child_item.dart';
import 'package:victous/services/repository.dart';

class ModeOfPaymentView extends ConsumerStatefulWidget {
  const ModeOfPaymentView({super.key});
  static const String routeName = '/ModeOfPaymentView';

  @override
  ConsumerState<ModeOfPaymentView> createState() => _ConsumerModeOfPaymentViewState();
}

class _ConsumerModeOfPaymentViewState extends ConsumerState<ModeOfPaymentView> {

  @override
  Widget build(BuildContext context) {
   final cart = ref.watch(cartProvider);
   double totalPayable = cart.totalAmount + cart.totalCourier;
    return Scaffold(
      appBar: AppBar(
        leading: LeadingIconWidget(),
        title: const Text("Mode Of Payment", style: TextStyle(color: Colors.white, fontSize: 16),),
      ),
      body: SingleChildScrollView(
        child:Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Card(
                color: Theme.of(context).primaryColor,
                elevation: 3,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Align(
                        child: const Text("Order Summary", style: TextStyle(color: Colors.white),textAlign: TextAlign.center,),
                      ),

                      CustomOnlineWidget("Total PV", '${cart.totalBV}'),
                      CustomOnlineWidget("Total Amount", '\u{20B9} ${cart.totalAmount}'),
                      CustomOnlineWidget("Shipping Charges(+)", '\u{20B9} ${cart.totalCourier}'),
                      CustomOnlineWidget("Offer Shipping Charges (+)", '\u{20B9}${cart.totalOfferCourier}'),
                      CustomOnlineWidget("Taxable Amount", '\u{20B9} ${cart.totalTaxable}'),
                      CustomOnlineWidget("GST", '\u{20B9} ${cart.totalGst}'),
                      CustomOnlineWidget("Offer GST Amount", '\u{20B9} ${cart.totalOfferGst}'),
                      CustomOnlineWidget("Total Payable", '\u{20B9} ${totalPayable}'),

                      const SizedBox(height: 20,),


                    ],
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
