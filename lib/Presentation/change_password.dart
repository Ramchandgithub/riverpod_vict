

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:victous/Widgets/sub_child_item.dart';
import '../../Utils/constants.dart';
import '../../Utils/logger.dart';
import '../../Utils/session_manager.dart';
import '../../Utils/validator.dart';
import '../../services/repository.dart';
import '../../widgets/leading_icon.dart';


class ChangePasswordView extends ConsumerStatefulWidget {
  static const String routeName = '/ChangePasswordView';

  const ChangePasswordView({Key? key}) : super(key: key);

  @override
  ConsumerState<ChangePasswordView> createState() => _ConsumerChangePasswordViewState();

}

class _ConsumerChangePasswordViewState extends ConsumerState<ChangePasswordView> {
  final _passwordformKey = GlobalKey<FormState>();
  late bool passwordVisible, oldpasswordVisible, newpasswordvisible;
  TextEditingController oldCtrl = TextEditingController();
  TextEditingController newpswCtrl = TextEditingController();
  TextEditingController repwdCtrl = TextEditingController();
  bool isShow=true,isCustomer=false;
  var args;

  int indexPage = 0;

  @override
  void initState() {

    super.initState();
    passwordVisible = true;
    oldpasswordVisible = true;
    newpasswordvisible = true;
    Future.delayed(Duration.zero).then((value) {
      var data=Get.arguments;
      if(data!=null){
        args=data['args'];
        isCustomer=data['customer'];
        isShow=false;
        setState(() {

        });

      }

    });
  }

  _onSubmitHandller() async {
    if (_passwordformKey.currentState!.validate()) {
      String old=isShow
          ? oldCtrl.text
          : SessionManager.getString(Constants.PREF_Password);
      if(old!=newpswCtrl.text){
        if (newpswCtrl.text == repwdCtrl.text) {
          SessionManager.getInt(Constants.PREF_IsCustomer) == 0//associate
              ? ref.read(repoProvider.notifier).updatePassword(isShow?oldCtrl.text:SessionManager.getString(Constants.PREF_Password), newpswCtrl.text)
              : ref.read(repoProvider.notifier).updateCustomerPassword(isShow?oldCtrl.text:SessionManager.getString(Constants.PREF_Password), newpswCtrl.text);
              // ?Repository().updatePassword(isShow?oldCtrl.text:SessionManager.getString(Constants.PREF_Password), newpswCtrl.text )
              // :Repository().updateCustomerPassword(isShow?oldCtrl.text:SessionManager.getString(Constants.PREF_Password), newpswCtrl.text );

        }else{
          Logger.showWarningAlert("Alert",'New Password and Confirm Password Must Be Same');
        }}else{
        Logger.showWarningAlert("Alert",'Old Password and New Password Must Be Different');
      }
    }
  }
  onBack(){
    // isShow?Get.back():Repository().onback();
  }
  @override
  Widget build(BuildContext context) {

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    });

    return WillPopScope(
      onWillPop: ()=>onBack(),
      child: Scaffold(
        appBar: AppBar(
          leading: LeadingIcon(),
          title:  const Text('Change Password', style: TextStyle(color: Colors.white, fontSize: 16),),
        ),
        body: SingleChildScrollView(
          //padding: EdgeInsets.only(top: Get.width/5),
          child: Form(
            key: _passwordformKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 160,
                    child: Image.asset(Constants.ImagePath + 'logo.png'),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [

                        const SizedBox(height: 10,),
                        SubChildItem("  Associate ID", '${SessionManager.getString(Constants.PREF_UserId)}', false),
                        SubChildItem("  Associate Name", '${SessionManager.getString(Constants.PREF_UserName)}', false),
                        const SizedBox(height: 10,),

                        isShow? Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 20),
                          child:  TextFormField(
                            style: TextStyle(color: Constants().black),
                            controller: oldCtrl,
                            obscureText: oldpasswordVisible,
                            keyboardType: TextInputType.text,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(20),
                              FilteringTextInputFormatter.deny(RegExp(r'\s')),
                            ],
                            validator: (val) => Validator.inputValidate(val!,"Existing Password"),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:  BorderSide(color: Constants().black),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:  BorderSide(
                                  color: Constants().black,
                                ),),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:  BorderSide(
                                  color:Constants().black,
                                ),),
                              labelText: 'Existing Password',
                              labelStyle:  TextStyle(
                                  color:  Constants().black
                              ),
                              suffixIcon: IconButton(
                                icon: oldpasswordVisible
                                    ?  Icon(Icons.remove_red_eye,color: Constants().black)
                                    :  Icon(Icons.visibility_off_outlined,color: Constants().black),
                                onPressed: () {
                                  setState(() {
                                    oldpasswordVisible = !oldpasswordVisible;
                                  });
                                },
                              ),
                            ),
                          ),
                        ):Center(),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 20),
                          child: TextFormField(
                            style: TextStyle(color: Constants().black),
                            controller: newpswCtrl,
                            obscureText: newpasswordvisible,
                            keyboardType: TextInputType.text,
                            inputFormatters: [
                              // FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z][^\s]{0,19}$')),
                              // FilteringTextInputFormatter.allow(RegExp(r'[@$!%*?&a-zA-Z0-9]')),
                              FilteringTextInputFormatter.deny(RegExp(r'\s')),
                              LengthLimitingTextInputFormatter(20),
                            ],
                            validator: (val) => Validator.passwordValidator(val!),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:  BorderSide(color: Constants().black),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:  BorderSide(
                                  color: Constants().black,
                                ),),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:  BorderSide(
                                  color: Constants().black,
                                ),),
                              labelText: 'New Password',
                              labelStyle:  TextStyle(
                                  color:  Constants().black
                              ),
                              suffixIcon: IconButton(
                                icon: newpasswordvisible
                                    ?  Icon(Icons.remove_red_eye,color: Constants().black)
                                    :  Icon(Icons.visibility_off_outlined,color:Constants().black),
                                onPressed: () {
                                  setState(() {
                                    newpasswordvisible = !newpasswordvisible;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 20),
                          child:   TextFormField(
                            style: TextStyle(color: Constants().black),
                            controller: repwdCtrl,
                            obscureText: passwordVisible,
                            keyboardType: TextInputType.text,
                            inputFormatters: [
                              // FilteringTextInputFormatter.allow(RegExp('[0-9,A-Z]')),
                              // FilteringTextInputFormatter.allow(RegExp(r'[@$!%*?&a-zA-Z0-9]'))
                              FilteringTextInputFormatter.deny(RegExp(r'\s')),
                              LengthLimitingTextInputFormatter(20),
                            ],
                            validator: (val) => Validator.passwordValidator(val!),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:  BorderSide(color:Constants().black),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:  BorderSide(
                                  color: Constants().black,
                                ),),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:  BorderSide(
                                  color:Constants().black,
                                ),),
                              labelText: 'Confirm New Password',
                              labelStyle:  TextStyle(
                                  color:  Constants().black
                              ),
                              suffixIcon: IconButton(
                                icon: passwordVisible
                                    ?  Icon(Icons.remove_red_eye,color: Constants().black)
                                    :  Icon(Icons.visibility_off_outlined,color: Constants().black),
                                onPressed: () {
                                  setState(() {
                                    passwordVisible = !passwordVisible;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Theme.of(context).primaryColor),
                            width: Get.width - 250,
                            height: 40,
                            child: TextButton(
                              onPressed: () => _onSubmitHandller(),
                              child: const Text(
                                'SUBMIT',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: RichText(
                              text: const TextSpan(
                                  text: "Note : " , style: TextStyle(color: Colors.red),
                                  children: [
                                    TextSpan(
                                        text: ' Password Should Contain', style: TextStyle(color: Colors.black)
                                    ),
                                    TextSpan(
                                        text: '\nMinimum 6 Characters,', style: TextStyle(color: Colors.black)
                                    ),
                                    TextSpan(
                                        text: '\nMaximum 20 Characters,', style: TextStyle(color: Colors.black)
                                    ),
                                    TextSpan(
                                        text: '\nAtleast one Special Character.', style: TextStyle(color: Colors.black)
                                    )
                                  ]
                              ),

                            ),
                          ),
                        ),

                      ],
                    ),),

                ],
              ),
            ),
          ),
        ),

      ),
    );
  }
}
