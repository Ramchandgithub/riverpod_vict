
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_super_html_viewer/utils/shims/dart_ui_real.dart';
import 'package:get/get.dart';
import 'package:victous/Controllers/cart_notifier.dart';
import 'package:victous/Controllers/category_notifier.dart';
import 'package:victous/Widgets/leadingIconWidget.dart';
import 'package:victous/services/repository.dart';
import '../Utils/constants.dart';
import '../Utils/logger.dart';
import '../Utils/session_manager.dart';
import '../model/product_model.dart';
import 'cart_view.dart';
import 'login_view.dart';

class CategoryPrdctsView extends ConsumerStatefulWidget {
  const CategoryPrdctsView({super.key});
  static const String routeName = '/CategoryPrdctsView';

  @override
  ConsumerState<CategoryPrdctsView> createState() => _CategoryPrdctsViewConsumerState();
}

class _CategoryPrdctsViewConsumerState extends ConsumerState<CategoryPrdctsView> {

  var args;

  @override
  void initState(){
    super.initState();

    args = Get.arguments;
    Logger.logger("args:::%$args");

    final List<Products> products = args['Products'].map<Products>((e) => Products.fromJson(e)).toList();
    final List<Categories> categories = args['Categories'].map<Categories>((e) => Categories.fromJson(e)).toList();

    Logger.logger("products:::${products.length}");
    Logger.logger("category:::${categories.length}");
    
    WidgetsBinding.instance.addPostFrameCallback((_){
      ref.read(categoryProductsProvider.notifier).initData(products: products, categories: categories);
    });
    
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(categoryProductsProvider);
    final cartprovider = ref.watch(cartProvider);
    return Scaffold(
      appBar: AppBar(
        leading: LeadingIconWidget(),
        title: const Text("Categories", style: TextStyle(color: Colors.white, fontSize: 14),),
        actions: [


          // FadeInUp(
          //   child: Stack(
          //     children: [
          //       Container(
          //         padding: EdgeInsets.only(right: 15),
          //         child: Center(
          //           child: Icon(
          //             Icons.shopping_cart,
          //             size: 25,
          //             color: Colors.white,
          //           ),
          //         ),
          //       ),
          //       Positioned(
          //         right: 10,
          //         top: 7,
          //         child: CircleAvatar(
          //           backgroundColor: Colors.white,
          //           radius: 10,
          //           child: Center(
          //             child:
          //
          //
          //             // Obx(
          //             //       () => Text(
          //             //     '${cartController.count}',
          //             //     style: TextStyle(
          //             //         fontSize: 10, fontWeight: FontWeight.bold),
          //             //   ),
          //             // ),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),

          Padding(
            padding: EdgeInsets.all(8),
            child: InkWell(
              onTap: () async {
                if ( SessionManager.getInt(Constants.PREF_CartCount) == 0) {

                  Logger.showWarningAlert('Warning', "Your Cart Is Empty");
                } else {
                 final returnCart= await ref.read(cartProvider.notifier).viewCartItems();
                 Logger.logger("return data:::${returnCart}");
                 Logger.logger("count:::${cartprovider.count}");
                 if(returnCart.length > 0){
                   Get.toNamed(CartView.routeName, arguments: returnCart);
                 } else{
                   Logger.showWarningAlert("Alert", "No Data Related to Cart");
                 }
                }
              },
              child: Stack(
                children: [
                  Container(

                    padding: EdgeInsets.only(right: 15),
                    child: Center(
                      child: Icon(
                        Icons.shopping_cart,
                        size: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,right: 10,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 10,
                      child: Center(child: Text('${SessionManager.getInt(Constants.PREF_CartCount)}', style: TextStyle(color: Colors.black, fontSize: 10),)),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      body:
      Padding(
        padding: EdgeInsets.all(3.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Expanded(
             flex: 1,
             child: ListView.builder(
               shrinkWrap: true,
                itemCount: state.categories.length,
                 itemBuilder: (context, index){
               return InkWell(
                 onTap: ()async {
                   await ref.read(categoryProductsProvider.notifier).selectCategory(state.categories[index].subCategory == "Healthcare");

                   final value = await ref.read(categoryProductsProvider.notifier);
                   print("value:::$value");


                 },
                 child: Card(
                   elevation: 3,
                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                   child: Column(
                     children: [
                       CachedNetworkImage(imageUrl: '${Constants.categoriesUrl}${state.categories[index].mobBannerImage}'),
                       const SizedBox(height: 20,),

                     ],
                   ),
                 ),
               );
             }),
           ),
           Container(
             color: Colors.grey,
             width: 1,
           ),

            Expanded(
              flex: 3,
              child: GridView.builder(

                itemCount: state.isHealth ? state.healthPrdcts.length : state.marketingPrdcts.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.90),
                  itemBuilder: (BuildContext context, int index){
                    return Container(
                      height: Get.height/4,

                      child: Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Stack(
                          children: [
                            CachedNetworkImage(
                              height: Get.height/4,
                              fit: BoxFit.fitHeight,
                              imageUrl: state.isHealth ? '${Constants.ProductImg_URL}${state.healthPrdcts[index].thumbImage}': '${Constants.ProductImg_URL}${state.marketingPrdcts[index].thumbImage}'),


                            Positioned(
                              bottom: 3,
                              right: 10,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  side: BorderSide(color: Colors.red,style: BorderStyle.solid, strokeAlign: BorderSide.strokeAlignInside, width: 2),
                                  // padding: EdgeInsets.all(0.0),
                                  // fixedSize: const Size(40, 3),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                                ),
                                onPressed: () async {
                                  if (SessionManager.getBool(Constants.loginState) == true) {
                                   final returnData =  await ref.read(cartProvider.notifier).addCartProduct(pid: state.products[index].pid.toString(), qty: "1", fromPackage: "nopackage");
                                   Logger.logger("return data:::$returnData");

                                  } else {
                                    Get.toNamed(LoginView.routeName);
                                  }
                                },
                                child: const Icon(Icons.add, size: 16,weight: 30,),
                              ),
                            )

                          ],
                        ),
                      ),
                    );
                  }),
            )


          ],
        ),
      ),
    );
  }

}
