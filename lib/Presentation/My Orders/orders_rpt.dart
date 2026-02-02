import 'dart:convert';

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:victous/widgets/leading_icon.dart';

import '../../Model/orders_rpt_model.dart';
import '../../Utils/constants.dart';
import '../../Utils/logger.dart';
import '../../Utils/network_call.dart';
import '../../Widgets/my_date_filter.dart';
import '../../Widgets/sub_child_item.dart';




class OrdersRpt extends ConsumerStatefulWidget {
  static const String routeName = '/OrdersRpt';

  const OrdersRpt({Key? key}) : super(key: key);

  @override
  ConsumerState<OrdersRpt> createState() => _ConsumerOrdersRptState();
}

class _ConsumerOrdersRptState extends ConsumerState<OrdersRpt> {
  List<OrdersRptModel> result=[], originlist = [];
  bool isLoading = false;
  TextEditingController searchCntrl = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }


  _onSearch(String val){
    result.clear();
    originlist.forEach((element) {
     if(
     element.name.toString().toUpperCase().contains(val.toUpperCase()) ||
     element.idno.toString().toUpperCase().contains(val.toUpperCase()) ||
         element.invNo.toString().toUpperCase().contains(val.toUpperCase()) ||
         element.billNo.toString().toUpperCase().contains(val.toUpperCase())||
         element.orderType.toString().toUpperCase().contains(val.toUpperCase())
     ){
       result.add(element);
     }
    });
    setState(() {
      isLoading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    final OrdersRptProvider = ref.watch(OrdersReportProvider);
    Logger.logger("ordersrpt provider:::${OrdersRptProvider.length}");
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text("Orders Report", style: TextStyle(color: Colors.white, fontSize: 16),),
          leading: const LeadingIcon(),
        ),
        body:

        OrdersRptProvider.isEmpty
        ? const Center()
        : Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  width: Get.width,
                  height: 45,
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    controller: searchCntrl,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Theme.of(context).primaryColorDark),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColorDark,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColorDark,
                          )),
                      labelText: 'Search',
                      hintText: 'Search',
                      labelStyle: const TextStyle(color: Colors.black),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                    ),
                    onChanged: (val) {
                      _onSearch(val);
                    },
                  ),
                ),
              ),

              Expanded(
                  child: SingleChildScrollView(
                    child: ListView.builder(
                      // reverse: true,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 0),
                      itemBuilder: (BuildContext context, int i) {

                        return Padding(
                          padding: EdgeInsets.all(5),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Theme.of(context).primaryColor,
                                  width: 1),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: ExpandableNotifier(
                                // controller: expandableController,
                                child:
                                Column(
                                  children: [
                                    Expandable(
                                        collapsed: Column(
                                          children: [
                                            SubChildItem('S.No', '${i + 1}', false),
                                            // SubChildItem('S.No', '${i + 1}', false),
                                            SubChildItem('Associate ID', '${OrdersRptProvider[i].idno}', false),
                                            // SubChildItem('Associate Name', '${result[i].name}', false),
                                            InkWell(
                                                onTap: (){
                                                   // callHtml(i);
                                                  Map<String,dynamic> param = {
                                                    'Info': OrdersRptProvider[i].billNo
                                                  };
                                                  NetworkCall().onCallServer(endPoint: Constants.api_EncryptData, parameters: param, isPlan: false).then((value){
                                                    var data = NetworkCall.getParse(value);
                                                    if(data.length != ''){
                                                      String encodedData = Uri.encodeComponent(data);
                                                      Logger.logger("encoded Data:::${encodedData}");
                                                      Constants.launchurl(Constants.orderno_url + encodedData);
                                                    } else{
                                                      Logger.showWarningAlert("Alert", "Please Try After Some time");
                                                    }

                                                  });
                                                },
                                                child: SubChildItem('Order No', '${OrdersRptProvider[i].billNo}', false,Colors.blue)),
                                          ],
                                        ),
                                        expanded: Column(
                                          children: [
                                            SubChildItem('S.No', '${i + 1}', false),
                                            SubChildItem('Associate ID', '${OrdersRptProvider[i].idno}', false),
                                            // SubChildItem('Associate Name', '${result[i].name}', false),
                                            InkWell(
                                                onTap: (){
                                                  //callHtml(i);
                                                  Map<String,dynamic> param = {
                                                    'Info': OrdersRptProvider[i].billNo
                                                  };
                                                  NetworkCall().onCallServer(endPoint: Constants.api_EncryptData, parameters: param, isPlan: false).then((value){
                                                    var data = NetworkCall.getParse(value);
                                                    if(data.length != ''){
                                                      String encodedData = Uri.encodeComponent(data);
                                                      Constants.launchurl(Constants.orderno_url + encodedData);
                                                      Logger.logger("url :::${Constants.orderno_url+ encodedData}");
                                                      // Constants.launchurl(Constants.orderno_url + data);
                                                    } else{
                                                      Logger.showWarningAlert("Alert", "Please Try After Some time");
                                                    }

                                                  });
                                                },
                                                child: SubChildItem('Order No', '${OrdersRptProvider[i].billNo.toString()}', false,Colors.blue)),

                                            InkWell(
                                                onTap: (){
                                                  Map<String,dynamic> param = {
                                                    'Info':OrdersRptProvider[i].billNo
                                                  };
                                                  NetworkCall().onCallServer(endPoint: Constants.api_EncryptData, parameters: param, isPlan: false).then((value){
                                                    var data = NetworkCall.getParse(value);
                                                    if(data.length != ''){
                                                      Logger.logger("url:::${Constants.invoice_url + data}");
                                                      Constants.launchurl(Constants.invoice_url + data);
                                                    } else{
                                                      Logger.showWarningAlert("Alert", "Please Try After Some time");
                                                    }

                                                  });

                                                },
                                                child: SubChildItem('Invoice No', OrdersRptProvider[i].billNo ?? '', false,Colors.blue)),

                                            SubChildItem('Purchase Type', '${OrdersRptProvider[i].repType}', false),
                                            SubChildItem('Status', '${OrdersRptProvider[i].ordStatus}', false),
                                            SubChildItem('Order Quantity', '${OrdersRptProvider[i].totQty}', false),
                                            SubChildItem('Order Date & Time', OrdersRptProvider[i].orddate ?? '', false),
                                            SubChildItem('Confirm Date & Time',OrdersRptProvider[i].billDate ?? '', false),
                                            SubChildItem('Taxable Amount', '${OrdersRptProvider[i].unitAmt}', false),
                                            SubChildItem('Order Value', '${OrdersRptProvider[i].totAmt}', false),
                                            SubChildItem('Total PV', '${OrdersRptProvider[i].totBV}', false),
                                            Row(
                                              children: [
                                                Container(
                                                  padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 2),
                                                  width: MediaQuery.of(context).size.width / 2.5,
                                                  child: Text(
                                                    "Dispatch Details",
                                                    style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w700),
                                                    textAlign: TextAlign.start,
                                                  ),
                                                ),
                                                Expanded(
                                                  child:  Html(
                                                    data: '${OrdersRptProvider[i].dispDetails.toString()}',
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Builder(
                                          builder: (context){
                                            var controller = ExpandableController.of(
                                                context, required: true
                                            );
                                            return InkWell(
                                              child:
                                              controller!.expanded ?
                                              Image.asset(
                                                '${Constants.ImagePath}up_arrow.png',
                                                height: 35,
                                                width: 35,
                                              )
                                                  :Image.asset(
                                                '${Constants.ImagePath}down2.gif',
                                                height: 35,
                                                width: 35,
                                              ),
                                              onTap: (){
                                                controller.toggle();
                                              },
                                            );
                                          },
                                        )
                                      ],
                                    )

                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: OrdersRptProvider.length,
                    ),
                  )
              ),
            ],
          ),
        )
    );
  }




  callHtml(int i) async {
    Map<String, dynamic> params = {
      'action': 'Order_Receipt',
      'refno': '${result[i].billNo}',
    };
    NetworkCall().onCallServer(endPoint: Constants.api_GSTInvoice, parameters: params).then((value) async {
      var data = jsonDecode(NetworkCall.getParse(value));
      if (data.length > 0) {
        // print("Bill Data::$data");
        // Get.toNamed(Invoice.routeName, arguments: data);
      }
      else {
        Logger.showWarningAlert("Alert", "No Data Found");
      }
    });
 }


}
