
import 'package:get/get.dart';
import 'package:victous/Presentation/login_view.dart';
import 'package:victous/Presentation/shipping_address_view.dart';
import 'package:victous/Utils/version_update_view.dart';

import '../Presentation/My Orders/orders_rpt.dart';
import '../Presentation/MyWallet/credit_request.dart';
import '../Presentation/MyWallet/credit_request_rpt.dart';
import '../Presentation/MyWallet/summary_wallet_rpt.dart';
import '../Presentation/MyWallet/transfer_wallet_dwnline.dart';
import '../Presentation/PayoutMenu/payoutonhold_rpt_view.dart';
import '../Presentation/address_view.dart';
import '../Presentation/cart_view.dart';
import '../Presentation/category_prdcts_view.dart';
import '../Presentation/change_password.dart';
import '../Presentation/contactus_view.dart';
import '../Presentation/dashboard.dart';
import '../Presentation/genealogy/directreferralreport.dart';
import '../Presentation/genealogy/tabular_genealogy_view.dart';
import '../Presentation/genealogy/visualgenealogy_view.dart';
import '../Presentation/idcard_view.dart';
import '../Presentation/main_view.dart';
import '../Presentation/mode_of_payment_view.dart';
import '../Presentation/profile_view.dart';
import '../Presentation/purchse_selection_view.dart';
import '../Presentation/tools/notification_rpt.dart';
import '../Widgets/my_date_filter.dart';
import '../model/cart_model.dart';



List<GetPage> routes = [
  GetPage(page: ()=> const Main(), name: Main.routeName),
  GetPage(page:() => const LoginView(), name: LoginView.routeName ),
  GetPage(page:() => const VersionUpdateView(), name: VersionUpdateView.routeName),
  GetPage(page:() => const ChangePasswordView(), name: ChangePasswordView.routeName),
  GetPage(page:() => const Dashboard(), name: Dashboard.routeName),
  GetPage(page:() => const PurchaseSelectionView(), name: PurchaseSelectionView.routeName),
  GetPage(page:() => const CategoryPrdctsView(), name: CategoryPrdctsView.routeName),
  GetPage(page:() =>  CartView(), name: CartView.routeName),
  GetPage(page:() =>  ShippingAddressView(), name: ShippingAddressView.routeName),
  GetPage(page:() =>  AddressView(), name: AddressView.routeName),
  GetPage(page:() =>  ProfileView(), name: ProfileView.routeName),
  GetPage(page:() =>  ModeOfPaymentView(), name: ModeOfPaymentView.routeName),
  GetPage(page:() =>  ContactUs(), name: ContactUs.routeName),
  GetPage(page:() =>  IDCardView(), name: IDCardView.routeName),
  GetPage(page:() =>  DirectRefReport(), name: DirectRefReport.routeName),
  GetPage(page:() =>  VisualGenealogy(), name: VisualGenealogy.routeName),
  GetPage(page:() =>  VisualGenealogyTabularView(), name: VisualGenealogyTabularView.routeName),
  GetPage(page:() =>  MyDateFilterView(), name: MyDateFilterView.routeName),
  GetPage(page:() =>  SummaryRpt(), name: SummaryRpt.routeName),
  GetPage(page:() =>  CreditRequest(), name: CreditRequest.routeName),
  GetPage(page:() =>  CreditReqReport(), name: CreditReqReport.routeName),
  GetPage(page:() =>  TransferToDwnline(), name: TransferToDwnline.routeName),
  GetPage(page:() =>  OrdersRpt(), name: OrdersRpt.routeName),
  GetPage(page:() =>  const NotificationReport(), name: NotificationReport.routeName),
  GetPage(page:() =>  const PayoutOnholdRpt(), name: PayoutOnholdRpt.routeName),


] ;
