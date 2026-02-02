import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:victous/widgets/leading_icon.dart';

import '../../Utils/constants.dart';
import '../../Utils/logger.dart';

import '../../Utils/network_call.dart';
import '../../Utils/session_manager.dart';

import '../../Widgets/sub_child_item.dart';
import '../../services/repository.dart';

class PayableReportView extends StatefulWidget {
  const PayableReportView({Key? key}) : super(key: key);
  static const String routeName = '/PayableReportView';

  @override
  State<PayableReportView> createState() => _PayableReportView();
}

class _PayableReportView extends State<PayableReportView> {
  bool isLoading = false,isMoreData=true;
  int listCount=20;
  List result = [],orginalresult=[];
  TextEditingController searchCntrl = TextEditingController();
  double netAmnt = 0.0, grossAmnt = 0.0,tdsAmnt = 0.0;


  @override
  void initState(){
    super.initState();
    isLoading = true;
    Future.delayed(Duration.zero).then((value){
      var args = Get.arguments;

      result=args;
      for(int i = 0; i< result.length; i++){
        netAmnt = netAmnt + double.parse(result[i]['NetAmount'].toString());
        grossAmnt = grossAmnt + double.parse(result[i]['GrossAmount'].toString());
        tdsAmnt = tdsAmnt + double.parse(result[i]['TDS'].toString());
      }
      Logger.logger("netAmnt::${netAmnt}");
      Logger.logger("gros::${grossAmnt}");
      Logger.logger("tds::${tdsAmnt}");
      setState(() {
        orginalresult.addAll(result);
        isLoading = false;
      });
    });
  }

  _onSearch(String val){
    result.clear();
    orginalresult.forEach((element){
      if(
      element["MemberId"].toString().toUpperCase().contains(val.toUpperCase())
          || element["PayNo"].toString().toUpperCase().contains(val.toUpperCase())
          || element["Period"].toString().toUpperCase().contains(val.toUpperCase())
          || element["Name"].toString().toUpperCase().contains(val.toUpperCase())
          || element["TotalBonus"].toString().toUpperCase().contains(val.toUpperCase())
          || element["BroughtForward"].toString().toUpperCase().contains(val.toUpperCase())
          || element["GrossAmount"].toString().toUpperCase().contains(val.toUpperCase())
          || element["TDS"].toString().toUpperCase().contains(val.toUpperCase())
          || element["NetAmount"].toString().toUpperCase().contains(val.toUpperCase())
          || element["PAN"].toString().toUpperCase().contains(val.toUpperCase())
          || element["AccountNo"].toString().toUpperCase().contains(val.toUpperCase())
          || element["Bank"].toString().toUpperCase().contains(val.toUpperCase())
          || element["IFSC"].toString().toUpperCase().contains(val.toUpperCase())
          || element["AdvDed"].toString().toUpperCase().contains(val.toUpperCase())
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
          leading: LeadingIcon(),
          title: Text("Payable Report"),

        ),
        body: Container(
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
                            color: Theme
                                .of(context)
                                .primaryColorDark),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Theme
                              .of(context)
                              .primaryColorDark,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Theme
                                .of(context)
                                .primaryColorDark,
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
              const SizedBox(height: 10,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Table(
                  border: TableBorder.all(color: Colors.white),
                  columnWidths: const{
                    0: FlexColumnWidth(3),
                    1: FlexColumnWidth(3)
                  },
                  children: [
                    TableRow(
                      decoration: BoxDecoration(color: Theme.of(context).primaryColor),
                      children: [
                        Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text('Total Gross Amount', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                        ),
                        Padding(padding: EdgeInsets.all(5.0),
                          child: Text('${grossAmnt.toStringAsFixed(2)}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),

                        )
                      ]
                    ),
                    TableRow(
                      decoration: BoxDecoration(color: Theme.of(context).primaryColor),
                      children: [
                        Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text('Total TDS',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                        ),
                        Padding(padding: EdgeInsets.all(5.0),
                          child: Text('${tdsAmnt.toStringAsFixed(2)}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),

                        )
                      ]
                    ),
                    TableRow(
                      decoration: BoxDecoration(color: Theme.of(context).primaryColor),
                      children: [
                        Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text('Total Net Amount', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        ),
                        Padding(padding: EdgeInsets.all(5.0),
                          child: Text('${netAmnt.toStringAsFixed(2)}',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),

                        )
                      ]
                    ),
                  ],
                ),
              ),

              Expanded(
                  child: SingleChildScrollView(
                    child: ListView.builder(
                      // reverse: true,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 5, bottom: 0),
                      itemBuilder: (BuildContext context, int i) {
                        // int reqStatus = result[i]["reqstatus"] ;
                        return Padding(
                          padding: EdgeInsets.all(5),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Theme
                                      .of(context)
                                      .primaryColor,
                                  width: 1),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: ExpandableNotifier(
                                // controller: expandableController,
                                child:
                                Column(
                                  children: [
                                    SubChildItem('S.No', '${i + 1}', false),
                                    SubChildItem('Period', result[i]["Period"].toString(), false),
                                    InkWell(
                                      onTap: (){
                                        Map<String,dynamic> param = {
                                          'Info':'${result[i]['PayNo']}' + '\$\$'+'${result[i]['MemberId']}'
                                        };
                                        NetworkCall().onCallServer(endPoint: Constants.api_EncryptData, parameters: param, isPlan: false).then((value) async {
                                          var data = NetworkCall.getParse(value);
                                          Logger.logger("data:::${data}");
                                          if(data.toString() != ''){

                                            Constants.launchurl('${Constants.payoutAsscUrl}$data');
                                            Logger.logger("url:::${Constants.payoutAsscUrl}$data");
                                          } else{
                                            Logger.showWarningAlert("Alert", 'Please Try After Sometime');
                                          }
                                        });

                                      },
                                        child: SubChildItem('Associate ID', result[i]["MemberId"].toString(), false,Colors.blue)),
                                    SubChildItem('Name', result[i]["Name"].toString(), false),
                                    SubChildItem('CB', result[i]["CB"].toString(), false),
                                    SubChildItem('FTB', result[i]["FTB"].toString(), false),
                                    SubChildItem('LB', result[i]["LB"].toString(), false),
                                    SubChildItem('SRB', result[i]["SRB"].toString(), false),
                                    SubChildItem('Quick Retailer', result[i]["QR"].toString(), false),
                                    SubChildItem('VZone Upgrade Bonus', result[i]["VZB"].toString(), false),
                                    SubChildItem('Self PV', result[i]["CurrSelfPV"].toString(), false),
                                    InkWell(
                                      onTap: (){
                                        Map<String,dynamic>args={
                                        "Action" :"MemberCommunityBonusReport",
                                        "payOutNo" :result[i]["PayNo"],
                                        "UserID" : SessionManager.getString(Constants.PREF_UserId),
                                        "search" : "",
                                        "PageNumber" :0,
                                        "RowsCountPerPage" :0,
                                        };
                                        //Repository().gettotalbonusclick(args);
                                      },
                                        child: SubChildItem('TotalBonus', result[i]["TotalBonus"].toString(), false,Colors.blue)),
                                    SubChildItem('Brought Forward', result[i]["BroughtForward"].toString(), false),
                                    SubChildItem('Gross Amount', result[i]["GrossAmount"].toString(), false),
                                    SubChildItem('TDS', result[i]["TDS"].toString(), false),
                                    SubChildItem('Other Deduction', result[i]["AdvDed"].toString(), false),
                                    SubChildItem('Net Amount', result[i]["NetAmount"].toString(), false),
                                    SubChildItem('PAN', result[i]["PAN"].toString(), false),
                                    SubChildItem('Account No', result[i]["AccountNo"].toString(), false),
                                    SubChildItem('Bank', result[i]["Bank"].toString(), false),
                                    SubChildItem('IFSC', result[i]["IFSC"] ?? '', false),

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


}
