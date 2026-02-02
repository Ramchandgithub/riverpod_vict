
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:victous/Controllers/auth_controller.dart';
import 'package:victous/Presentation/change_password.dart';
import 'package:victous/Presentation/genealogy/directreferralreport.dart';
import 'package:victous/Presentation/login_view.dart';
import 'package:victous/Presentation/profile_view.dart';
import 'package:victous/Presentation/purchse_selection_view.dart';
import 'package:victous/Presentation/tools/notification_rpt.dart';
import 'package:victous/Utils/drawer_enum.dart';
import 'package:get/get.dart';
import 'package:victous/model/profile_model.dart';
import 'package:victous/model/referal_model.dart';
import 'package:victous/model/visualgenealogy_model.dart';
import 'package:victous/model/wallet_model.dart';
import 'package:victous/services/auth_service.dart';
import '../Controllers/dashboard_notifier.dart';
import '../Controllers/payout_onhold_notifier.dart';
import '../Controllers/profile_notifier.dart';
import '../Utils/constants.dart';
import '../Utils/logger.dart';
import '../Utils/session_manager.dart';
import '../Widgets/main_drawer.dart';
import '../Widgets/my_date_filter.dart';
import '../model/dashboard_model.dart';
import '../model/home_notifier.dart';
import '../model/notification_model.dart';
import '../model/payout_model.dart';
import '../services/repository.dart';
import 'MyWallet/credit_request.dart';
import 'MyWallet/summary_wallet_rpt.dart';
import 'MyWallet/transfer_wallet_dwnline.dart';
import 'PayoutMenu/payoutonhold_rpt_view.dart';
import 'category_prdcts_view.dart';
import 'contactus_view.dart';
import 'dashboard.dart';
import 'genealogy/visualgenealogy_view.dart';
import 'idcard_view.dart';
import 'package:carousel_slider/carousel_controller.dart';

final referralProvider = StateProvider<List<ReferralModel?>>((ref) => []);
final visualProvider = StateProvider<List<GenealogyModel?>>((ref) => []);
final walletProvider = StateProvider<List<WalletModel?>>((ref) => []);
final notificationProvider = StateProvider<List<NotificationModel?>>((ref) => []);
// final payoutProvider = StateProvider<List<PayoutModel?>>((ref) => []);

class Main extends ConsumerStatefulWidget {
  const Main({super.key});

  static const String routeName = '/Main';

  @override
  ConsumerState<Main> createState() => _ConsumerMainState();
}

class _ConsumerMainState extends ConsumerState<Main> {
  final _advancedDrawerController = AdvancedDrawerController();

  // late final mainState;

  @override
  void initState(){
    super.initState();

    Future.microtask(() {
      ref.read(homeProvider.notifier).load();   //  Call Home Data API
    });
     
    // Logger.logger("mainState:::${mainState.}");
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    final homeState = ref.watch(homeProvider); //autoRebuild
    Logger.logger("homestate::::${homeState.isLoading}");
    Logger.logger("homestate::::${homeState.banners}");
    // if(homeState.isLoading == true){
    //   return const Center(child: CircularProgressIndicator(),);
    // }
    // if(homeState.error.isNotEmpty){
    //   return  Center(child: Text(homeState.error),);
    // }

    Logger.logger("enums length::${DrawerMenu.values.length}");
    ref.listen<DrawerMenu?>(drawerMenuProvider, (prev, next) async {
      Logger.logger("next:::$next");
      if (next == null || prev == next) return; // exception case or tapping same tab
      Logger.logger("next:::$next");
      switch (next) {
        case DrawerMenu.dashboard:
          ref.read(dashboardProvider.notifier).load();
          Get.toNamed(Dashboard.routeName);
          break;
        case DrawerMenu.profile:
          ref.read(profileProvider.notifier).load();
          Get.toNamed(ProfileView.routeName);

          break;
        case DrawerMenu.changePswd:
          Get.toNamed(ChangePasswordView.routeName);
          break;
        case DrawerMenu.idCard:
          ref.read(repoProvider.notifier).getProfileData("");
          Get.toNamed(IDCardView.routeName);
          break;
        case DrawerMenu.uploadBnkDtls:
          Get.toNamed(IDCardView.routeName);
          break;
        case DrawerMenu.uploadPan:
          Get.toNamed(IDCardView.routeName);
          break;
        case DrawerMenu.uploadKyc:
          Get.toNamed(IDCardView.routeName);
          break;

        case DrawerMenu.referral:
         final value = ref.read(repoProvider.notifier).getMyReferralsRpt();
          ref.read(referralProvider.notifier).state = await value;
          Get.toNamed(DirectRefReport.routeName);
          break;

        case DrawerMenu.genealogy:
          Map<String,dynamic>params={
            "MemberID":SessionManager.getString(Constants.PREF_UserId).toString(),
            "TViewMemberID":SessionManager.getString(Constants.PREF_UserId).toString(),
          };
          final value = await ref.read(repoProvider.notifier).getGraphicalData(params);
          Logger.logger("genealogy data :::${value}");
          ref.read(visualProvider.notifier).state = value;
          Get.toNamed(VisualGenealogy.routeName);
          break;
        case DrawerMenu.visual:
          Map<String,dynamic>params={
            "MemberID":SessionManager.getString(Constants.PREF_UserId).toString(),
            "TViewMemberID":SessionManager.getString(Constants.PREF_UserId).toString(),
          };
          ref.read(repoProvider.notifier).getGraphicalData(params);
          Get.toNamed(VisualGenealogy.routeName);
          break;
        case DrawerMenu.tabular:
          Get.toNamed(MyDateFilterView.routeName,arguments: {'type':"Tabular Genealogy"});
          break;
        case DrawerMenu.wallet:
          dynamic value = await ref.read(repoProvider.notifier).getWalletSummary("IdSummary_Member", "WalletSummary");
          ref.read(walletProvider.notifier).state = value;
          Get.toNamed(SummaryRpt.routeName);
          break;
          
        case DrawerMenu.creditRqst:
          Get.toNamed(CreditRequest.routeName);
          break;
        case DrawerMenu.creditReport:
          Get.toNamed(MyDateFilterView.routeName,arguments: {'type':"Credit Request Report"});
          break;
        case DrawerMenu.transfer:
          Get.toNamed(TransferToDwnline.routeName);
          break;
        case DrawerMenu.orders:
          if (SessionManager.getString(Constants.OrderPurchaseType) == ''){
            final returnData = await ref.read(repoProvider.notifier).PurchaseSelection();
            if(returnData != ''){
              Get.toNamed(PurchaseSelectionView.routeName, arguments: returnData);
            }else{
              Logger.showWarningAlert("Alert", "No Data Found");
            }
          } else{
            final returnData = await ref.read(repoProvider.notifier).OrderNow();
            Logger.logger("return data:::$returnData");
            if(returnData != ''){
              Get.toNamed(CategoryPrdctsView.routeName, arguments:returnData);
            }else{
              Logger.showWarningAlert("Alert", "No Data Found");
            }
          }
        case DrawerMenu.orderRpt:
          Get.toNamed(MyDateFilterView.routeName, arguments: {'type': 'Orders Report'});
          break;
        case DrawerMenu.archivedRpt:
          Get.toNamed(MyDateFilterView.routeName, arguments: {'type': 'Archived Report'});
          break;
        case DrawerMenu.tools:

          break;
        case DrawerMenu.notification:
         final value = await   ref.read(repoProvider.notifier).getNotificationRpt();
          ref.read(notificationProvider.notifier).state =  value;
          Get.toNamed(NotificationReport.routeName);

        case DrawerMenu.signUp:
          break;
        case DrawerMenu.contactUs:
          Get.toNamed(ContactUs.routeName);
          break;
        case DrawerMenu.aboutUs:
          Constants.launchurl('${Constants.About_Us}');
          break;
        case DrawerMenu.privacy:
          Constants.launchurl('${Constants.Privacy_Policy}');
          break;
        case DrawerMenu.terms:
          Constants.launchurl(Constants.Terms_conditions);
          break;
        case DrawerMenu.contactUs:
          Get.toNamed(ContactUs.routeName);
          break;
        case DrawerMenu.support:
          break;
        case DrawerMenu.newTkt:
          break;
        case DrawerMenu.mytkt:
          Get.toNamed(MyDateFilterView.routeName, arguments: {'type': 'Support Ticket Report'});

          break;

        case DrawerMenu.payableRpt:

          ref.read(payoutProvider.notifier).load("MemberPayableReport");
         // Get.toNamed(PayableReportView.routeName);
          break;
        case DrawerMenu.payoutHold:
          ref.read(payoutProvider.notifier).load("MemberPayoutOnHold");
          Get.toNamed(PayoutOnholdRpt.routeName);
          break;
        case DrawerMenu.reward:
          break;
        case DrawerMenu.login:
          Get.offAllNamed(LoginView.routeName);
          break;
        case DrawerMenu.logout:
          break;
        default:
          break;
      }
      ref.read(drawerMenuProvider.notifier).state = null;
    });

    return AdvancedDrawer(
      backdropColor: Colors.white,
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      drawer: MainDrawer(
        advCtrl: _advancedDrawerController,
      ),
      child: Scaffold(
        appBar: AppBar(
          shadowColor: Colors.black,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.cover,
            height: 50,
            width: 90,
          ),
          leading: IconButton(
            onPressed: _handleMenuButtonPressed,
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: _advancedDrawerController,
              builder: (_, value, __) {
                return AnimatedSwitcher(
                  duration: Duration(milliseconds: 250),
                  child: CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColor,
                    radius: 15,
                    child: Image.asset(
                      value.visible
                          ? '${Constants.IconPath}close.png'
                          : '${Constants.IconPath}menu.png',
                      color: Colors.white,
                      key: ValueKey<bool>(value.visible),
                      width: 26,
                      height: 20,
                    ),
                  ),
                );
              },
            ),
          ),
          actions: [
            authState.isLoggedIn
            ? IconButton(icon: Icon(Icons.power_settings_new, color: Colors.blue,), onPressed: () { showLogoutDialog(context, ref); },)
            : IconButton(icon: Icon(Icons.login, color: Colors.blue,), onPressed: () { Get.offAllNamed(LoginView.routeName); },)
          ],
        ),
        body: authState.isLoading
            ? const Center()
            : SafeArea(
                child: Stack(fit: StackFit.loose, children: [
                  SingleChildScrollView(
                      child: Container(
                          padding: EdgeInsets.all(6),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 5,
                              ),

                              homeState.banners!.isNotEmpty
                             ?  FadeInUp(
                                duration: const Duration(milliseconds: 900),
                                delay: const Duration(milliseconds: 900),
                                child:    Container(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: CarouselSlider(
                                        options: CarouselOptions(
                                            initialPage: 0,
                                            autoPlay: true,
                                            viewportFraction: 1 ,
                                            aspectRatio: 2,
                                            height: 230,
                                            reverse: false,
                                            enlargeCenterPage: true,
                                            autoPlayInterval: const Duration(seconds: 5)),
                                        items:homeState.banners!.map((item) {
                                          return  Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(15)),
                                            margin: const EdgeInsets.all(0),
                                            child:

                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(10),
                                              child: CachedNetworkImage(
                                                imageUrl: "${Constants.banners_URL}${homeState.banners![0].banarImage}",
                                                fit: BoxFit.fill,
                                                width:  MediaQuery.sizeOf(context).width,
                                                height: MediaQuery.sizeOf(context).height,
                                                placeholder: (ctx, url) => const Center(
                                                  child: CircularProgressIndicator(),
                                                ),
                                                errorWidget: (ctx, url, error) =>
                                                    Image.asset('${Constants.ImagePath}noproduct.jpg'),
                                              ),
                                            ),
                                          );
                                        }

                                        ).toList()),

                                  ),
                                ),
                              ) : const Center(),

                              const SizedBox(
                                height: 10,
                              ),

                              Container(
                                child: Column(
                                  children: [
                                    Text(
                                      "Healthy Inside, Happy Outside",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20,
                                          fontFamily: "Poppins"),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Victous Life Sciences empowers you to live your best life by prioritizing your health, personal development, and financial security.",
                                      style: TextStyle(fontFamily: "Poppins"),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          //showPopup('Heart');
                                        },
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              'assets/images/heart.png',
                                              width: 80,
                                              height: 80,
                                              fit: BoxFit.cover,
                                            ),
                                            const Text("Heart")
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          // showPopup('Energy');
                                        },
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              'assets/images/energy.png',
                                              width: 80,
                                              height: 80,
                                              fit: BoxFit.cover,
                                            ),
                                            const Text("Energy")
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          // showPopup('Stress');
                                        },
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              'assets/images/stress.png',
                                              width: 80,
                                              height: 80,
                                              fit: BoxFit.cover,
                                            ),
                                            Text("Stress")
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          // showPopup('Weight');
                                        },
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              'assets/images/weight.png',
                                              width: 80,
                                              height: 80,
                                              fit: BoxFit.cover,
                                            ),
                                           const Text("Weight")
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          // showPopup('Sleep');
                                        },
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              'assets/images/sleep.png',
                                              width: 80,
                                              height: 80,
                                              fit: BoxFit.cover,
                                            ),
                                           const Text("Sleep")
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          // showPopup('Digestion');
                                        },
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              'assets/images/diagest.png',
                                              width: 80,
                                              height: 80,
                                              fit: BoxFit.cover,
                                            ),
                                          const  Text("Digestion")
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),

                               Container(
                                child: Column(
                                  children: [
                                    Text(
                                      "Supercharge Your Wellbeing with Earth's Finest",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          fontFamily: "Poppins"),
                                    ),
                                   const  SizedBox(
                                      height: 10,
                                    ),
                                   const Text(
                                        "Premium Superfoods, Essential Nutrients, Plant-Powered Ingredients",
                                        style:
                                            TextStyle(fontFamily: "Poppins")),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),

                            homeState.ingredients!.isNotEmpty
                                  ?
                              Padding(padding: EdgeInsets.all(2),
                                child: CarouselSlider(
                                    options: CarouselOptions(
                                        height: 135,
                                        initialPage: 0,
                                        viewportFraction: 0.27,
                                        autoPlay: true,
                                        aspectRatio: 16/9,
                                        reverse: false,
                                        enlargeCenterPage: false,
                                        autoPlayInterval:
                                        const Duration(seconds: 5)),
                                    items:  homeState.ingredients!.map((item) {
                                      return  Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8)),
                                        margin: const EdgeInsets.all(0),
                                        child:
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: Center(
                                            child: Column(
                                              children: [
                                                InkWell(
                                                  onTap: (){
                                                    Map<String,dynamic> params ={
                                                      "result":item,
                                                    };
                                                   // Get.toNamed(IngredientsPageview.routeName, arguments: params);

                                                  },
                                                  child: CachedNetworkImage(
                                                    imageUrl:
                                                    "${Constants.IngredientImage_URL}${item.ingredentiamge}",
                                                    fit: BoxFit.cover,
                                                    width: 80,
                                                    height: 80,
                                                    placeholder: (ctx, url) => const Center(
                                                      child: CircularProgressIndicator(),
                                                    ),
                                                    errorWidget: (ctx, url, error) =>
                                                        Image.asset('${Constants.ImagePath}noproduct.jpg'),
                                                  ),
                                                ),
                                                Text("${item.ingredientname}",style: TextStyle(fontFamily: "Poppins",overflow: TextOverflow.ellipsis), textAlign: TextAlign.center,)
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }

                                    ).toList()

                                ),
                              ):const Center(),

                              const SizedBox(height: 10,),
                              FadeInUp(
                                  duration: const Duration(milliseconds: 900),
                                  delay: const Duration(milliseconds: 900),
                                  child: Row(
                                    children: [
                                      Container(
                                        color: Theme.of(context).primaryColor,
                                        height: 20,
                                        width: 15,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Expanded(
                                          flex: 2,
                                          child: Text('Victous Products',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold))),
                                      Expanded(
                                          flex: 1,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              InkWell(
                                                onTap: (){
                                                  // Map<String, dynamic> param = {
                                                  //   "action":"AllProducts",
                                                  //   "Condition1":"stores",
                                                  //   "Condition2":"0",
                                                  // };
                                                  // NetworkCall().onCallServer(parameters: param, endPoint: Constants.api_HomePage).then((value) async {
                                                  //   var data = jsonDecode(NetworkCall.getParse(value));
                                                  //   if(data.length>0){
                                                  //     Get.toNamed(CategorywisePrdctslistView.routeName, arguments:data);
                                                  //     // Get.toNamed(ViewAllProductsList.routeName, arguments:{'products':  data['Products'], 'categories': Categories,"title":Categories[0]["SubCategory"]});
                                                  //   }else{
                                                  //     Logger.showWarningAlert("Alert", "No Data Found");
                                                  //   }
                                                  //
                                                  // });
                                                },
                                                child: Text('More ...',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.bold)),
                                              ),
                                            ],
                                          )),
                                    ],
                                  )),
                              const SizedBox(height: 10,),
                              homeState.products!.isNotEmpty
                                  ?Padding(
                                padding: EdgeInsets.all(2),
                                child: CarouselSlider(
                                    options: CarouselOptions(
                                        height: 200,
                                        initialPage: 0,
                                        viewportFraction: 0.5,
                                        autoPlay: false,
                                        aspectRatio: 16/9,
                                        reverse: false,
                                        autoPlayInterval:
                                        const Duration(seconds: 5)),
                                    items: homeState.products!.map((item) {
                                      return Container(
                                        padding: EdgeInsets.all(0.5),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(8)),
                                        child: Card(
                                          elevation: 5,
                                          child: ProductItem(
                                            //   ImageName: "${Constants.ProductImg_URL}${item['SmallImagePath']}",
                                            ImageName: item.smallImagePath,
                                            Name: item.name,
                                            SKU: item.pcode,

                                          ),
                                        ),
                                      );
                                    }).toList()),
                              )
                                  :const Center()
                            ],
                          ))),
                ]),
              ),
      ),
    );
  }

  _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();

  }



  showLogoutDialog(BuildContext context, WidgetRef ref){
    showDialog(
        context: context,
        builder:(_){
          return AlertDialog(
            title: const Text('Are you sure?'),
            content: const Text('Do you want to logout?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () async {
                  await ref.read(authProvider.notifier).logout();
                  // Navigator.pop(context);
                  // WidgetsBinding.instance.addPostFrameCallback((_) {
                  //   Get.offAllNamed(Main.routeName);
                  // });
                },
                child: const Text('YES'),
              ),
            ],
          );
        });
  }

}
class ProductItem extends StatelessWidget {
  final String? ImageName;
  final String? Name;
  final String? SKU;
  // final GlobalKey widgetKey = GlobalKey();
  ProductItem({super.key,
    required this.ImageName,required this.Name,required this.SKU

  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        InkWell(
          onTap: (){
            //Repository().getSingleProduct(SKU.toString());
          },
          child: Column(
            // direction: Axis.vertical,
            children: [
              Container(
                // key: widgetKey,
                child: CachedNetworkImage(
                  width: 180,
                  height: 125,
                  imageUrl:
                  "${Constants.ProductImg_URL}${ImageName}",
                  placeholder: (context, url) =>
                  const SizedBox(
                      height: 30,
                      width: 30,
                      child: Center(
                          child:
                          CircularProgressIndicator())),
                  errorWidget:
                      (context, url, error) =>
                      Container(
                        padding: EdgeInsets.all(8),
                        child: Image.asset(
                            '${Constants.ImagePath}noproduct.jpg'),
                      ),
                ),
              ),

              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 10,right: 5),
                height: 40,
                child: Text(
                  "${Name ?? ''}",
                  maxLines: 2,
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.bold,
                      fontSize: 12
                  ),

                ),),
            ],

          ),
        ),

      ],
    );

  }


}
