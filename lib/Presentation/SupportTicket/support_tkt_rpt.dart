
import 'package:flutter/Material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Widgets/leading_icon.dart';
import '../../Widgets/sub_child_item.dart';

class SupportTktRpt extends ConsumerStatefulWidget {
  const SupportTktRpt() : super();
  static const String routeName = '/SupportTktRpt';

  @override
  ConsumerState<SupportTktRpt> createState() => _SupportTktRptState();
}

class _SupportTktRptState extends ConsumerState<SupportTktRpt> {


  onQueryChanged(String query) {
    print('inside:::onQuery changed');

  }
  TextEditingController searchCtrl = TextEditingController();


  @override
  void initState(){
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Support Ticket Report"),
        leading: LeadingIcon(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              //CustomSearchBar(onQueryChanged : onQueryChanged),
              const SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.all(3),
                child: TextField(
                  controller: searchCtrl,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.black,
                        )),
                    labelText: 'Search',
                    hintText: 'Search',
                    labelStyle: const TextStyle(
                        color:  Colors.black
                    ),
                    prefixIcon: const Icon(Icons.search,color: Colors.black,),
                  ),
                  onChanged: (val) {
                    //onSearch(val);
                  },
                ),
              ),
          //     ListView.builder(
          //       shrinkWrap: true,
          // physics: NeverScrollableScrollPhysics(),
          // itemCount: tktRptList.length,
          // itemBuilder: (BuildContext context, int index){
          //       return Card(
          //         elevation: 3,
          //         shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(10)
          //         ),
          //         child: Padding(
          //           padding: EdgeInsets.all(3.0),
          //           child: Column(
          //             children: [
          //               SubChildItem("S.No", '${index + 1}', false),
          //               SubChildItem("Ticket No", tktRptList[index].griNo.toString(), false),
          //               SubChildItem("Nature Of Ticket", tktRptList[index].natureofTicket.toString(), false),
          //               SubChildItem("Subject", tktRptList[index].subject.toString(), false),
          //               SubChildItem("Description", tktRptList[index].message.toString(), false),
          //               SubChildItem("Ticket Date", tktRptList[index].dated.toString(), false),
          //               SubChildItem("Ticket Status", tktRptList[index].grievanceStatus.toString(), false),
          //               SubChildItem("Remarks", tktRptList[index].remarks.toString(), false),
          //               InkWell(
          //                 onTap: (){
          //                   // Map<String,dynamic> params = {
          //                   //   "srid":  tktRptList[index].sno,
          //                   // };
          //                   // Repository().getTktRelyDetails(params,tktRptList[index].grievanceStatus,tktRptList[index].sno.toString());
          //                 },
          //                 child: tktRptList[index].grievanceStatus.toString().toUpperCase() == "OPEN"
          //                     ?SubChildItem3('View/Reply Message', "Reply", false,Colors.blue)
          //                     :SubChildItem3('View/Reply Message', "View Message", false,Colors.blue),
          //               ),
          //
          //               //SubChildItem("Reply/ View Message", tktRptList[index], false),
          //             ],
          //           ),
          //         ),
          //       );
          //     })




            ],
          ),
        ),
      )
    );
  }

   // onSearch(String query) {
   //   tktRptList = [];
   //   searchResults.forEach((element) {
   //     if(
   //     element.griNo!.toLowerCase().contains(query.toLowerCase()) ||
   //         element.grievanceStatus!.toLowerCase().contains(query.toLowerCase()) ||
   //         element.subject!.toLowerCase().contains(query.toLowerCase()) ||
   //         element.dated!.toLowerCase().contains(query.toLowerCase())
   //     ){
   //       tktRptList.add(element);
   //     }
   //   });
   //
   // }
}
