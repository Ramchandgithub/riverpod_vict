
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:victous/Model/orders_rpt_model.dart';
import 'package:victous/Presentation/My%20Orders/orders_rpt.dart';
import 'package:victous/services/repository.dart';
import 'package:victous/widgets/leading_icon.dart';
import '../Controllers/date_notifier.dart';
import '../Presentation/genealogy/tabular_genealogy_view.dart';
import '../Utils/constants.dart';
import '../Utils/logger.dart';
import '../Utils/network_call.dart';
import '../Utils/session_manager.dart';
import '../Utils/statemodel.dart';
import '../services/repository.dart';

final OrdersReportProvider = StateProvider<List<OrdersRptModel>>((ref) => []);

class MyDateFilterView extends ConsumerStatefulWidget {
  static const routeName = '/MyDateFilterView';
  const MyDateFilterView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _ConsumerMyDateFilterViewState();
  }
}

class _ConsumerMyDateFilterViewState extends ConsumerState<MyDateFilterView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late int _groupValue;
  TextEditingController ondateController = TextEditingController(text: '');
  TextEditingController todateController = TextEditingController(text: '');
  TextEditingController fromDateController = TextEditingController(text: '');
  DateFormat format = DateFormat("yyyy-MM-dd");
  DateFormat format2 = DateFormat("yyyy-MM-dd HH:mm:ss:SSS");//ajay
  late Map<String, dynamic> args;
  late String Type;
  List<StateModel3> payno=[];
  int paynoIndx=0;
  int optionsIndx=0;
  //String? selectedValue = 'ALL'; // Initial selected value
  //
  final List<StateModel3> options = [];
  final List<StateModel3> credReqStatus = [];
  String selectedStatus = 'All'; // Default selection

  final List<String> orderStatusOptions = ['All', 'Dispatched', 'Cancelled'];


  @override
  void initState() {
    super.initState();
    _groupValue=0;
    args = Get.arguments as Map<String, dynamic>;
    Type = args['type'];
    options.add(StateModel3( Text: 'All',  ValueId: '-1'));
    options.add(StateModel3( Text: 'Dispatched',  ValueId: '1'));
    options.add(StateModel3( Text: 'Cancelled',  ValueId: '3'));

    credReqStatus.add(StateModel3( Text: 'All',  ValueId: 'ALL'));
    credReqStatus.add(StateModel3( Text: 'Pending',  ValueId: '0'));
    credReqStatus.add(StateModel3( Text: 'Approved',  ValueId: '1'));
    credReqStatus.add(StateModel3( Text: 'Rejected',  ValueId: '2'));

    if(Type=="Genealogy Report"){
      payno.add(StateModel3(ValueId: '0', Text: 'Select Pay Cycle'));
      _groupValue=1;
      if(_groupValue==1){
        _callpayno();
      }else{
        setState(() {
          paynoIndx = 0;
          payno.add(StateModel3(ValueId: '0', Text: 'Select Pay Cycle'));
        });
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  _callpayno() {
    Map<String, dynamic> param = {
      "Action":"Pay_Record",
      "Id":0,
      "Condition":0
    };
    NetworkCall().onCallServer(parameters: param, endPoint: Constants.api_GetDropDownDetails).then((value) async {
      List data = NetworkCall.getParse(value)as List;
      if (data.isNotEmpty) {
        payno.clear();
        paynoIndx = 0;
        payno.add(StateModel3(ValueId: '0', Text: 'Select Pay Cycle'));
        setState(() {
          payno.addAll(data.map((e) => StateModel3.frommJson(e)));
        });
      } else {
        Logger.showWarningAlert("Alert", 'No Records Found.');
      }
    });
  }

  Widget _myRadioButton({required String title, required int value, onChanged}) {
    return RadioListTile<int>(
      value: value,
      groupValue: _groupValue,
      activeColor:Theme.of(context).primaryColor,
      onChanged: (val) {
        setState(() {
          _groupValue = val!;
          if(_groupValue == 0){
            setState(() {
              ondateController.text = '';
              todateController.text = '';
              ondateController.text = '';
            });
          } else if(_groupValue == 1){
            setState(() {
              todateController.text = '';
              fromDateController.text = '';
            });
          } else if(_groupValue == 2){
            paynoIndx = 0;
            setState(() {
              ondateController.text = '';
            });
          }
        });
      },
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }



  _callFinalFilter(from, to, status) async {
    if (Type == 'Wallet Request Report') {
      var now = DateTime.now();
      var formatter = DateFormat('dd/MM/yyyy');//rupa
      var formatter1 = DateFormat('dd-MM-yyyy');//rupa
    }
    else if(Type == 'Business Report'){
      Map<String, dynamic> params = {
        "regid": SessionManager.getInt(Constants.PREF_Regid),
        "fromdate": from,
        "todate": to,
      };
      //Repository().getBusinessReport(params);
    }else if(Type=="Tabular Genealogy"){
      Logger.logger("from::$from");
      Logger.logger("to::$to");
      final valye = await ref.read(repoProvider.notifier);

      // Map<String, dynamic> params = {
      //   "idno": SessionManager.getString(Constants.PREF_UserId),
      //   "frmdate": from,
      //   "todate": to,
      //   'Team': 1,
      //   'PageNumber': 1,
      //   'PageSize': 50
      // };
      // Get.toNamed(VisualGenealogyTabularView.routeName);
      // Get.toNamed(VisualGenealogyTabularView.routeName, arguments: {'from': from, 'to': to} );

    }else if(Type=="Orders Report"){
      final value = await ref.read(repoProvider.notifier).getOrdersRpt(from,to);
      ref.read(OrdersReportProvider.notifier).state = value.cast<OrdersRptModel>();
      Get.toNamed(OrdersRpt.routeName);

    }
    else if(Type=="Ewallet Summary") {
     // Repository().getEwalletSummaryReport(from,to);
    }
    else if(Type=="Vzone Credit Request Reports"){
     // Repository().getVzoneCreditRequestReport(from, to);
    }
    else if(Type=="Stock Order Report"){
      //Repository().getStockOrderReport(from,to);
    }
    else if(Type=="Sales Reports"){
      //Repository().getSalesReports(from,to,options[optionsIndx].ValueId.toString());
    }
    else if(Type=="VOS Application Report"){
     // Repository().getVOSApplicationReport(from, to);
    }
    else if(Type=="Stock Level"){
      //Repository().getStockLevelReport(from, to);
    }
    else if(Type=="Support Ticket Report"){
      ref.read(repoProvider.notifier).getSupportTktRpt(from, to);
    }else if(Type=="Genealogy Report"){
      print("payno[paynoIndx].ValueId    ${payno[paynoIndx].ValueId}");
      Map<String,dynamic>params={
        "regid":"${SessionManager.getInt(Constants.PREF_Regid)}",
        "fromdate":from,
        "todate":to,
        "payno" :payno[paynoIndx].ValueId== 0 ?0:payno[paynoIndx].ValueId
      };
      var date="between(${from})and(${to})";
      print(date);
      // Repository().getGenealogyreport(params,payno[paynoIndx].Text=="Select Pay Cycle"?date:payno[paynoIndx].Text);

    }else if(Type=="Archived Report") {
      ref.read(repoProvider).getarchivedreport(from, to);
      // ref.read(repoProvider).getarchivedreport(from, to);



    }else if(Type=="Credit Request Report") {
      ref.read(repoProvider.notifier).getCreditRequestReport(from, to,credReqStatus[optionsIndx].ValueId.toString());

     // Repository().getCreditRequestReport(from, to,credReqStatus[optionsIndx].ValueId.toString());
    }else if(Type=="Privileged Customer Report") {
      //Repository().getMyCustomersRpt(from, to);
    }

  }



  @override
  Widget build(BuildContext context) {
    final dateState = ref.watch(DateFilterProvider);
    return Scaffold(
      appBar: AppBar(
        leading: const LeadingIcon(),
        title: Text(
          Type== "Vzone Credit Request Reports"?"Approve Credit Request":Type,  style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 16, right: 12, top: 10),
        child: Form(
          key: _formKey,
          child: Type == "VZONE Dashboard"
              ?Column(
        children: [
        Padding(
        padding: const EdgeInsets.only(left: 0, right: 2, top: 0),
        child: DateTimeField(
          controller: fromDateController,
          decoration:  InputDecoration(
            suffixIcon: Icon(
              Icons.date_range,
              color: Theme.of(context).primaryColor,
            ),
            labelText: 'From Date',
            labelStyle: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
                fontFamily: 'Nunito'),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
          ),
          format: format,
          onShowPicker: (context, currentValue) {
            return showDatePicker(
              context: context,
              builder: (BuildContext context, Widget? child){
                return Theme(
                  data: ThemeData.light().copyWith(
                    primaryColor:  Constants.hexToColor('#792B90'),
                    colorScheme: ColorScheme.light(primary: Constants.hexToColor('#792B90')),
                  ),
                  child: child!,
                );
              },
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime.now(),
            );
          },
          onChanged: (val) => ref.read(DateFilterProvider.notifier).setFromDate(val.toString()),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 0, right: 2, top: 0),
        child: DateTimeField(
          controller: todateController,
          decoration:  InputDecoration(
            suffixIcon: Icon(
              Icons.date_range,
              color: Theme.of(context).primaryColor,
            ),
            labelText: 'To Date',
            labelStyle: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
                fontFamily: 'Nunito'),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
          ),
          format: format,
          onShowPicker: (context, currentValue) {
            return showDatePicker(
              context:  context,
              builder: (BuildContext context, Widget? child){
                return Theme(
                  data: ThemeData.light().copyWith(
                    primaryColor:  Constants.hexToColor('#792B90'),
                    colorScheme: ColorScheme.light(primary: Constants.hexToColor('#792B90')),
                  ),
                  child: child!,
                );
              },
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime.now(),
            );
          },
          onChanged: (val) => ref.read(DateFilterProvider.notifier).setToDate(val.toString()),
        ),
      ),
      const SizedBox(
        height: 30,
      ),
      Center(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black),
          width: Get.width - 180,
          height: 40,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'SUBMIT',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16),
            ),
            onPressed: () async {
              var now = DateTime.now();
              var formatter = DateFormat('yyyy/MM/dd');
              String formattedDate = formatter.format(now);
              if (fromDateController.text.trim() == '') {
                Logger.showWarningAlert(
                    'Warning', 'Select From Date');
              } else if (todateController.text.trim() == '') {
                Logger.showWarningAlert(
                    'Warning', 'Select To Date');
              } else {
                // Repository().getVZOneDashboardData(
                //     fromDateController.text,
                //     todateController.text);
              }
            },
          ),
          margin: const EdgeInsets.only(top: 10.0),
        ),
      ),

      ],
    )
              :Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              Visibility(
                visible: Type == "Credit Request Report",
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 4.0, vertical: 6.0) ,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 0.0),
                    decoration: BoxDecoration(
                        color: Constants().white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Constants().black)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<StateModel3>(
                        iconEnabledColor: Constants().black,
                        isExpanded: true,
                        hint: Text(
                          credReqStatus[optionsIndx].Text,
                          style: TextStyle(
                              color: Constants().black,
                              fontSize: 15,
                              fontFamily: 'Nunito'),
                        ),
                        items: credReqStatus.map((StateModel3 map) {
                          return DropdownMenuItem<StateModel3>(
                              value: map,
                              child: Text(
                                map.Text,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Constants().black,
                                ),
                              ));
                        }).toList(),
                        onChanged: (text) {
                          // null;
                          setState(() {
                            optionsIndx = credReqStatus.indexOf(text!);

                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Type=="Genealogy Report"
                  ? const Center()
                  : Row(
                children: <Widget>[
                  Expanded(
                    child: _myRadioButton(
                      title: "All",
                      value: 0,
                      onChanged: (v) => ref.read(DateFilterProvider.notifier).changeGroup(v)
                    ),
                  ),
                ],
              ),
              Type=="Genealogy Report"
                  ? const Center()
                  : Row(
                children: <Widget>[
                  Expanded(
                    child: _myRadioButton(
                      title: "On Date",
                      value: 1,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 0, right: 2, top: 0),
                      child: DateTimeField(
                        controller: ondateController,
                        decoration:  InputDecoration(
                          suffixIcon: Icon(
                            Icons.date_range,
                            color: Theme.of(context).primaryColor,
                          ),
                          labelText: 'On Date',
                          labelStyle: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                              fontFamily: 'Nunito'),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                        format: Type == "VOS Application Report"?format2:format,
                        onShowPicker: (context, currentValue) {
                          return showDatePicker(
                            context: context,
                            builder: (BuildContext context, Widget? child){
                              return Theme(
                                data: ThemeData.light().copyWith(
                                  primaryColor:  Constants.hexToColor('#792B90'),
                                  colorScheme: ColorScheme.light(primary: Constants.hexToColor('#792B90')),
                                ),
                                child: child!,
                              );
                            },
                            firstDate: DateTime(1900),
                            initialDate: currentValue ?? DateTime.now(),
                            lastDate: DateTime.now(),
                          );
                        },
                        onChanged: (val) => ref.read(DateFilterProvider.notifier).setOnDate(val.toString()),
                      ),
                    ),
                  ),
                ],
              ),
              Type=="Genealogy Report"?
              Column(
                children: <Widget>[
                  _myRadioButton(
                    title: "Pay Cycle",
                    value: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 4.0, vertical: 6.0) ,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 0.0),
                      decoration: BoxDecoration(
                          color: Constants().white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Constants().black)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<StateModel3>(
                          iconEnabledColor: Constants().black,
                          isExpanded: true,
                          hint: Text(
                            payno[paynoIndx].Text,
                            style: TextStyle(
                                color: Constants().black,
                                fontSize: 15,
                                fontFamily: 'Nunito'),
                          ),
                          items: payno.map((StateModel3 map) {
                            return DropdownMenuItem<StateModel3>(
                                value: map,
                                child: Text(
                                  map.Text,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Constants().black,
                                  ),
                                ));
                          }).toList(),
                          onChanged: (text) {
                            // null;
                            setState(() {
                              paynoIndx = payno.indexOf(text!);

                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              )
                  :Center(),
              Type=="Weekly Sales Report"?const Center():
              Row(
                children: <Widget>[
                  Expanded(
                    child: _myRadioButton(
                      title: "From Date",
                      value: 2,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 0, right: 2, top: 0),
                      child: DateTimeField(
                        controller: fromDateController,
                        decoration:  InputDecoration(
                          suffixIcon: Icon(
                            Icons.date_range,
                            color: Theme.of(context).primaryColor,
                          ),
                          labelText: 'From Date',
                          labelStyle: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                              fontFamily: 'Nunito'),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                        format: Type == "VOS Application Report"?format2:format,
                        onShowPicker: (context, currentValue) {
                          return showDatePicker(
                            context: context,
                            builder: (BuildContext context, Widget? child){
                              return Theme(
                                data: ThemeData.light().copyWith(
                                  primaryColor:  Constants.hexToColor('#792B90'),
                                  colorScheme: ColorScheme.light(primary: Constants.hexToColor('#792B90')),
                                ),
                                child: child!,
                              );
                            },
                            firstDate: DateTime(1900),
                            initialDate: currentValue ?? DateTime.now(),
                            lastDate: DateTime.now(),
                          );
                        },
                        onChanged: (val) => ref.read(DateFilterProvider.notifier).setFromDate(val.toString()),
                      ),
                    ),
                  ),
                ],
              ),
              Type=="Weekly Sales Report"? const Center():
              Row(
                children: <Widget>[
                  Expanded(child: Container()),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 0, right: 2, top: 0),
                      child: DateTimeField(
                        controller: todateController,
                        decoration:  InputDecoration(
                          suffixIcon: Icon(
                            Icons.date_range,
                            color: Theme.of(context).primaryColor,
                          ),
                          labelText: 'To Date',
                          labelStyle: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                              fontFamily: 'Nunito'),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                        format: Type == "VOS Application Report"?format2:format,
                        onShowPicker: (context, currentValue) {
                          return showDatePicker(
                            context:  context,
                            builder: (BuildContext context, Widget? child){
                              return Theme(
                                data: ThemeData.light().copyWith(
                                  primaryColor:  Constants.hexToColor('#792B90'),
                                  colorScheme: ColorScheme.light(primary: Constants.hexToColor('#792B90')),
                                ),
                                child: child!,
                              );
                            },
                            firstDate: DateTime(1900),
                            initialDate: currentValue ?? DateTime.now(),
                            lastDate: DateTime.now(),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Type == "Sales Reports"? Row(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.all(30.0),
                        child: Text('Orderd Status',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 15))),
                    //  RadioMenuButton(
                    //    value: 3,
                    //    groupValue: 3,
                    //    onChanged: (value) {
                    //      setState(() {
                    //        // selectedValue = value! as String?;
                    //      });
                    //    },
                    //      child: Text('Order Status'),
                    // ),

                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Constants().black),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<StateModel3>(
                              iconEnabledColor: Colors.black,
                              isExpanded: true,
                              hint: Text(
                                options[optionsIndx].Text,
                                style: const TextStyle(
                                    color: Colors.black87,
                                    fontSize: 15.0,
                                    fontFamily: 'Nunito'),
                              ),
                              items: options.map((StateModel3 map) {
                                return DropdownMenuItem<StateModel3>(
                                  value: map,
                                  child: Text(
                                    map.Text,
                                    style: const TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.black87,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                if (value != null) {
                                  setState(() {
                                    optionsIndx = options.indexOf(value);
                                  });
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                    ),


                    // RadioMenuButton(
                    //    child: Text('Dispatched'),
                    //
                    //    value: 1,
                    //    groupValue:
                    //    selectedValue,
                    //    onChanged: (value) {
                    //      setState(() {
                    //        selectedValue =
                    //        value! as String?;
                    //      });
                    //    },
                    //  ),
                    //
                    //
                    // RadioMenuButton(
                    //    child: Text('Cancelled'),
                    //
                    //    value: 3,
                    //    groupValue:
                    //    selectedValue,
                    //    onChanged: (value) {
                    //      setState(() {
                    //        selectedValue =
                    //        value! as String?;
                    //      });
                    //    },
                    //  ),
                  ]

              ):const Center()
              ,
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black),
                  width: Get.width - 180,
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'SUBMIT',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16),
                    ),
                    onPressed: () async {
                      var now = DateTime.now();
                      var formatter = DateFormat('yyyy/MM/dd');//rupa
                      var formatter1 = DateFormat('yyyy-MM-dd');//rupa
                      String formattedDate = formatter.format(now);
                      String formattedDate1 = formatter1.format(now);
                      if (_groupValue == 0) {
                        setState(() {
                          todateController.text = '';
                          ondateController.text = '';
                          fromDateController.text = '';
                        });
                        if (Type == 'Wallet Request Report') {
                          _callFinalFilter("01/01/2000", formattedDate,"");
                        }else if(Type=="Business Report"){
                          _callFinalFilter("01/01/2000", formattedDate,"");
                        }else if(Type=="Tabular Genealogy"){

                          _callFinalFilter("2000-01-01", formattedDate1,"");
                        }else if(Type=="Orders Report"){
                          _callFinalFilter("01/01/2000", formattedDate,"");
                        }else if(Type=="Ewallet Summary") {
                          _callFinalFilter("2000/01/01", formattedDate,"");
                        }
                        else if(Type == "Vzone Credit Request Reports"){
                          _callFinalFilter("2000/01/01", formattedDate, "");
                        }
                        else if(Type == "Stock Order Report"){
                          _callFinalFilter("2000/01/01", formattedDate, "");
                        }
                        else if(Type == "Sales Reports"){
                          _callFinalFilter("2000/01/01", formattedDate, "");
                        }
                        else if(Type == "VOS Application Report"){
                          _callFinalFilter("2000/01/01", formattedDate, "");
                        }
                        else if(Type == "Stock Level"){
                          _callFinalFilter("2000/01/01", formattedDate, "");
                        }
                        else if(Type=="Support Ticket Report") {
                          _callFinalFilter("01/01/2000", formattedDate,"");
                        }else if(Type=="Archived Report") {
                          _callFinalFilter("01/01/2000", formattedDate,"");
                        }else if(Type=="Credit Request Report") {
                          _callFinalFilter("01/01/2000", formattedDate,"");
                        }else if(Type=="Privileged Customer Report") {
                          _callFinalFilter("01/01/2000", formattedDate,"");
                        }
                      } else if (_groupValue == 1) {
                        setState(() {
                          todateController.text = '';
                          fromDateController.text = '';
                        });
                        if(Type=="Genealogy Report"){
                          if(payno[paynoIndx].Text=="Select Pay Cycle"){
                            Logger.showWarningAlert('Warning', 'Select Pay Cycle');
                          }else{
                            _callFinalFilter("", "","");
                          }

                        }else{
                          if (ondateController.text.trim() == '') {
                            Logger.showWarningAlert('Warning', 'Select On Date');
                          }
                          else if (Type == 'Wallet Request Report') {
                            _callFinalFilter(ondateController.text, ondateController.text,"");
                          }
                          else if(Type=="Ewallet Summary") {
                            _callFinalFilter(ondateController.text,ondateController.text,"");
                          }
                          else if(Type == "Vzone Credit Request Reports"){
                            _callFinalFilter(ondateController.text,ondateController.text,"");
                          }
                          else if(Type == "Stock Order Report"){
                            _callFinalFilter(ondateController.text, ondateController.text, "");
                          }
                          else if(Type == "Sales Reports"){
                            _callFinalFilter(ondateController.text, ondateController.text, "");
                          }
                          else if(Type == "Stock Level"){
                            _callFinalFilter(ondateController.text, ondateController.text, "");
                          }
                          else if(Type=="Business Report"){
                            _callFinalFilter(ondateController.text, ondateController.text,"");
                          }else if(Type=="Tabular Genealogy"){
                            _callFinalFilter(ondateController.text, ondateController.text,"");
                          }else if(Type=="Orders Report"){
                            _callFinalFilter(ondateController.text, ondateController.text,"");
                          }
                          else if(Type=="VOS Application Report"){
                            _callFinalFilter(ondateController.text, ondateController.text, "");
                          }
                          else if(Type=="Support Ticket Report"){
                            _callFinalFilter(ondateController.text, ondateController.text,"");
                          } else if(Type=="Archived Report"){
                            _callFinalFilter(ondateController.text, ondateController.text,"");
                          } else if(Type=="Credit Request Report"){
                            _callFinalFilter(ondateController.text, ondateController.text,"");
                          } else if(Type=="Privileged Customer Report"){
                            _callFinalFilter(ondateController.text, ondateController.text,"");
                          }
                        }

                      }
                      else if (_groupValue == 2) {
                        setState(() {
                          ondateController.text = '';
                        });
                        if (fromDateController.text.trim() == '') {
                          Logger.showWarningAlert('Warning', 'Select From Date');
                        } else if (todateController.text.trim() == '') {
                          Logger.showWarningAlert('Warning', 'Select To Date');
                        } else if(fromDateController.text.trim()==formattedDate){
                          Logger.showWarningAlert('Warning', 'Invalid Date Format ');
                        }
                        else if(Type=="Ewallet Summary") {
                          _callFinalFilter(fromDateController.text, todateController.text,"");
                        }
                        else if(Type=="Vzone Credit Request Reports"){
                          _callFinalFilter(fromDateController.text,todateController.text,"");
                        }
                        else if(Type=="Stock Order Report"){
                          _callFinalFilter(fromDateController.text, todateController.text, "");
                        }
                        else if(Type=="Sales Reports"){
                          _callFinalFilter(fromDateController.text, todateController.text, "");
                        }
                        else if(Type=="VOS Application Report"){
                          _callFinalFilter(fromDateController.text, todateController.text, "");
                        }
                        else if(Type=="Stock Level"){
                          _callFinalFilter(fromDateController.text, todateController.text, "");
                        }
                        else if (Type == 'Wallet Request Report') {
                          _callFinalFilter(fromDateController.text, todateController.text,"");
                        }else if(Type=="Business Report"){
                          _callFinalFilter(fromDateController.text, todateController.text,"");
                        }else if(Type=="Tabular Genealogy"){
                          _callFinalFilter(fromDateController.text, todateController.text,"");
                        }else if(Type=="Orders Report"){
                          _callFinalFilter(fromDateController.text, todateController.text,"");
                        }else if(Type=="Support Ticket Report"){
                          _callFinalFilter(fromDateController.text, todateController.text,"");
                        }else if(Type=="Genealogy Report"){
                          _callFinalFilter(fromDateController.text, todateController.text,"");
                        } else if(Type=="Archived Report"){
                          _callFinalFilter(fromDateController.text, todateController.text,"");
                        } else if(Type=="Credit Request Report"){
                          _callFinalFilter(fromDateController.text, todateController.text,"");
                        } else if(Type=="Privileged Customer Report"){
                          _callFinalFilter(fromDateController.text, todateController.text,"");
                        }
                      }

                      else {
                        Logger.showWarningAlert('Warning', 'Select Type');
                      }
                    },
                  ),
                  margin: const EdgeInsets.only(top: 10.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
