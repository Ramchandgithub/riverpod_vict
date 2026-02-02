import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../Utils/constants.dart';
import '../../Utils/logger.dart';
import '../../Widgets/sub_child_item.dart';
import '../../model/referal_model.dart';
import '../../widgets/leading_icon.dart';
import '../main_view.dart';

class DirectRefReport extends ConsumerStatefulWidget {
  static const String routeName = '/DirectRefReport';

  const DirectRefReport({super.key});

  @override
  ConsumerState<DirectRefReport> createState() => _ConsumerStateDirectRefReportState();
}

class _ConsumerStateDirectRefReportState extends ConsumerState<DirectRefReport> {
   List<ReferralModel>  orgnalResult = [];

  late TextEditingController searchCtrl;
  int index = 0;
  List<ReferralModel> response = [];
  TextEditingController searchCntrl = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchCtrl = TextEditingController();
    orgnalResult = [];

  }

  @override
  Widget build(BuildContext context) {
    final referralData = ref.watch(referralProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Direct Referral Report", style: TextStyle(color: Colors.white, fontSize: 16),),
          leading: const  LeadingIcon(),
        ),
        body: SingleChildScrollView(
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
                    ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: referralData.length,
                        itemBuilder: (context, index) {
                          var data = index + 1;
                          return Padding(padding: EdgeInsets.only(bottom: 0 ),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Theme.of(context).primaryColor)),
                                child: ExpandableNotifier(
                                  child: Column(
                                    children: [
                                      Expandable(
                                        collapsed:  Column(
                                          children: [
                                            SubChildItem('S.No', data.toString(), true),
                                            SubChildItem('Associate ID', referralData[index]?.idno ?? '', true),
                                            SubChildItem('Name', referralData[index]?.name ?? '', true),
                                            SubChildItem('Status',  referralData[index]?.mstatus ?? '', true),
                                          ],
                                        ), expanded: Column(
                                        children: [
                                          SubChildItem('S.No', data.toString(), true),
                                          SubChildItem('Associate ID', referralData[index]?.idno ?? '', true),
                                          SubChildItem('Name', referralData[index]?.name ?? '', true),
                                          SubChildItem('Status',  referralData[index]?.mstatus ?? '', true),
                                          // SubChildItem('PV',  referralData[index]!.pv.toStringAsFixed(0).toString(), true),
                                          SubChildItem('State', referralData[index]?.stateName ?? '', true),
                                          SubChildItem('City',  referralData[index]?.cityName ?? '', true),
                                          SubChildItem('Join Date', referralData[index]?.joinDate ?? '', true),
                                          SubChildItem('Activated Date',  referralData[index]?.activatedDate ?? '', true),

                                          // SubChildItem('Mobile',  response[index].mobile ?? '', true),

                                        ],
                                      ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .center,
                                        children: [
                                          Builder(
                                            builder: (context) {
                                              var controller = ExpandableController
                                                  .of(
                                                  context, required: true
                                              );
                                              return InkWell(
                                                child:
                                                controller!.expanded ?
                                                Image.asset(
                                                  '${Constants
                                                      .ImagePath}up_arrow.png',
                                                  height: 35,
                                                  width: 35,
                                                )
                                                    : Image.asset(
                                                  '${Constants
                                                      .ImagePath}down2.gif',
                                                  height: 35,
                                                  width: 35,
                                                ),
                                                onTap: () {
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

                        }
                    ),
                  ],

                )
        )
    );
  }

   _onSearch(String val) {
     response.clear();
     orgnalResult.forEach((element) {
       if (element.idno.toString().toUpperCase().contains(val.toString().toUpperCase()) ||
           element.name.toString().toUpperCase().contains(val.toUpperCase()) ||
           element.stateName.toString().toUpperCase().contains(val.toUpperCase()) ||
           element.mobile.toString().contains(val) ||
           element.cityName.toString().toUpperCase().contains(val.toUpperCase()) ||
           element.mstatus.toString().toUpperCase().contains(val.toUpperCase())) {
         response.add(element);
       }
     });


   }
}
