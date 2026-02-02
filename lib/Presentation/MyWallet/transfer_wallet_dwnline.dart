


import 'dart:math';

import 'package:dart_ipify/dart_ipify.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:victous/Utils/logger.dart';
import 'package:victous/Utils/network_call.dart';
import 'package:victous/Utils/session_manager.dart';
import 'package:victous/Widgets/sub_child_item.dart';
import 'package:victous/services/repository.dart';

import '../../Utils/constants.dart';
import '../../Utils/local_package_info.dart';
import '../../widgets/leading_icon.dart';

class TransferToDwnline extends ConsumerStatefulWidget {
  const TransferToDwnline({Key? key}) : super(key: key);
  static const String routeName = '/TransferToDwnline';

  @override
  ConsumerState<TransferToDwnline> createState() => _ConsumerTransferToDwnlineState();
}

class _ConsumerTransferToDwnlineState extends ConsumerState<TransferToDwnline> {

  TextEditingController rmrksCntrl = TextEditingController();
  TextEditingController amntCntrl = TextEditingController();
  TextEditingController idCntrl = TextEditingController();
  TextEditingController OtpCntrl = TextEditingController();
  bool isValidDwnId = false;
  List result = [];
  String dwnRegid = '',respOTP = "";
  double walletBalance = 0.0;
  bool isLoading = true,isOtpSend = false,isOtpVerified = false;


  @override
  void initState(){
    super.initState();
    callGetWalletBal();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transfer Wallet To Downline Member", style: TextStyle(color: Colors.white, fontSize: 16),),
        leading: LeadingIcon(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
              children:[
                Visibility(
                  visible: isValidDwnId == false,
                  child: Card(
                    elevation: 2,
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20,),
                          TextFormField(
                            controller: idCntrl,
                            keyboardType: TextInputType.text,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp(r'[a-zA-z0-9]')),
                              FilteringTextInputFormatter.deny(RegExp(r'\s'))
                            ],
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(color: Theme.of(context).primaryColor)
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(color: Theme.of(context).primaryColor)
                                ),
                                hintText: 'Enter Downline ID',
                                labelText: 'Downline ID',
                                labelStyle: TextStyle(color: Colors.black54)
                            ),

                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).primaryColor, foregroundColor: Colors.white, textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
                              onPressed: (){
                                if(idCntrl.text == ''){
                                  Logger.showWarningAlert("Alert","Please Enter Valid Donwline ID");
                                }else if(idCntrl.text == SessionManager.getString(Constants.PREF_UserId)){
                                  Logger.showWarningAlert("Alert","Please Enter Your Downline ID");
                                }else{
                                  chkDwnline(idCntrl.text);
                                }
                              },
                              child:const Text('SUBMIT'))
                        ],

                      ),
                    ),
                  ),
                ),

                result.isEmpty
                    ? const Center()
                    : Visibility(
                  visible: isValidDwnId,
                  child: Column(
                    children: [
                      SubChildItem("Available Balance", '\u{20B9} ${walletBalance}'   ?? '0.0', false),
                      // SubChildItem("Available Balance", '\u{20B9} ${double.parse(result[0]['balance'].toString()).toStringAsFixed(1)}'   ?? '0.0', false),
                      SubChildItem("Team  Associate ID", result[0]['userID'] ?? '', false),
                      // SubChildItem("Team Distributor ID", result[0]['userID'] ?? '', false),
                      SubChildItem("Name", result[0]['name'] ?? '', false),
                      SubChildItem("City", result[0]['city'] ?? '', false),
                      SubChildItem("Mobile", result[0]['mobile'] ?? '', false),

                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Total Amount', style: TextStyle(fontWeight: FontWeight.bold),)),
                      const  SizedBox(height: 10,),

                      //Edited by rupa on 22/04/2025
                      Visibility(
                        visible: !isOtpVerified,   //Added by rupa on 22/04/2025
                        child: !isOtpSend
                            ?Column(
                            children: [
                              TextFormField(
                                controller: amntCntrl,
                                keyboardType: TextInputType.numberWithOptions(decimal: true),
                                // maxLength: 6,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                  FilteringTextInputFormatter.deny(RegExp(r'\s')),
                                  LengthLimitingTextInputFormatter(6)
                                ],
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                                    border: OutlineInputBorder(
                                      //borderRadius: BorderRadius.circular(20),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      //borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide(color: Theme.of(context).primaryColor)
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      // borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide(color: Theme.of(context).primaryColor)
                                    ),
                                    hintText: 'Amount to Adjust',
                                    labelText: 'Total Amount',
                                    labelStyle: TextStyle(color: Colors.black54)
                                ),
                              ),
                              const SizedBox(height: 20,),
                              TextFormField(
                                controller: rmrksCntrl,
                                keyboardType: TextInputType.text,
                                inputFormatters: [
                                  // FilteringTextInputFormatter.deny(RegExp(r'\s'))
                                ],
                                maxLines: 3,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                                  border: OutlineInputBorder(
                                    //borderRadius: BorderRadius.circular(20),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    // borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(color: Theme.of(context).primaryColor)
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    // borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(color: Theme.of(context).primaryColor)
                                  ),
                                  hintText: 'Remarks',
                                  labelText: 'Remarks ',
                                  labelStyle: TextStyle(color: Colors.black54),
                                ),
                              ),
                              const SizedBox(height: 30,),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).primaryColor, foregroundColor: Colors.white),
                                  onPressed: (){
                                    if(amntCntrl.text == '' || int.parse(amntCntrl.text) == 0){
                                      Logger.showWarningAlert("Alert", 'Please Enter Amount other than zero');
                                    }
                                    else if(double.parse(amntCntrl.text) > walletBalance){
                                      Logger.showWarningAlert("Alert", 'Your Request Amount is higher than Your Wallet Amount');
                                    }

                                    else if(rmrksCntrl.text == ''){
                                      Logger.showWarningAlert("Alert", 'Please Enter Remarks');
                                    }else{
                                      generateOtp();
                                      //Repository().adjustEwallet(dwnRegid, amntCntrl.text, rmrksCntrl.text );
                                    }
                                  },
                                  child: const Text("Continue"))])
                            :Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: TextFormField(
                                controller: OtpCntrl,
                                keyboardType: TextInputType.number,
                                textCapitalization: TextCapitalization.characters,
                                inputFormatters: [
                                  FilteringTextInputFormatter.deny(RegExp(r'\s')),
                                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                  LengthLimitingTextInputFormatter(6)
                                ],
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Theme.of(context).primaryColor),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor),
                                      borderRadius: BorderRadius.circular(10)),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Theme.of(context).primaryColor),
                                  ),
                                  labelText: 'Enter isOtpSend',
                                  labelStyle: TextStyle(color: Colors.black),
                                  hintText: 'Enter isOtpSend',
                                ),
                                onChanged: (val){

                                },
                              ),
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Theme.of(context).primaryColor
                                ),
                                onPressed: (){
                                  if(OtpCntrl.text.trim() == ''){
                                    Logger.showWarningAlert("Alert","Please Enter Otp");
                                  } else if(OtpCntrl.text.trim() != respOTP){
                                    Logger.showWarningAlert("Alert","Please Enter Valid Otp");
                                  } else{
                                    setState(() {
                                      isOtpVerified = true;
                                    });
                                  }
                                },
                                child: Text("Verify Otp", style: TextStyle(color: Colors.white),)),
                          ],
                        ),
                      ),
                      Visibility(   //Added by rupa on 22/04/2025

                          visible: isOtpVerified,
                          child:  ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Theme.of(context).primaryColor
                              ),
                              onPressed: (){
                                ref.read(repoProvider.notifier).adjustEwallet(dwnRegid, amntCntrl.text, rmrksCntrl.text );
                                //Repository().adjustEwallet(dwnRegid, amntCntrl.text, rmrksCntrl.text );

                              },
                              child: Text("Submit", style: TextStyle(color: Colors.white),)))

                    ],
                  ),
                ),
              ]
          ),
        ),
      ),
    );
  }


  callGetWalletBal() {
    Map<String, dynamic> param = {
      'action': 'Member',
      'idnnumber': "${SessionManager.getInt(Constants.PREF_Regid)}",
      'spnsridno': "",
    };
    NetworkCall().onCallServer(parameters: param, endPoint: Constants.api_EwalletBalance).then((value) async {
      List data = NetworkCall.getParse(value)as List;
      setState(() {
        walletBalance = double.parse(data[0]['balance'].toString());
      });
    });
  }

  chkDwnline(String idnumber) {
    Map<String,dynamic> params = {
      "action":  "DownlineMembers",
      "idnnumber": idnumber,
      "spnsridno": SessionManager.getString(Constants.PREF_UserId)
    };
    NetworkCall().onCallServer(endPoint: Constants.api_CheckUserID, parameters: params).then((value){
      var data = NetworkCall.getParse(value);
      Logger.logger("Data::::$data");
      if(data.length > 0){
        if(data[0]['result'].toString().toLowerCase().contains('invalid')){
          Logger.showWarningAlert("Alert", data[0]['result']);
          setState(() {
            idCntrl.clear();
            isValidDwnId = false;

          });
        } else{
          getBalance(data[0]['regid']);
          setState(() {
            dwnRegid = data[0]['regid'].toString();
            // isValidDwnId = true;
          });
        }
      }

    });
  }

  getBalance(data) {
    Map<String,dynamic> params = {
      "action" : "Member",
      "Id": data.toString()
    };
    NetworkCall().onCallServer(endPoint: Constants.api_AdjustEwalletDetailes, parameters: params).then((value){
      result = NetworkCall.getParse(value);
      Logger.logger("Data:::$data");
      isValidDwnId = true;
      setState(() {

      });
    });
  }

  //Added by rupa on 22/04/2025
  generateOtp() async {
    Random random = Random();
    int ranint = random.nextInt(1000000) + 10;
    String randomisOtp = ranint.toString().padLeft(6, '0');
    String SessionId;
    // final _ipAddress = await Ipify.ipv4();
    final _ipAddress = await Ipify.ipv64();
    SessionId = DateTime.now().millisecondsSinceEpoch.toString() + ranint.toString() + '_M' + LocalPackageInfo.getPlatformType();

    Map<String,dynamic>params = {
      "action" :"EwalletisOtpSend",
      "idno" :SessionManager.getString(Constants.PREF_UserId),
      "otp" :randomisOtp,//6 digit Random No
      "RegID":SessionManager.getInt(Constants.PREF_Regid),
      "Email":"",
      "SessionID":SessionId,
      "IPAddress":_ipAddress,
    };
    NetworkCall().onCallServer(endPoint: Constants.api_SendEmailOTP, parameters: params).then((value){
      var data = NetworkCall.getParse(value);
      if(data != null && data["message"].toString().toUpperCase().contains("SUCC")){
        setState(() {
          isOtpSend = true;
          respOTP = randomisOtp;
        });
      }else{
        Logger.showWarningAlert("Alert","Something went Wrong");
      }



    });
  }
}
