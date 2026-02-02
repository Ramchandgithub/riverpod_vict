import 'dart:core';

class Validator {

  static String? passwordValidator(String val) {
   //RegExp reg = RegExp(r'[@$!%*?&a-zA-Z0-9]');
   // RegExp reg = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$');
   //RegExp reg = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d@$!%*?&]{6,}$');


     RegExp reg = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$');
    if(val.trim().isEmpty) {
      return 'Please Enter Valid Password';
    // }
    } else if(val.trim().length<6 || val.trim().length>16) {
      return 'Please Enter Valid Password';
    // }
    } else if(!reg.hasMatch(val)) {
       return ' Please Enter Valid Password ';
     // return 'Please Enter Valid Password';
    }
    else {
      return null;
    }
  }
  static String? confirmpasswordValidator(String val) {
    // RegExp reg = RegExp(r'[@$!%*?&a-zA-Z0-9]');
    // RegExp reg = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$');
  //  RegExp reg = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d@$!%*?&]{6,}$');
    RegExp reg = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if(val.trim().isEmpty) {
      return 'Please Enter Confirm Password';
      // }
    } else if(val.trim().length<6 || val.trim().length>16) {
      return 'Please Enter Valid Confirm Password';
      // }
    } else if(!reg.hasMatch(val)) {
      return 'Please Enter Valid Confirm Password';
    }
    else {
      return null;
    }
  }


  static String? passwordregValidator(String val) {
    RegExp reg = RegExp(r'([A-Za-z][0-9])');
    if(val.isEmpty){
      return 'Please Enter Password';
    } else if(val.length<4 || val.length>15) {
      return 'Password Should be Between 6 to 15 Characters';
      // } else if(!reg.hasMatch(val)) {
      //  return 'Password Should Contain Characters And Numbers';
    }else {
      return null;
    }
  }
  static String? TransactionId(String amount) {
    if(amount.isEmpty || amount == ""){
      return 'Please Enter UTR NO/Transaction ID';
    } else if(amount.length < 1) {
      return 'Please Enter Valid Input';
    } else {
      return null;
    }
  }
  static String? Addressvalidate( String val) {
    if(val.isEmpty){
      return 'Please Enter  Address';
    } else if(val.length < 1) {
      return 'Please Enter  Address';
    } else {
      return null;
    }
  }

  static String? VoterIdValidate(String idNmbr,String fileName){
    //print('In voter validator');
    RegExp regex =RegExp(r'([A-Z]{3}[0-9]{7})');
    if(idNmbr.isEmpty || idNmbr == ''){
      //print('In voter validator empty');
      return 'Please Enter $fileName';
    } else if(idNmbr.length != 10){
      //print('In voter validator min length');
      return 'Please Enter Valid $fileName';
    } else if(!regex.hasMatch(idNmbr)){
      //print('In voter validator regex');
      return 'Please Enter Valid $fileName';
    }
    else {
      return null;
    }
  }

  static String? DrivingLcValidator(String idNmbr,String fileName){
    RegExp regex =RegExp(r'(([A-Z]{2}[0-9]{2})( )|([A-Z]{2}-[0-9]{2}))((19|20)[0-9][0-9])[0-9]{7}');
    if(idNmbr.isEmpty || idNmbr == ''){
      return 'Please Enter $fileName';
    } else if(idNmbr.length != 10){
      return 'Please Enter Valid $fileName';
    } else if(!regex.hasMatch(idNmbr)){
      return 'Please Enter Valid $fileName';
    }
    else {
      return null;
    }
  }

  static String? aadharValidate(String no) {
    if(no.isEmpty || no == ""){
      return 'Please Enter Aadhar No';
    } else if(no.length < 12) {
      return 'Please Enter Valid Aadhar No';
    } else {
      return null;
    }
  }


  static String? inputValidateBank(String textname,String type) {
    if(textname.isEmpty || textname == ""){
      return 'Please Enter ${type}';
    } else if(textname.length < 1) {
      return 'Please Enter Valid ${type}';
    }else if(textname.length < 8){
      return 'Please Enter min 8 digits ${type}';
    }

    else {
      return null;
    }
  }
  static String? idValidator(String val) {
    RegExp reg = RegExp(r'([0-9a-zA-Z])');
    if(val.trim().isEmpty){
      return 'Please Enter User ID';
    } else if(val.trim().length<5) {
      return 'Please Enter Valid User ID';
    } else if(!reg.hasMatch(val.trim())) {
      return 'Please Enter Valid User ID';
    }else {
      return null;
    }
  }
  static String? TRANSValidator(String val) {
    RegExp reg = RegExp(r'([0-9a-zA-Z])');
    if(val.isEmpty){
      return 'Please Enter Transaction password';
    } else if(val.length<5) {
      return 'Please Enter Valid Transaction password';
    } else if(!reg.hasMatch(val)) {
      return 'Please Enter Valid Transaction password';
    }else {
      return null;
    }
  }

  static String? sponsorValidator(String val) {
    RegExp reg = RegExp(r'([0-9a-zA-Z])');
    if(val.isEmpty){
      return 'Please Enter Sponsor ID';
    } else if(val.length<= 0) {
      return 'Please Enter Valid Sponsor ID';
    } else if(!reg.hasMatch(val)) {
      return 'Please Enter Valid Sponsor ID';
    }else {
      return null;
    }
  }

  static String? ReferralValidator(String val) {
    RegExp reg = RegExp(r'([0-9a-zA-Z])');
    if(val.isEmpty){
      return 'Please Enter Referral Id';
    } else if(val.length <=0) {
      return 'Please Enter Valid Referral Id';
    } else if(!reg.hasMatch(val)) {
      return 'Please Enter Valid Referral Id';
    }else {
      return null;
    }
  }

  static bool dobValidate(DateTime date,DateTime now) {
    if (((now.difference(date).inDays) / 365.floor()) > 18) {
      return true;
    } else {
      return false;
    }
  }

  static String? pinCodeValidator(String pin) {
    if (pin.length == 6) {
      return null;
    } else {
      return "Please Enter Valid Pincode";
    }
  }

  static String? ageValidator(String age) {
    if(age.isEmpty){
      return 'Please Enter Nominee Age';
    } if(int.parse(age) < 1) {
      return 'Please Enter Valid Nominee Age';
    }else {
      return null;
    }
    if (age.length == 2) {
      return null;
    } else {
      return "Please Enter Nominee Age";
    }
  }

  static String? userValidator(String user) {
    RegExp reg = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{5,16}$');
    if(reg.hasMatch(user)) {
      return null;
    } else {
      return 'Please Enter Valid User Id';
    }
  }

  static String? panCardValidator(String val) {
    RegExp reg = RegExp(r'([A-Za-z]{5}[0-9]{4}[A-Za-z]{1})');
    if(val.isEmpty){
      return 'Please Enter Valid PAN';
    } if(!reg.hasMatch(val)) {
      return 'Please Enter Valid PAN';
    }else {
      return null;
    }
  }

  static String? mobileValidator(String mobile) {
    RegExp reg = RegExp(r'(^[9876]\d{9}$)');
    if (reg.hasMatch(mobile)) {
      return null;
    } else {
      return 'Please Enter Valid Mobile Number';
    }
  }

  static String? emailValidator(String email) {
    RegExp reg = RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (reg.hasMatch(email)) {
      return null;
    } else {
      return "Please Enter Valid Email Id";
    }
  }

  static String? gstValidator(String gst) {
    RegExp reg = RegExp(r'^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}$');
    if (reg.hasMatch(gst)) {
      return null;
    } else {
      return "Please Enter Valid GST NO";
    }
  }

  static String? ifscValidator(String ifsc) {
    RegExp reg = RegExp(r'^[A-Z]{4}0[A-Z0-9]{6}$');
    if(reg.hasMatch(ifsc)) {
      return null;
    } else {
      return 'Please Enter Valid IFSC Code';
    }
  }

  static String? amountValidator(String amount) {
    if(amount.isEmpty){
      return 'Please Enter Amount';
    } if(int.parse(amount) < 1) {
      return 'Minimum Amount Should be Above 1';
    }else {
      return null;
    }
  }
  static String? amountValiidator2(String amount) {
    if(amount.isEmpty){
      return 'Please Enter Amount';
    } if(int.parse(amount) < 1000) {
      return 'Minimum Amount Should be Above 1000';
    }else {
      return null;
    }
  }

  static String? withdrawAmountValidator(String amount) {
    if(amount.isEmpty){
      return 'Please Enter Amount';
    } if(int.parse(amount) < 100) {
      return 'Minimum Amount Should be Above 100.';
    } else if(int.parse(amount) > 5000) {
      return 'Amount Should Be Less Than 5000.';
    } else if((int.parse(amount) % 100) != 0 ) {
      return 'Amount Should Be Multiples Of 100.';
    }  else {
      return null;
    }
  }

  static String? passportValidate(String passport){
    RegExp regExp = RegExp(r'[A-PR-WYa-pr-wy][1-9]\d\s?\d{4}[1-9]');
    if(passport.isEmpty){
      return 'Please Enter Passport Number';
    }
    else if(passport.length != 8){
      return 'Please Enter Valid';
    } else if(!regExp.hasMatch(passport)){
      return 'Please Enter Valid Passport Number';
    } else{
      return null;
    }
  }

  static String? inputValidate(String amount,String type) {
    if(amount.isEmpty || amount == ""){
      return 'Please Enter $type';
    } else if(amount.trim().length < 3) {
      return 'Please Enter Valid $type';
    } else {
      return null;
    }
  }
  static String? inputnameValidate(String amount,String type) {
    if(amount.isEmpty || amount == ""){
      return 'Please Enter $type';
    } else if(amount.length < 3) {
      return 'Please Enter Valid $type';
    }

    else {
      return null;
    }
  }

  static String? nomineeinputValidate(String amount,String type) {
    if(amount.isEmpty || amount == ""){
      return 'Please Enter $type';
    } else if(amount.length < 3) {
      return 'Please Enter Valid $type';
    } else if(amount.length < 3) {
      return 'Please Enter Valid $type';
    } else {
      return null;
    }
  }


  static String? DownlineIdValidate(String amount) {
    if(amount.isEmpty || amount == ""){
      return 'Please Enter This Downline Distributor ID';
    } else if(amount.length < 1) {
      return 'Please Enter Valid Input';
    } else {
      return null;
    }
  }

  static String? RemarksValidate(String amount) {
    if(amount.isEmpty || amount == ""){
      return 'Please Enter This Field';
    } else if(amount.length < 1) {
      return 'Please Enter Valid Input';
    } else {
      return null;
    }
  }

  static String? idProofValidate(String amount) {
    if(amount.isEmpty || amount == ""){
      return 'Please Enter This Field';
    } else if(amount.length < 6) {
      return 'Please Enter Valid Input';
    } else {
      return null;
    }
  }



  static String? noValidate(String n) {
    return null;
  }

  static String? DetailedRemarksValidate(String txt) {
    if(txt.isEmpty ){
      return 'Please Enter Detailed Remarks';
    } else if(txt.length < 1) {
      return 'Please Enter valid Detailed Remarks ';
    } else {
      return null;
    }
  }

  static String? inputTextValidate(String amount) {
    if(amount.isEmpty || amount == ""){
      return 'Please Enter text';
    }  else {
      return null;
    }
  }

    static String? inputValidator(val,String text) {
      if (val.length != 0 ) {
        return null;
      } else {
        return "Please Enter $text ";
      }
  }





}