

import 'dart:convert';

import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:victous/widgets/leading_icon.dart';

import '../../Utils/constants.dart';
import '../../Utils/logger.dart';
import '../../Utils/network_call.dart';
import '../../Utils/session_manager.dart';

class VisualGenealogyTabularView extends StatefulWidget {
  const VisualGenealogyTabularView({Key? key}) : super(key: key);
  static const String routeName = '/VisualGenealogyTabularView';

  @override
  State<VisualGenealogyTabularView> createState() =>
      _VisualGenealogyTabularViewState();
}

class _VisualGenealogyTabularViewState
    extends State<VisualGenealogyTabularView> with TickerProviderStateMixin {
  late List originalListCommOne,originalListCommTwo,communityOne,communityTwo,result;
  late bool isMoreDataLeft=true,isMoreDataright=true;
  int index = 0,listCount = 10;
  int selectedIndex = 0;
  String from = '', to = '';

  int currentPageCommOne = 1;
  int currentPageCommTwo = 1;
  final int pageSize = 50;
  bool isLoad = false;
  bool hasMore = true;
  bool isLoadingMore = false;
  int globalIndex1 =  0, globalIndex2 = 0,  localIndex = 0;

  late TextEditingController leftSearchCtrl=TextEditingController();
  late TextEditingController rightSearchCtrl=TextEditingController();
  final ScrollController _controller1 = ScrollController();
  final ScrollController _controller2 = ScrollController();
  late final TabController _tabCntrl;
  var args;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLoad=true;
    args = Get.arguments;
    Logger.logger('args::${args}');
    // from = DateFormat('dd/MM/yyyy').format(DateTime.parse(args['from'])) ?? '';
    from = DateFormat('yyyy/MM/dd').format(DateTime.parse(args['from'])) ?? '';
    to = DateFormat('yyyy/MM/dd').format(DateTime.parse(args['to'])) ?? '';
    // to = DateFormat('dd/MM/yyyy').format(DateTime.parse(args['to'])) ?? '';
    //to = args['from'] ?? '';
    Logger.logger("from:::${from}");
    Logger.logger("to:::${to}");

    originalListCommOne=[];
    originalListCommTwo=[];
    result=[];
    communityOne=[];
    communityTwo=[];
    _tabCntrl = TabController(length: 2, vsync: this);
    Future.delayed(Duration.zero).then((value) {
      currentPageCommOne = 1;
      getcallCommunityONEFinalFilter(1, currentPageCommOne);
      getcallCommunityONEFinalFilter(2, currentPageCommTwo);
      _controller1.addListener(_onScroll1);
      _controller2.addListener(_onScroll2);
      _tabCntrl.addListener(() {
        if (!_tabCntrl.indexIsChanging) {
          selectedIndex = _tabCntrl.index;
          Logger.logger("selected index:::${selectedIndex}");
          _controller1.addListener(_onScroll1);
          _controller2.addListener(_onScroll2);

          if (selectedIndex == 0) {
            if (communityOne.isEmpty) {
              currentPageCommOne = 1;
              getcallCommunityONEFinalFilter(1, currentPageCommOne);
            }
          } else {
            if (communityTwo.isEmpty) {
              currentPageCommTwo = 1;
              getcallCommunityONEFinalFilter(2, currentPageCommTwo);
            }
          }
        }
      });

      setState(() {
        isLoad=false;
      });
    });
  }


  getcallCommunityONEFinalFilter(int team,int pagenmuber) {
    Map<String, dynamic> params = {
      "idno": SessionManager.getString(Constants.PREF_UserId),
      "frmdate":from,// DateFormat('dd/MM/yyyy').parse(from.toString()), // '01/01/1900',
      // "todate": DateFormat('dd/MM/yyyy').format(DateTime.parse(to)), // '01/01/1900',
      "todate": to, //DateFormat('dd/MM/yyyy').format(DateTime.now()),
      'Team': team,
      'PageNumber': pagenmuber,
      'PageSize': 50
    };
    NetworkCall().onCallServer(endPoint: Constants.api_TabularView, parameters: params).then((value) {
      var data1 = (NetworkCall.getParse(value));
      if(data1 != ''){
        var data = jsonDecode(data1);
        Logger.logger("Data:::${data}");
        if(data.length > 0){
          if(team == 1){
            // communityOne.addAll(_filterNewItems(data, communityOne));
            communityOne.addAll(data);
            originalListCommOne.addAll(communityOne);
            Logger.logger("comm one :::${communityOne.length}");
          } else{
            communityTwo.addAll(data);
            // communityTwo.addAll(_filterNewItems(data, communityTwo));
            originalListCommTwo.addAll(communityTwo);
            Logger.logger("comm two :::${communityTwo.length}");
          }
          isLoadingMore = false;
        } else{
          hasMore = false;
          Logger.showWarningAlert("Alert", " No Data Found");
        }
      } else{
        Logger.showWarningAlert("Alert", "No Data Found");
      }


      setState(() {
        isLoad = false;
      });

    });

  }

  List<dynamic> _filterNewItems(List<dynamic> newItems, List<dynamic> existingItems) {
    final existingIds = existingItems.map((e) => e['id']).toSet(); // assuming 'id' is your unique key
    return newItems.where((item) => !existingIds.contains(item['id'])).toList();
  }

  _onCommOneSearch(String val){

    communityOne.clear();
    originalListCommOne.forEach((element) {
      if (element['IDNo'].toString().toLowerCase().contains(val) ||
          element['JoinDate'].toString().toLowerCase().contains(val) ||
          element['ActivateDate'].toString().toLowerCase().contains(val) ||
          element['RankName'].toString().toLowerCase().contains(val) ||
          element['Name'].toString().toLowerCase().contains(val) ||
          element['status'].toString().toLowerCase().contains(val) ||
          element['city'].toString().toLowerCase().contains(val) ||
          element['state'].toString().toLowerCase().contains(val) ||
          element['Mobile'].toString().contains(val) ||
          element['bv'].toString().contains(val)) {
        // setState(() {
        communityOne.add(element);
        // });
      } else{
        //print("Inside else");
      }
    });
    setState(() {
      isLoad = false;
    });
  }

  _onCommTwoSearch(String val){
    communityTwo.clear();
    originalListCommTwo.forEach((element) {
      if (element['IDNo'].toString().toLowerCase().contains(val.toLowerCase()) ||
          element['JoinDate'].toString().toLowerCase().contains(val.toLowerCase()) ||
          element['ActivateDate'].toString().toLowerCase().contains(val.toLowerCase()) ||
          element['RankName'].toString().toLowerCase().contains(val.toLowerCase()) ||
          element['Name'].toString().toLowerCase().contains(val.toLowerCase()) ||
          element['status'].toString().toLowerCase().contains(val.toLowerCase()) ||
          element['city'].toString().toLowerCase().contains(val.toLowerCase()) ||
          element['state'].toString().toLowerCase().contains(val.toLowerCase()) ||
          // element['Mobile'].toString().contains(val) ||
          element['bv'].toString().contains(val)) {
        // setState(() {
        communityTwo.add(element);
        //  });
      } else{

      }
    });
    setState(() {
      isLoad = false;
    });
  }

  void _onScroll1() {
    Logger.logger("scroll position pixels:::${_controller1.position.pixels}");
    Logger.logger("isLoadingMore:::$isLoadingMore");
    Logger.logger("_controller1.position.maxScrollExtent:::$_controller1.position.maxScrollExtent");
    if (_controller1.position.pixels >= _controller1.position.maxScrollExtent - 100 && !isLoadingMore) {
      isLoadingMore = true;
      currentPageCommOne = currentPageCommOne + 1;
      getcallCommunityONEFinalFilter(1,currentPageCommOne );
      setState(() {
        isLoad = false;
      });

    }
  }
  Future _onScroll2() async {
    if (_controller2.position.pixels >= _controller2.position.maxScrollExtent - 100 && !isLoadingMore) {
      isLoadingMore = true;
      currentPageCommTwo += 1;
      await getcallCommunityONEFinalFilter(2, currentPageCommTwo);
      setState(() {
        // isLoadingMore = false;
        isLoad = false;
      });
    }

  }


  @override
  Widget build(BuildContext context) {
    index = 0;
    return DefaultTabController(
        length: 2,
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: const Text("Tabular Genealogy"),
              leading: LeadingIcon(),
              bottom:  TabBar(
                  isScrollable: false,
                  controller: _tabCntrl,
                  tabs: [
                    Tab(
                      child: Text(
                        "COMMUNITY 1",
                        style: TextStyle(fontSize: 15,color: Colors.white),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "COMMUNITY 2",
                        style: TextStyle(fontSize: 15,color: Colors.white),
                      ),
                    ),
                  ]),
            ),

            body: isLoad
                ? const Center()
                : TabBarView(
              controller: _tabCntrl,
              children: [
                Stack(
                    children:[
                      SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        controller: _controller1,//rupa
                        child: Column(
                            children: [
                              const  SizedBox(height: 20,),
                              Container(
                                // height: 40,
                                  width: Get.width,
                                  padding: const EdgeInsets.only(top: 8,left: 14,right: 14),
                                  child: TextFormField(
                                    controller: leftSearchCtrl,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(horizontal: 3, vertical: 1),
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                      enabledBorder:OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                      labelText: 'Search Here',
                                      hintText: 'Search Here',
                                      labelStyle: TextStyle(color: Colors.black26),
                                      suffixIcon: IconButton(
                                        icon: const Icon(Icons.search),
                                        onPressed: (){},
                                      ),
                                    ),
                                    onChanged: (val) {
                                      setState(()
                                      {
                                        _onCommOneSearch(val);
                                      });
                                    },)
                              ),
                              const SizedBox(height: 10,),
                              Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Text('Displayed Records 1 - ${communityOne.length} scroll down for more records ', style: TextStyle(fontWeight: FontWeight.bold),)),

                              SingleChildScrollView(
                                  padding: EdgeInsets.all(10),
                                  scrollDirection: Axis.horizontal,
                                  child: communityOne.isNotEmpty
                                      ? Container(
                                      child: DataTable(
                                        headingRowColor: MaterialStateColor.resolveWith((states) => Theme.of(context).primaryColor),
                                        columnSpacing: 16,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1.0,
                                              color: Colors.black12),
                                        ),
                                        columns: const [
                                          DataColumn(label: Text('S.No', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),)),
                                          DataColumn(label: VerticalDivider()),
                                          DataColumn(label: Text('Associate ID', style: TextStyle(fontWeight: FontWeight.bold,  color: Colors.white),)),
                                          DataColumn(
                                              label: VerticalDivider()),
                                          DataColumn(label: Text('User Name', style: TextStyle(fontWeight: FontWeight.bold,  color: Colors.white),)),

                                          DataColumn(
                                              label: VerticalDivider()),
                                          DataColumn(label: Text('Rank Name', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),)),
                                          DataColumn(
                                              label: VerticalDivider()),
                                          DataColumn(
                                              label: Text('Join Date', style: TextStyle(fontWeight: FontWeight.bold,  color: Colors.white),)),
                                          DataColumn(
                                              label: VerticalDivider()),
                                          DataColumn(
                                              label: Text('Activate Date', style: TextStyle(fontWeight: FontWeight.bold,  color: Colors.white),)),

                                          DataColumn(
                                              label: VerticalDivider()),
                                          DataColumn(label: Text('City', style: TextStyle(fontWeight: FontWeight.bold,  color: Colors.white),)),
                                          DataColumn(
                                              label: VerticalDivider()),
                                          DataColumn(label: Text('State', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),)),
                                          DataColumn(
                                              label: VerticalDivider()),
                                          DataColumn(label: Text('PV ', style: TextStyle(fontWeight: FontWeight.bold,  color: Colors.white),)),
                                          DataColumn(
                                              label: VerticalDivider()),
                                          DataColumn(label: Text('Status', style: TextStyle(fontWeight: FontWeight.bold,  color: Colors.white),)),
                                        ],
                                        rows: communityOne.asMap().entries.map((entry){
                                          int localIndex = entry.key;
                                          var e = entry.value;
                                          globalIndex1 =   localIndex + 1;
                                          // Logger.logger('global Index:::${globalIndex1}');

                                          return DataRow(cells: [
                                            DataCell(Text('${globalIndex1}')),
                                            DataCell(VerticalDivider()),
                                            DataCell(
                                              Text(
                                                e["IDNo"].toString(),
                                                style: const TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ),
                                            DataCell(VerticalDivider()),
                                            DataCell(
                                                Text(e['Name']??"")),
                                            DataCell(VerticalDivider()),
                                            DataCell(
                                              Text(e['RankName']??""),
                                            ),
                                            DataCell(VerticalDivider()),
                                            DataCell(
                                              Text(e['JoinDate']??""),
                                            ),
                                            DataCell(VerticalDivider()),
                                            DataCell(
                                              Text(e['ActivateDate']
                                                  ??""),
                                            ),
                                            DataCell(VerticalDivider()),
                                            DataCell(
                                              Text(e['city']??""),
                                            ),
                                            DataCell(VerticalDivider()),
                                            DataCell(
                                                Text(e['state']??"")),
                                            DataCell(VerticalDivider()),
                                            DataCell(Text(double.parse(e['bv'].toString()).toStringAsFixed(0))),
                                            DataCell(VerticalDivider()),
                                            DataCell(
                                                Text(e['status']??"")),
                                          ]);
                                        }).toList(),
                                      ))
                                      : Center(
                                    child: Container(
                                        padding: const EdgeInsets.only(
                                            top: 100, left: 100),
                                        alignment: Alignment.center,
                                        child: const Text("No Data Found")),
                                  ))


                            ]),
                      ),
                      Positioned(
                          right: 16,
                          bottom: 16,
                          // child: Text("Page : $currentPageCommTwo "),
                          child: SizedBox(
                              width: 130,
                              child: ElevatedButton(onPressed: (){},child: Text("Page : $currentPageCommOne", style: TextStyle(color: Colors.white),),style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).primaryColor),))
                      )

                    ]

                ),
                Stack(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      controller: _controller2,
                      child: Column(
                        children: [
                          const SizedBox(height: 20,),
                          Container(
                            // height: 40,
                            width: Get.width,
                            padding: const EdgeInsets.only(top: 8,left: 14,right: 14),
                            child: TextField(
                              controller: rightSearchCtrl,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                enabledBorder:OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                labelText: 'Search Here',
                                hintText: 'Search Here',
                                labelStyle: TextStyle(color: Colors.black26),
                                suffixIcon: IconButton(icon: const Icon(Icons.search),onPressed: (){},),
                              ),
                              onChanged: (val) {
                                setState(()
                                {
                                  _onCommTwoSearch(val);
                                });
                              },),
                          ),
                          const SizedBox(
                            height: 10,
                          ),

                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text('Displayed Records 1 - ${communityTwo.length} scroll down for more records ', style: TextStyle(fontWeight: FontWeight.bold))),
                          const SizedBox(
                            height: 10,
                          ),
                          SingleChildScrollView(
                              padding: EdgeInsets.all(10),
                              scrollDirection: Axis.horizontal,
                              child: communityTwo.isNotEmpty
                                  ? Container(
                                  child: DataTable(
                                    headingRowColor: MaterialStateColor.resolveWith((states) => Theme.of(context).primaryColor),
                                    columnSpacing: 16,
                                    decoration: BoxDecoration(

                                      border: Border.all(
                                          width: 1.0,
                                          color: Colors.black12),
                                    ),
                                    columns: const [
                                      DataColumn(label: Text('S.No', style: TextStyle(fontWeight: FontWeight.bold,  color: Colors.white),)),
                                      DataColumn(label: VerticalDivider()),
                                      DataColumn(label: Text('Associate ID', style: TextStyle(fontWeight: FontWeight.bold,  color: Colors.white),)),
                                      DataColumn(label: VerticalDivider()),
                                      DataColumn(label: Text('User Name', style: TextStyle(fontWeight: FontWeight.bold,  color: Colors.white),)),
                                      DataColumn(label: VerticalDivider()),
                                      DataColumn(label: Text('Rank Name', style: TextStyle(fontWeight: FontWeight.bold,  color: Colors.white),)),
                                      DataColumn(label: VerticalDivider()),
                                      DataColumn(label: Text('Join Date', style: TextStyle(fontWeight: FontWeight.bold,  color: Colors.white),)),
                                      DataColumn(label: VerticalDivider()),
                                      DataColumn(label: Text('Activate Date',style: TextStyle(fontWeight: FontWeight.bold,  color: Colors.white),)),
                                      DataColumn(label: VerticalDivider()),
                                      // DataColumn(label: Text('Sponsor', style: TextStyle(fontWeight: FontWeight.bold,  color: Colors.white),)),
                                      // DataColumn(label: VerticalDivider()),
                                      DataColumn(label: Text('City', style: TextStyle(fontWeight: FontWeight.bold,  color: Colors.white),)),
                                      DataColumn(label: VerticalDivider()),
                                      DataColumn(label: Text('State', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),)),
                                      DataColumn(label: VerticalDivider()),
                                      // DataColumn(label: Text('Mobile', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),)),
                                      // DataColumn(label: VerticalDivider()),
                                      DataColumn(label: Text('PV ', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),)),
                                      DataColumn(label: VerticalDivider()),
                                      DataColumn(label: Text('Status', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),)),
                                    ],


                                    rows: communityTwo.asMap().entries.map((entry){
                                      localIndex = entry.key;
                                      //Logger.logger("local Index::${localIndex}");
                                      var e = entry.value;
                                      globalIndex2 = localIndex + 1;
                                      // Logger.logger("global Index 2:::${globalIndex2}");
                                      //Logger.logger("Name:::${e['Name']}");
                                      return DataRow(cells: [
                                        DataCell(Text('${globalIndex2}')),
                                        DataCell(VerticalDivider()),
                                        DataCell(
                                          Text(
                                            e["IDNo"].toString(),
                                            style: const TextStyle(
                                                color: Colors.black),
                                          ),
                                        ),
                                        DataCell(VerticalDivider()),
                                        DataCell(
                                            Text(e['Name'].toString())),
                                        DataCell(VerticalDivider()),

                                        DataCell(
                                          Text(e['RankName']??""),
                                        ),
                                        DataCell(VerticalDivider()),
                                        DataCell(
                                          Text(e['JoinDate'].toString()),
                                        ),
                                        DataCell(VerticalDivider()),
                                        DataCell(
                                          Text(
                                              e['ActivateDate'].toString()),
                                        ),
                                        // DataCell(VerticalDivider()),
                                        // DataCell(
                                        //   Text(e['Upliner'].toString()),
                                        // ),
                                        DataCell(VerticalDivider()),
                                        DataCell(
                                          Text(e['city'].toString()),
                                        ),
                                        DataCell(VerticalDivider()),
                                        DataCell(
                                            Text(e['state'].toString())),
                                        //DataCell(VerticalDivider()),
                                        // DataCell(
                                        //   Text(e['Mobile'].toString()),
                                        // ),
                                        DataCell(VerticalDivider()),
                                        DataCell(Text(double.parse(e['bv'].toString()).toStringAsFixed(0))),
                                        DataCell(VerticalDivider()),
                                        DataCell(
                                            Text(e['status'].toString())),
                                      ]);
                                    }).toList(),

                                  ))
                                  : Center(
                                child: Container(
                                    padding: const EdgeInsets.only(
                                        top: 100, left: 100),
                                    alignment: Alignment.center,
                                    child: const Text("No Data Found")),
                              )),

                        ],
                      ),
                    ),
                    Positioned(
                        right: 16,
                        bottom: 16,
                        // child: Text("Page : $currentPageCommTwo "),
                        child: SizedBox(
                            width: 130,
                            child: ElevatedButton(onPressed: (){},child: Text("Page : $currentPageCommTwo", style: TextStyle(color: Colors.white),),style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).primaryColor),))
                    )
                  ],
                )

              ],
            ),
          ),
        )
    );
  }



}
