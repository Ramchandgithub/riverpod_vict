import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:victous/Widgets/leadingIconWidget.dart';
import 'package:victous/services/repository.dart';
import '../Utils/constants.dart';
import '../Utils/logger.dart';
import '../Utils/session_manager.dart';
import '../Utils/statemodel.dart';
import 'category_prdcts_view.dart';



class PurchaseSelectionView extends ConsumerStatefulWidget {
  const PurchaseSelectionView({super.key});
  static const String routeName = '/PurchaseSelectionView';

  @override
  ConsumerState<PurchaseSelectionView> createState() => _PurchaseSelectionViewConsumerState();
}

class _PurchaseSelectionViewConsumerState extends ConsumerState<PurchaseSelectionView> {

  var args;
  List<StateModel> purchaseType = [];
  int ind = 0;
  bool isLoading = true;

  @override
  void initState(){
    super.initState();
    purchaseType.add(StateModel(Value: "0", Text: "Select Purchase Type"));
    args = Get.arguments;

    Logger.logger("args:::$args");
    purchaseType.addAll(args.map<StateModel>((e) => StateModel.cityJson(e)));
    Logger.logger("purchase type ::$purchaseType");
    setState(() {
      isLoading = false;
    });

  }


  @override
  Widget build(BuildContext context) {

    
    final repoState = ref.watch(repoProvider);
    return Scaffold(
      appBar: AppBar(
        leading: LeadingIconWidget(),
        title: const Text("Purchase Selection", style: TextStyle(color: Colors.white, fontSize: 16),),
      ),

      body:
      isLoading
        ? const Center()
      : SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            children: [

              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 4.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Constants().black)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<StateModel>(
                      iconEnabledColor: Theme.of(context).primaryColor,
                      isExpanded: true,
                      hint: Text(
                        purchaseType[ind].Text,
                        style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 15.0,
                            fontFamily: 'Nunito'),
                      ),
                      items: purchaseType.map((StateModel map) {
                        return DropdownMenuItem<StateModel>(
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
                        setState(() {
                          ind = purchaseType.indexOf(value!);
                        });
                      }),
                ),
              ),
              const SizedBox(height: 20,),
              ElevatedButton(
                onPressed: () async {
                  if(purchaseType[ind].Text == 'Select Purchase Type'){
                    Logger.showWarningAlert("Alert", "Please Select Purchase Type");
                  } else{
                    SessionManager.setString(Constants.OrderPurchaseType, purchaseType[ind].Value);
                    final resp = await ref.read(repoProvider.notifier).callProductsData();
                    Logger.logger("resp:::$resp");
                    if(resp.toString() != ''){
                          Get.toNamed(CategoryPrdctsView.routeName, arguments: resp);
                    } else{
                      Logger.showWarningAlert("Alert", "No Products");
                    }
                  }

                },
                child: const Text('SUBMIT', style: TextStyle(color: Colors.white),),
              )

            ],
          ),
        ),
      ),
    );
  }
}
