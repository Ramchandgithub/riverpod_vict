
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:victous/Widgets/leadingIconWidget.dart';

import '../../Controllers/payout_onhold_notifier.dart';
import '../../Widgets/sub_child_item.dart';
import '../main_view.dart';

class PayoutOnholdRpt extends ConsumerStatefulWidget {
  const PayoutOnholdRpt({Key? key}) : super(key: key);
  static const String routeName = '/PayoutOnholdRpt';

  @override
  ConsumerState<PayoutOnholdRpt> createState() => _ConsumerPayoutOnholdRpt();
}

class _ConsumerPayoutOnholdRpt extends ConsumerState<PayoutOnholdRpt> {
  // bool isLoading = true,isMoreData=true;
  // int listCount=20;
  // List result = [],orginalresult=[];
   TextEditingController searchCntrl = TextEditingController();

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final payoutData = ref.watch(payoutProvider);

    debugPrint("payoutData:::${payoutData.payoutlist.length}");
    return Scaffold(
        appBar: AppBar(
          leading: LeadingIconWidget(),
          title: const Text("Payout On Hold", style: TextStyle(color: Colors.white, fontSize: 16),),

        ),
        body: payoutData.isLoading ? Center(child: const CircularProgressIndicator())
       : Column(
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
                  val.isNotEmpty ?  ref.read(payoutProvider.notifier).search(val) : ref.read(payoutProvider.notifier).clearSearch() ;

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
                                 SubChildItem('Period', payoutData.payoutlist[i].period.toString(), false),
                                 SubChildItem('Associate ID', payoutData.payoutlist[i].memberId.toString(), false),
                                 SubChildItem(' Name', payoutData.payoutlist[i].name.toString(), false),
                                 SubChildItem('Amount', payoutData.payoutlist[i].amount.toString(), false),
                                 SubChildItem('Reason', payoutData.payoutlist[i].reason.toString(), false),
                               ],
                             ),
                           ),
                         ),
                       ),
                     );
                   },
                   itemCount: payoutData.payoutlist.length,
                 ),
               )
           ),
         ],
       )
    );
  }


}

