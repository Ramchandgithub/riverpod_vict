import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:victous/Controllers/auth_controller.dart';
import 'package:victous/Presentation/main_view.dart';
import 'package:victous/State/auth_state.dart';
import 'package:victous/Widgets/leadingIconWidget.dart';
import 'package:victous/Widgets/sub_child_item.dart';
import 'package:victous/Widgets/sub_header.dart';
import 'package:victous/model/dashboard_tile_model.dart';
import '../Controllers/dashboard_notifier.dart';
import '../Utils/constants.dart';
import '../Utils/logger.dart';
import '../Widgets/bsuiness_summary_grid_widget.dart';


// final authState = Provider((ref) => AuthState(isLoading: false, isLoggedIn: , UserId: UserId, UserName: UserName, ip: ip, error: error));


class Dashboard extends ConsumerStatefulWidget {
  const Dashboard({super.key});
  static const String routeName = '/Dashboard';

  @override
  ConsumerState<Dashboard> createState() => _DashboardConsumerState();
}

class _DashboardConsumerState extends ConsumerState<Dashboard> {

  var args;
  var tiles;
  @override
  void initState(){
    super.initState();


    args = Get.arguments;
    Logger.logger("Args:::$args");
     // tiles = buildDashboardTiles(args, purchageCount);

  }

  @override
  Widget build(BuildContext context) {

    final dahsboardData = ref.watch(dashboardProvider);

    return Scaffold(
      appBar: AppBar(
        leading: LeadingIconWidget(),
        title: const Text("Dashboard", style: TextStyle(color: Colors.white, fontSize: 14),),),
      body:
      dahsboardData.isLoading== true ? const Center(child: CircularProgressIndicator(),)
     :  SingleChildScrollView(
        child:  Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                width: Get.width,
                height: 30,
                decoration: BoxDecoration(
                    color: Constants.hexToColor('#792B90'),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
                ),
                child: Text('My Profile', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
              ),
              Card(
                color: Colors.white,
                elevation: 3,
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      SubChildItem("Associate ID", dahsboardData.data?.idno ?? '', true),
                      SubChildItem("Name", '${dahsboardData.data?.name}', true),
                      SubChildItem("SignUp Data", '${dahsboardData.data?.joinDate}', true),
                      SubChildItem("Activated Date", '${dahsboardData.data?.stsDate}', true),
                      SubChildItem("Last Purchase Data", '${dahsboardData.data?.lastorderdateandpv}', true),
                      SubChildItem("Next Purchase Date", '${dahsboardData.data?.nextPurchaseDate}', false),

                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Container(
                width: Get.width,
                height: 30,
                decoration: BoxDecoration(
                    color: Constants.hexToColor('#792B90'),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
                ),
                child: Text('My Profile', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
              ),
              Card(
                color: Colors.white,
                elevation: 3,
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      SubChildItem("Bank", '${dahsboardData.data?.banksts}', true),
                      SubChildItem("PAN", '${dahsboardData.data?.pansts}', true),
                      SubChildItem("Address", '${dahsboardData.data?.addresssts}', true),
                      SubChildItem("ID Proof", '${dahsboardData.data?.idproofsts}', true),

                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Container(
                width: Get.width,
                height: 30,
                decoration: BoxDecoration(
                    color: Constants.hexToColor('#792B90'),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
                ),
                child: Text('My Business Summary', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
              ),
              const SizedBox(height: 10,),



      //   GridView.builder(
      //   shrinkWrap: true,
      //   physics: const NeverScrollableScrollPhysics(),
      //   itemCount: tiles.length,
      //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 2,
      //     mainAxisExtent: 150,
      //   ),
      //   itemBuilder: (_, i) {
      //     final t = tiles[i];
      //
      //     return Card(
      //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      //       color: Theme.of(context).primaryColor,
      //       child: Padding(
      //         padding: const EdgeInsets.all(3),
      //         child: t.custom ??
      //             businesSummeryGridWidget(
      //               t.icon,
      //               t.title,
      //               t.value,
      //               Colors.white,
      //             ),
      //       ),
      //     );
      //   },
      // );


      // GridView.builder(
              //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.68),
              //     itemBuilder: (BuildContext context, int index){
              //       return Container(
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(10),
              //           color: Theme.of(context).primaryColor
              //         ),
              //         child: BusinesSummeryGridWidget(),
              //       );
              //     },
              //   itemCount: 7,),

            ],
          ),
        ),
      ),
    );
  }
}

// List<DashboardTile> buildDashboardTile(DashboardTile t, Duration puchaseCount){
//   return [
//     DashboardTile(title: "Total Payout", icon: '', value: "" ),
//     DashboardTile(title: "Self PV", icon: '', value: dahsboardData!.selfTotPV.toString() ),
//     // DashboardTile(title: "Puchase Countdown \n Purchase Required", icon: '', value: dahsboardData.t ),
//     DashboardTile(title: "Total Payout", icon: '', value: "" ),
//     DashboardTile(title: "Total Payout", icon: '', value: "" ),
//     DashboardTile(title: "Total Payout", icon: '', value: "" ),
//   ];
// }
