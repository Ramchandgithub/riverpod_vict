
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:victous/Presentation/main_view.dart';
import 'package:victous/Widgets/sub_child_item.dart';
import 'package:get/get.dart';
import 'package:victous/model/wallet_model.dart';
import '../../Controllers/search_notifier.dart';
import '../../Utils/logger.dart';
import '../../widgets/leading_icon.dart';

class SummaryRpt extends ConsumerStatefulWidget {
  const SummaryRpt({Key? key}) : super(key: key);
  static const String routeName = '/SummaryRpt';

  @override
  ConsumerState<SummaryRpt> createState() => _ConsumerSummaryRptState();
}

class _ConsumerSummaryRptState extends ConsumerState<SummaryRpt> {
  TextEditingController searchCtrl = TextEditingController();
  List<WalletModel> dummyresp = [];

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final walletData = ref.watch(walletProvider);
    final searchData = ref.watch(SearchProvider);
    // final data = ref.watch(filteredListProvider(walletProvider));
    for(int i = 0; i< walletData.length; i++){
      dummyresp.add(walletData[i]!);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping wallet',style: TextStyle(color: Colors.white, fontSize: 16),),
        leading: LeadingIcon(),
      ),
      body:
     SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            children: [
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
                   // onSearch(val);
                  },
                ),
              ),
              const SizedBox(height: 15,),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: walletData.length,
                  itemBuilder: (BuildContext context, int index){
                return Card(
                  elevation: 2,
                  child: Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Column(
                      children: [
                        SubChildItem("S.No", '${index+1}', false),
                        SubChildItem("Transaction Date", walletData[index]?.date ?? '', false),
                        SubChildItem("Credit ", '\u{20B9} ${walletData[index]?.inAmt}', false),
                        SubChildItem("Debit", '\u{20B9} ${walletData[index]?.outAmt}', false),
                        SubChildItem("Balance", '\u{20B9} ${walletData[index]!.balance}', false),
                        SubChildItem("Remarks", walletData[index]?.remarks ?? '', false),
                        SubChildItem("Description", walletData[index]?.descr ?? '', false),
                      ],
                    ),
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }

   onSearch(String query) {
    // resp = [];
    dummyresp.forEach((element) {
      if(
      element.date.toString().contains(query) ||
      element.inAmt.toString().contains(query) ||
      element.outAmt.toString().contains(query) ||
      element.remarks.toString().toUpperCase().contains(query.toUpperCase()) ||
      element.descr.toString().toUpperCase().contains(query.toUpperCase())
      ){
        // resp.add(element);
      }
    });

   }
}
