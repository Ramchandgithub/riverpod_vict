import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../Controllers/credit_notifier.dart';
import '../../Utils/constants.dart';
import '../../Utils/logger.dart';
import '../../Utils/network_call.dart';
import '../../Utils/session_manager.dart';
import '../../Utils/statemodel.dart';
import '../../Utils/validator.dart';
import '../../widgets/image_picker.dart';
import '../../widgets/leading_icon.dart';



class CreditRequest extends ConsumerStatefulWidget {
  static const String routeName = '/CreditRequest';
  const CreditRequest({Key? key}) : super(key: key);

  @override
  _ConsumerCreditRequestState createState() => _ConsumerCreditRequestState();
}

class _ConsumerCreditRequestState extends ConsumerState<CreditRequest> {
  final _formKey = GlobalKey<FormState>();
  bool isImagepicked = false;

  late TextEditingController amountCtrl, messageCtrl, transactionidCtrl, qrTransactionidCtrl;
  DateFormat format = DateFormat("MM/dd/yyyy");
  late DateTime pikeddateg;
  late String dateController;
  late bool isLoad, isvisible,isupivisible=false;
  late File imagefile;
  // String pickedImage = '';
  late String totalpayeeamount = '';
  String upiID="vclpvtltd@sbi";
  String url = 'upi://pay?pa=vclpvtltd@sbi&pn=VICTOUS LIFE SCIENCE PRIVATE LIMITED';


  @override
  void initState() {
    super.initState();
    amountCtrl = TextEditingController();
    messageCtrl = TextEditingController();
    dateController = '';
    transactionidCtrl = TextEditingController();
    qrTransactionidCtrl = TextEditingController();

    isvisible = false;
    // callGetWalletBal();
  }

  void _presentDatePicker(String datakey) {
    showDatePicker(
      context: context,
      builder: (context, child){
        return Theme(
          data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                  primary: Theme.of(context).primaryColor,// headers background color
                  onPrimary: Colors.white, // header text color
                  onSurface: Colors.black // body text color

              )
          ), child: child!,
        );
      },
      firstDate: DateTime(1900),
      initialDate: DateTime.now(),
      lastDate: DateTime.now(),

    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        pikeddateg = pickedDate;
        if (datakey == 'Deposit Date'|| datakey == 'Transaction Date') {
          dateController = DateFormat.yMd().format(pikeddateg);
        }
        //_profileData.nomineeDOB = DateFormat.yMd().format(pickedDate);
      });
    });
  }
  Widget datePicker(String datakey) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black54),
          borderRadius: BorderRadius.circular(10),
          ),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      height: 60,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              dateController,
              style: const TextStyle(color: Colors.black),
            ),
          ),
          IconButton(
            onPressed: () => _presentDatePicker(datakey), icon: Icon(
            Icons.date_range,
            color: Theme.of(context).primaryColor,
          ),
          ),
        ],
      ),
    );
  }


  onResult(Uint8List res) {

  }

  _validate() {

  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(creditRequestProvider);
    final notifier = ref.read(creditRequestProvider.notifier);

    return Scaffold(
        appBar: AppBar(
          title: const  Text('Credit Request', style: TextStyle(color: Colors.white, fontSize: 16),),
          leading: const  LeadingIcon(),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Text(
                    'Balance Amount : \u{20B9} ${state.balanceAmnt}',
                    // 'Balance Amount : \u{20B9} ${walletBalance.toStringAsFixed(0)}',
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 20),
                    child: TextFormField(
                      controller: amountCtrl,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp(r'\s')),
                        FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                        LengthLimitingTextInputFormatter(6),
                      ],
                      validator: (val) => Validator.amountValidator(val!),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        hintText: 'Request Amount ',
                        labelText: 'Request Amount *',
                        labelStyle: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      '      Mode Of Payment *',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),


                  state.modes.isEmpty
                  ? const CircularProgressIndicator()
                  : Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black38,
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        value: state.modes[state.modeOfPymntIndex],
                        items: state.modes.map((e)=>DropdownMenuItem(value:e,child:Text(e.Text))).toList(),
                        onChanged: (v)=> notifier.setPaymentMode(state.modes.indexOf(v!)),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10,),

                  if(state.modes[state.modeOfPymntIndex].Text == "Bank Transfer")

                    Column(
                      children: [
                        const SizedBox(
                          height: 4,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            '      Company Banks',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),

                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 10),

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.black38,
                            ),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              value: state.banks[state.bankIndex],
                              items: state.banks.map((e)=>DropdownMenuItem(value:e,child:Text(e.Text))).toList(),
                              onChanged: (v)=> notifier.setPaymentMode(state.banks.indexOf(v!)),
                            ),
                          ),
                        ),

                      ],
                    ),


                  SizedBox(
                    width: Get.width/3,
                    child: ElevatedButton(
                        onPressed: () => _validate(),
                        child: Text(
                          'PREVIEW',style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),

                          ),
                        )
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
