import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:victous/Model/referal_model.dart';
import 'package:victous/Presentation/main_view.dart';

import '../../Utils/constants.dart';
import '../../Utils/logger.dart';
import '../../Widgets/sub_child_item.dart';
import '../../widgets/leading_icon.dart';

class NotificationReport extends ConsumerStatefulWidget {
  static const String routeName = '/NotificationReport';

  const NotificationReport({super.key});

  @override
  ConsumerState<NotificationReport> createState() => _NotificationReportState();
}

class _NotificationReportState extends ConsumerState<NotificationReport> {
  List  orgnalResult = [];
  bool isLoading = false;
  late TextEditingController searchCtrl;
  int index = 0;
  List response = [];
  TextEditingController searchCntrl = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLoading = true;
    searchCtrl = TextEditingController();
    orgnalResult = [];
    // Future.delayed(Duration.zero).then((value) {
    //   var args = Get.arguments;
    //   response.addAll(args.map((e) => (e)));
    //   Logger.logger("Response:::$response");
    //   setState(() {
    //     orgnalResult.addAll(response);
    //     isLoading = false;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    final notificationData = ref.watch(notificationProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Notification Report", style: TextStyle(color: Colors.white),),
          leading: const  LeadingIcon(),
        ),
        body:  notificationData.isEmpty
            ? const Center(child: Text("No Data"),)
        : SingleChildScrollView(
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
                    itemCount: notificationData.length,
                    itemBuilder: (context, index) {
                      var data = index + 1;
                      DateTime tmpDate = DateTime.parse(notificationData[index]!.createdDate.toString());
                      String formattedDate = DateFormat("dd/MM/yyyy").format(tmpDate);
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
                                        SubChildItem('Id No', "${notificationData[index]!.idType.toString()}", true),
                                        SubChildItem('Title', "${notificationData[index]!.title.toString()}", true),
                                      ],
                                    ), expanded: Column(
                                    children: [
                                      SubChildItem('S.No', data.toString(), true),
                                      SubChildItem('Id No', "${notificationData[index]!.idType.toString()}", true),
                                      SubChildItem('Title', "${notificationData[index]!.title.toString()}", true),
                                      SubChildItem('Notification', "${notificationData[index]!.message.toString()}", true),
                                      // notificationData[index]!notificationFile.toString() != ''
                                      //     ? Row(
                                      //   children: [
                                      //     Text("Uploaded File",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                      //     Padding(padding: EdgeInsets.all(10),
                                      //       child: Container(
                                      //         child: CachedNetworkImage(
                                      //           height: Get.height/3,
                                      //           width: Get.width/2,
                                      //           imageUrl: "${Constants.NotifcationImgUrl}${notificationData[index]!.notificationFile.toString()}",
                                      //           placeholder: (ctx,url)=> const Center(child: CircularProgressIndicator(),),
                                      //           errorWidget: (ctx,url,error) => Image.asset('${Constants.ImagePath}NoImage.png'),
                                      //         ),
                                      //       ),)
                                      //   ],
                                      // )
                                      //     : const Center(),
                                      SubChildItem('Post Date', "${notificationData[index]!.postedDate.toString().replaceFirst('T', ' \n')}", true),
                                      SubChildItem('Read Date', "${notificationData[index]!.createdDate.toString().replaceFirst('T', '\n')}", true),


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
      if (element["title"].toString().toUpperCase().contains(val.toString().toUpperCase()) ||
          element["createdDate"].toString().contains(val) ||
          element["message"].toString().toUpperCase().contains(val.toUpperCase()) ||
          element["idType"].toString().contains(val)) {
        response.add(element);
      }
    });
    setState(() {
      isLoading = false;
    });

  }
}
