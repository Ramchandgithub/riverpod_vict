
import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
//import 'package:purobien/Widgets/leading_icon.dart';

import '../../Utils/constants.dart';
import '../../Widgets/sub_child_item.dart';
import '../../widgets/leading_icon.dart';

class CreditReqReport extends ConsumerStatefulWidget {
  const CreditReqReport({Key? key}) : super(key: key);
  static const String routeName = '/CreditReqReport';

  @override
  ConsumerState<CreditReqReport> createState() => _ConsumerCreditReqReportState();
}

class _ConsumerCreditReqReportState extends ConsumerState<CreditReqReport> {

  TextEditingController searchCntrl = TextEditingController();



  @override
  void initState(){
    super.initState();

  }

  // _onSearch(String val){
  //   result.clear();
  //   orginalresult.forEach((element){
  //     if(
  //      element["reqCode"].toString().toUpperCase().contains(val.toUpperCase())
  //         || element["reqdate"].toString().toUpperCase().contains(val.toUpperCase())
  //         || element["depdet"].toString().toUpperCase().contains(val.toUpperCase())
  //         || element["mopDet"].toString().toUpperCase().contains(val.toUpperCase())
  //         || element["mop"].toString().toUpperCase().contains(val.toUpperCase())
  //         || element["Bank"].toString().toUpperCase().contains(val.toUpperCase())
  //         || element["reqAmt"].toString().toUpperCase().contains(val.toUpperCase())
  //         || element["updated"].toString().toUpperCase().contains(val.toUpperCase())
  //         || element["userRemarks"].toString().toUpperCase().contains(val.toUpperCase())
  //         || element["remarks"].toString().toUpperCase().contains(val.toUpperCase())
  //         || element["sts"].toString().toUpperCase().contains(val.toUpperCase())){
  //       result.add(element);
  //     }
  //   });
  //   setState(() {
  //     isLoading = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Credit Request Report"),
          leading: LeadingIcon(),

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
                     // _onSearch(val);
                    },
                  ),
                ),
              ),
              // Expanded(
              //     child: SingleChildScrollView(
              //       child: ListView.builder(
              //         // reverse: true,
              //         physics: NeverScrollableScrollPhysics(),
              //         shrinkWrap: true,
              //         padding: const EdgeInsets.only(
              //             left: 10, right: 10, top: 5, bottom: 0),
              //         itemBuilder: (BuildContext context, int i) {
              //           return Padding(
              //             padding: EdgeInsets.all(5),
              //             child: Container(
              //               decoration: BoxDecoration(
              //                 borderRadius: BorderRadius.circular(10),
              //                 border: Border.all(
              //                     color: Theme
              //                         .of(context)
              //                         .primaryColor,
              //                     width: 1),
              //               ),
              //               child: Padding(
              //                 padding: EdgeInsets.all(8.0),
              //                 child: ExpandableNotifier(
              //                   // controller: expandableController,
              //                   child:
              //                   Column(
              //                     children: [
              //                       SubChildItem('S.No', '${i + 1}', false),
              //                       SubChildItem('Request Code', result[i]["reqCode"].toString(), false),
              //                       SubChildItem('Request Amount', result[i]["reqAmt"].toString(), false),
              //                       Row(
              //                         children: [
              //                           Container(
              //                             padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 2),
              //                             width: MediaQuery.of(context).size.width / 2.5,
              //                             child: Text(
              //                               "BankDeposit Details",
              //                               style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w700),
              //                               textAlign: TextAlign.start,
              //                             ),
              //                           ),
              //                           Expanded(
              //                             child:  Html(
              //                               data: '${result[i]["depdet"].toString()}' ,
              //                             ),
              //                           ),
              //                         ],
              //                       ),
              //                       SubChildItem('Mode', result[i]["mop"]?? "", false),
              //                       SubChildItem('Bank', result[i]["bank"]?? "", false),
              //                       SubChildItem('Request Date', result[i]["reqdate"]?? "", false),
              //                       SubChildItem('Updated Date', result[i]["updated"]?? "", false),
              //                       SubChildItem('User Remarks', result[i]["userRemarks"]?? "", false),
              //                       SubChildItem('Admin Remarks', result[i]["remarks"] ?? "", false),
              //                       SubChildItem('Request Status', result[i]["sts"], false),
              //                       result[i]["depslip"].toString() != ''
              //                           ? Row(
              //                         children: [
              //                           Text("Payment Slip",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
              //                           Padding(padding: EdgeInsets.all(10),
              //                             child: Container(
              //                               child: CachedNetworkImage(
              //                                 height: Get.height/3,
              //                                 width: Get.width/2,
              //                                 imageUrl: "${Constants.DistributorDepSlips_url}${result[i]["depslip"].toString()}",
              //                                 placeholder: (ctx,url)=> Center(child: CircularProgressIndicator(),),
              //                                 errorWidget: (ctx,url,error) => Image.asset('${Constants.ImagePath}NoImage.png'),
              //                               ),
              //                             ),)
              //                         ],
              //                       )
              //                           : const Center()
              //                     ],
              //                   ),
              //                 ),
              //               ),
              //             ),
              //           );
              //         },
              //         itemCount: result.length,
              //       ),
              //     )
              // ),
            ],
          ),
        )
    );
  }


}
