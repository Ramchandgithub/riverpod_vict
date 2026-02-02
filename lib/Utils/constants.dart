import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class

Constants{


// staging
//   static const String domainURL = 'http://stagingmobileapi.victouslife.in/api/';
//   static const String webURL = 'http://staging.victouslife.in/';

  //live
  static const String domainURL = 'https://mobileapi.victouslife.com/api/';
  static const String webURL = 'https://victouslife.com/';

  static const baseUrl = '${domainURL}MobileApp/';
  static const baseUrl2 = '${domainURL}Home/';
  static const String ImagePath = 'assets/images/';
  static const String IconPath = 'assets/icons/';
  static const String Genealogy = 'assets/genealogy/';
  static const String VZonedashboard = 'assets/VZonedashboard/';
  static const String CompanyBankIMGUrl = '${webURL}images/FileUpload/BankPassbooks/';
  static const String Downloads="${webURL}/images/fileupload/downloadmanager/";
  static const String PanCardUrl = '${webURL}/images/fileUpload/DistributorPhotos/';
  static const String addressPhotoUrl = '${webURL}/images/fileUpload//AddressProof/';
  static const String Popup_url = '${webURL}images/FileUpload/PopupImages/';
  static const String genealogyUrl = '${webURL}';
  static const String banners_URL = '${webURL}images/fileUpload/BanarImages/';
  static const String IngredientImage_URL = '${webURL}images/fileUpload/IngredientImages/';
  static const String ProductImg_URL = '${webURL}images/fileUpload/ProductImages/';
  static const String profilepic_url = '${webURL}images/FileUpload/KYC/photo/';
  static const String invoice_url = '${webURL}Home/OrderDetailsonInvNo?billno=';
  static const String orderno_url = '${webURL}Home/OrderDetailsonBillno?billno=';
  static const String Deleteurl = '${webURL}delete-account.html';



  static const String rupeesymbol = '\u20B9';
  static const String prefIsLogin = 'isLogin';
  static const String PREF_UserName = 'Username';
  static const String PREF_UserId = 'UserId';
  static const String PREF_Password = 'Password';
  static const String PREF_Regid = 'Regid';
  static const String PREF_Name = 'name';
  static const String PREF_LoginType = 'LoginType';

  static const String PREF_Mobile = 'Mobile';
  static const String PREF_Email = 'Email';

  static const String PREF_VFID = 'VFIDs';
  static const String PREF_FCode = 'fcode';
  static const String PREF_VzonerequestID = 'VzonerequestID';
  static const String PREF_Vzonewalletbal = 'Vzonewalletbal';

  static const String PREF_VirtualFranchise = 'VirtualFranchise';
  static const String PREF_VPurchageType = 'VPurchageType';
  static const String PREF_VMODisp = 'VMODisp';

  static const String PREF_Mstatus = 'Mstatus';
  static const String PREF_UserType = 'userType';
  static const String profile_pic = 'profilePic';
  static const String OrderPurchaseType = 'orderpurchaseType';

  static const String PREF_OTP = 'OTP';

  static const String pref_ipAddress = 'ipAddress';
  static const String PREF_SprRegid = 'SprRegid';
  static const String PREF_RefRegid = 'RefRegid';
  static const String offerQty = 'OfferQnty';
  static const String PREF_customer = 'isCustomer';

  static const String PREF_LoginSessionId = 'loginSessionId ';
  static const String byhandfcode = 'handfcode ';

  //customer session
  // static const String PREF_CustName = 'CustName';
  static const String PREF_IsCustomer = 'PREF_CustIsCustomer';
  static const String PREF_CustStateID = 'CustStateId';
  // static const String PREF_CustSprRegID = 'CustSprRegID';
  // static const String PREF_CustRefferralID = 'CustRefferralID';
  // static const String PREF_CustSprMemberID = 'CustSprMemberID';
  // static const String PREF_CustRefferralMemberID = 'CustRefferralMemberID';
  // static const String PREF_CustStatus = 'CustStatus';
  static const String PREF_CustVZoneUserID = 'CustVZoneUserID';
  static const String PREF_CustVZoneFCode = 'CustVZoneFCode';
  static const String PREF_NotifiCntCount = 'NotifiCntCount';
  static const String loginState = 'Loginstate';




  //Apis
  static const String api_MemberLogin = 'Login';
  static const String api_GetUserData = 'GetUserData';
  static const String api_SendEmailOTP = 'SendEmailOTP';
  static const String api_VerifyEmail = 'VerifyEmail';
  static const String api_FirstChangePassword = 'FirstChangePassword';
  static const String api_SendPassword = 'SendPassword';
  static const String api_DashBoard_Member = 'DashBoard_Member';
  static const String api_MemberProfile = 'MemberProfile';
  static const String api_IFSCodeDetails = 'IFSCodeDetails';
  static const String api_NEFTStatus= 'NEFTStatus';
  static const String api_PANStatus= 'PANStatus';
  static const String api_KYCStatus= 'KYCStatus';
  static const String api_UploadKYCDetails= 'UploadKYCDetails';
  static const String api_CheckPanAAdharStatus= 'CheckPanAAdharStatus';
  static const String api_PANCheckingDashboard= 'PANCheckingDashboard';
  static const String api_VerifyNEFTDatails= 'VerifyNEFTDatails';
  static const String api_DistributorChangePassword= 'DistributorChangePassword';

  static const String api_EwalletSummaryRpt = 'EwalletSummaryRpt';
  static const String api_EwalletBalance = 'EwalletBalance';
  static const String api_CompanyBanks = 'CompanyBanks';
  static const String api_CreditRequest = 'CreditRequest';
  static const String api_DirectConsultantsReport = 'DirectConsultantsReport';
  static const String api_GraphicalViewBinary = 'GraphicalViewBinary';
  static const String api_TabularView = 'TabularView';
  static const String api_GraphicalTooltip = 'GraphicalTooltip';
  static const String api_RepurchaseOrderRpt = 'RepurchaseOrderRpt';
  static const String api_GetDropDown2 = 'GetDropDown2';
  static const String api_CreateSupportTicket = 'CreateSupportTicket';
  static const String api_CreateCustomerSupportTicket = 'CreateCustomerSupportTicket';
  static const String api_SupportTicketReport = 'SupportTicketReport';
  static const String api_TicketReplyDetails = 'TicketReplyDetails';
  static const String api_ServiceRequestReplyMessage = 'ServiceRequestReplyMessage';
  static const String api_CheckUserID = 'CheckUserID';
  static const String api_AdjustEwallet = 'AdjustEwallet';
  static const String api_AdjustEwalletDetailes = 'AdjustEwalletDetailes';
  static const String api_GetDownloadReport = 'GetDownloadReport';
  static const String api_GetEventCreationRpt = 'GetEventCalenderReport';
  static const String api_GetDropDown = 'GetDropDown';
  static const String api_Products_GetDropDown = 'GetProductsPCodes';
  static const String api_GetCategorydropdown = 'GetCategorydropdown';
  static const String api_EventCalenderInsertAndUpdateData = 'EventCalenderInsertAndUpdateData';
  static const String api_HomePage = 'HomePage';
  // static const String api_TempRepurchaseItems = 'TempRepurchaseItemsss';
  static const String api_TempRepurchaseItems = 'TempRepurchaseItems';

  static const String api_ShippingAddressesByRegID = 'ShippingAddressesByRegID';
  static const String api_GetStateCityByPincode = 'GetStateCityByPincode';
  // static const String api_InsertRepurchaseOrder = 'InsertRepurchaseOrderrrrrr';
  static const String api_InsertRepurchaseOrder = 'InsertRepurchaseOrder';
  static const String api_InsertRepurchaseOrderUPI = 'InsertRepurchaseOrderUpdateTranscationsbyUPI';
  static const String api_GSTInvoice = 'GSTInvoice';
  static const String api_GetCommunityBuildingReport = 'GetCommunityBuildingReport';
  static const String api_CommunityBuilding = 'CommunityBuilding';

  static const String api_Ewallet_summary='EwalletReportData';
  static const String api_CreditRequestReport = 'EwalletCreditRequestReport';
  static const String api_Order_Stock_Report = 'GetStockOrderRpt';
  static const String api_Sales_reports = 'RepurchaseOrderRpt';
  static const String api_GenerateOrder = 'GenerateOrder';
  static const String api_GetTourAchieversReport = 'GetTourAchieversReport';
  static const String api_ArchievedReport = 'RepurchaseOrderRpt';
  static const String api_tdsreport ="PayOutReports";
  static const String api_EncryptData ="EncryptData";
  static const String api_MyDownlineBusinessReport ="MyDownlineBusinessReport";


  static const String api_CreateAndUpdateVZone = 'CreateAndUpdateVZone';


  //Registration API's
  static const String api_PANChecking = 'PANChecking';
  static const String api_SignUpOTPWithPAN = 'SignUpOTPWithPAN';
  static const String api_CheckMobileNo = 'CheckMobileNo';
  static const String api_GetSponserDetails = 'GetSponserDetails';
  // static const String api_Registration = 'Registrationnnn';
  static const String api_Registration = 'Registration';
  static const String api_CustRegistration = 'CustRegistration';

  //vzone
  static const String api_VZoneDashBoardDetails = 'VZoneDashBoardDetails';
  static const String api_VZoneproducts = 'GetProductsRequestOrders_Inventory';
  static const String api_VzoneTempRepurchaseItems = 'TempStockOrderItems';
  static const String api_Vzoneorder = 'StockOrder';
  static const String api_Customer_Consultant_Detailes = 'Customer_Consultant_Detailes';
  static const String api_VzoneGetProductsPCodes = 'GetProductsPCodes';
  static const String api_GetProductsRequestOrders = 'GetProductsRequestOrders';

  static const String api_Stock_Level_Report = 'StockLevel';
  static const String api_VOSApplicationReportone = 'GetVOSApplicationReport';
  static const String api_RePurchaseOrderTempMOP = 'RePurchaseOrderTempMOP';
  static const String api_GetUserDataAtLogin = 'GetUserData';
  static const String api_uploadgstinstatus = 'UploadGSTINStatus';
  static const String api_uploadgstinDetails = 'UploadGSTINDetails';
  static const String api_archivePayRpt = 'ArchivePayoutReports';


  static const String Photo_url = '${webURL}images/fileUpload/KYC/photo/';
  static const String IDProof_url = '${webURL}images/fileUpload/KYC/identity/';
  static const String AddressProof_url = '${webURL}images/fileUpload/KYC/Address/';
  static const String DistributorDepSlips_url ='${webURL}images/fileupload/DistributorDepSlips/';
  static const String NotifcationImgUrl ='${webURL}images/fileupload/NotificationFiles/';
  static const String NEFTDetails_url = '${webURL}images/fileUpload/KYC/';
  static const String rankUrls = '${webURL}images/member/';
  static const String categoriesUrl = '${webURL}images/fileUpload/Category/';
  static const String payoutAsscUrl = '${webURL}home/LoadPayoutStatement?data=';



  static const String About_Us =  "${Constants.webURL}home/mblAboutUs";
  static const String Privacy_Policy = "${Constants.webURL}home/mblPrivacyPolicy";
  static const String Return_Policy = '${Constants.webURL}home/mblReturnPolicy';
  static const String Terms_conditions = "${Constants.webURL}home/mblTermsConditions";

  static const String PREF_CartUUID = 'CartUUID';
  static const String PREF_VZCartUUID = 'VZCartUUID';
  static const String PREF_CartCount = 'CartCount';
  static const String PREF_VzoneCartCount = 'VzoneCartCount';
  static const String PREF_CartSessionId = 'SessionId ';
  static const String PREF_VZCartSessionId = 'VZSessionId ';
  static const String PREF_PickupMode = 'PickupMode ';//by courir/hand)
  static const String PREF_PickupCentrID = 'PickupID ';//Pick up point id

  static const String PREF_ShipName = 'ShipName';
  static const String PREF_ShipAddress = 'shipaddress';
  static const String PREF_ShipStateId = 'shipstate';
  static const String PREF_ShipStateName = 'shipstateName';
  static const String PREF_ShipDistrictId = 'shipdistrict';
  static const String PREF_ShipDistrictName = 'shipdistrictname';
  static const String PREF_ShipCityId = 'shipcity';
  static const String PREF_ShipPinCodeID = 'ShipPinCodeID';
  static const String PREF_ShipCityName = 'shipcityname';
  static const String PREF_ShipPinCode = 'shippincode';
  static const String PREF_ShipMobile = 'shipmobile';
  static const String PREF_ShipEmail = 'shipEmail';

  //directsales

  static const String PREF_VZDIRCartUUID = 'VZDIRCartUUID';
  static const String PREF_VZDIRCartCount = 'VZDIRCartCount';
  static const String PREF_VZDIRCartSessionId = 'VZDIRCartSessionId';

  static const String PREF_VZDIRShipName = 'VZDIRShipName';
  static const String PREF_VZDIRShipAddress = 'VZDIRShipAddress ';
  static const String PREF_VZDIRShipStateId = 'VZDIRShipStateId';
  static const String PREF_VZDIRShipStateName = 'VZDIRShipStateName';
  static const String PREF_VZDIRShipDistrictId = 'VZDIRShipDistrictId';
  static const String PREF_VZDIRShipDistrictName = 'VZDIRShipDistrictName';
  static const String PREF_VZDIRShipCityId = 'VZDIRShipCityId';
  // static const String PREF_VZDIRShipPinCodeID = 'VZDIRShipPinCodeID';
  static const String PREF_VZDIRShipCityName = 'VZDIRShipCityName';
  static const String PREF_VZDIRShipPinCode = 'VZDIRShipPinCode';
  static const String PREF_VZDIRShipMobile = 'VZDIRShipMobile';
  static const String PREF_VZDIRShipEmail = 'VZDIRShipEmail';
  static const String PREF_VZDIRPurchageType = 'VZDIRPurchageType';
  static const String PREF_VZDIRMODisp = 'VZDIRMODisp';
  static const String PREF_VZDIRofferid = 'VZDIRofferid';
  static const String PREF_offerid = 'offerid';
  static const String PREF_VZDIMOP = 'VZDIMOP';
  static const String PREF_VZDIofferName = 'VZDIofferName';
  static const String PREF_offerName = 'offerName';

  static const String PREF_PayOutReportsClick = 'PayOutReports';
  static const String PREF_ArchivePayoutReports = 'ArchivePayoutReports';

  //25-05-2025 rupa
  static const String PREF_GetMyRankAchieveDetailReport = "GetMyRankAchieveDetailReport";
  static const String PREF_GetNotification = "GetNotification";
  static const String GetNotification = "GetNotification";
  // static const String api_MyDownlineBusinessReport ="MyDownlineBusinessReport";
  static const String api_GetPrivilegedCustomerReport ="GetPrivilegedCustomerReport";

  //Preferred Customer
  static const String api_CustomerLogin ="CustomerLogin";
  static const String api_CustomerProfile ="CustomerProfile";
  static const String api_ChangePassword ="ChangePassword";
  static const String NotificationFiles ="https://victouslife.com/images/fileupload/NotificationFiles/";





  static const String gif = 'assets/gifs/';
  static const String api_GetDropDownDetails = 'GetDropDownDetails';
  static const String blue = "#4253A1";
  static const String appbar = "#0061ab";

  static const String firstDashboard = "#66C6CD";
  static const String secondDashboard = "#A0C4F7";
  static const String thirdDashboard = "#F59BBF";
  static const String fourDashboard = "#CCB9F1";
  static const String fiveDashboardYellow = "#F1E89B";
  static const String primaryOrangeColor = "#E84412";
  static const String OliveGreen = "#c2c923";
  static const String pupleColor = "#792B90";

  Color yellow = Color(0xfffbba01);
  Color red = Color(0xffF72804);
  double defaultPadding = 16.0;

  static const String success = 'SUCCESS';
  static const String NODATAFOUND = 'No Records Found';


  static Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
  static MaterialColor buildMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });
    return MaterialColor(color.value, swatch);
  }

  static  launchurl(String url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }



  //colors

  Color appbarTitlew = Color(0xFFFFFFFF);
  Color white = Color(0xFFFFFFFF);
  Color appbarTitleb = Color(0xFF000000);
  Color black = Color(0xFF000000);
  Color buttonTextw = const Color(0xFFFFFFFF);
  Color buttonTextb = Color(0xFF000000);
  Color bordercolor = Color(0xFF000000);
  static const String lightpink = "#FFD8E0";
  static const String lightyellow = "#FFEFB5";
  static const String lightgreen = "#BEFCB4";
  static const String lightpurple = "#E2C7FF";
  static const String lightskyblue = "#b7ccf3";

  ///Text Sizes
  static const double texXSmall = 12;
  static const double texSmall = 14;
  static const double texSMedium = 16;
  static const double texMedium = 18;
  static const double texLarge = 22;
  static const double texXLarge = 28;


  static const List<String> relations = [
    'Select Relation',
    'MOTHER',
    'FATHER',
    'BROTHER',
    'WIFE',
    'SISTER',
    'SON',
    'DAUGHTER',
    'FRIEND',
    'GRAND SON',
    'GRAND DAUGHTER',
    'SON IN LAW',
    'DAUGHTER IN LAW',
    'BROTHER IN LAW',
    'SISTER IN LAW',
    'HUSBAND',
    'PROPRETER',
    'PARTNER',
    'DIRECTOR'
  ];

}