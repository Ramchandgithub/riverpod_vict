




import 'package:expandable/expandable.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import '../../Utils/constants.dart';
import '../../Widgets/leading_icon.dart';
import '../../Widgets/sub_child_item.dart';
import '../../model/orders_rpt_model.dart';

class ArchievedReportView extends ConsumerStatefulWidget {
  static const String routeName = '/ArchievedReportView';

  const ArchievedReportView({Key? key}) : super(key: key);

  @override
  ConsumerState<ArchievedReportView> createState() => _ConsumerArchievedReportState();
}

class _ConsumerArchievedReportState extends ConsumerState<ArchievedReportView> {
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
      element.invNo.toString().toUpperCase().contains(val.toUpperCase()) ||
          element.billDate.toString().toUpperCase().contains(val.toUpperCase()) ||
          element.totAmt.toString().toUpperCase().contains(val.toUpperCase()) ||
          element.totBV.toString().toUpperCase().contains(val.toUpperCase())||
          element.totQty.toString().toUpperCase().contains(val.toUpperCase()) ||
          element.orddate.toString().toUpperCase().contains(val.toUpperCase()) ||
          element.mop.toString().toUpperCase().contains(val.toUpperCase()
          )
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
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text("Archived Report"),
          leading: const LeadingIcon(),
        ),
        body:  Container(
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
                                            InkWell(
                                                onTap: (){
                                                  //callHtml(i);

                                                },
                                                child: SubChildItem('Order No', '${result[i].billNo}', false)),
                                          ],
                                        ),
                                        expanded: Column(
                                          children: [
                                            SubChildItem('S.No', '${i + 1}', false),
                                            InkWell(
                                                onTap: (){
                                                  //callHtml(i);
                                                },
                                                child: SubChildItem('Order no', '${result[i].billNo.toString()}', false)),

                                            InkWell(
                                                onTap: (){
                                                  //  callHtml1(i);

                                                },
                                                child: SubChildItem('Invoice No ', result[i].invNo ?? '', false)),

                                            //  SubChildItem('orddate', '${result[i].totQty}', false),
                                            SubChildItem('Invoice Date', '${result[i].billDate}', false),
                                            SubChildItem('Total Amount', '${result[i].totAmt}', false),
                                            SubChildItem('Total BV', '${result[i].totBV}', false),
                                            SubChildItem('Order Qty','${result[i].totQty}', false),
                                            SubChildItem('Order Date & Time', '${result[i].orddate}', false),
                                            SubChildItem('Mode Of Pay', '${result[i].mop}', false),
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
                      itemCount: result.length,
                    ),
                  )
              ),
            ],
          ),
        )
    );
  }




  // callHtml(int i) async {
  //   Map<String, dynamic> params = {
  //     'action': 'Order_Receipt',
  //     'refno': '${result[i].billNo}',
  //   };
  //   NetworkCall().onCallServer(endPoint: Constants.api_GSTInvoice, parameters: params).then((value) async {
  //     var data = jsonDecode(NetworkCall.getParse(value));
  //     if (data.length > 0) {
  //       // print("Bill Data::$data");
  //       Get.toNamed(Invoice.routeName, arguments: data);
  //     }
  //     else {
  //       Logger.showWarningAlert("Alert", "No Data Found");
  //     }
  //   });
  // }

}
