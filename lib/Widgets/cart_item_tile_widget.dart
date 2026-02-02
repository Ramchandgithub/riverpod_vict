

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:victous/Controllers/cart_notifier.dart';

import '../Utils/logger.dart';
import '../model/cart_model.dart';


class CartItemTile extends ConsumerWidget {
  final String pid;

  const CartItemTile({super.key, required this.pid});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(cartProvider.select((state) => state.items.firstWhere((e) => e.pid.toString() == pid),
      ),
    );

    return _QuantityStepper(item: item);
  }
}


class _QuantityStepper extends ConsumerWidget {
  final CartModel item;

  const _QuantityStepper({required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 30,
      padding: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        color: Colors.pink,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(icon:  Icon(Icons.remove, size: 12, color: Colors.white),onPressed: (){
            Logger.logger("tap on - icon");
              if(item.qty! - 1 == 0){
                Logger.logger("tap on - icon");
                ref.read(cartProvider.notifier).deleteCartProduct(item.pid.toString(),item.qty.toString(), "nopackage");
              } else{
                ref.read(cartProvider.notifier).updateCartProduct(
                  item.pid.toString(),
                  (item.qty! - 1).toString(),
                  "nopackage",
                );
              }
          },),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal:1),
            child: Text(
              item.qty.toString(), // ✅ always latest
              style: const TextStyle(color: Colors.white),
            ),
          ),

          IconButton(icon: Icon(Icons.add, size: 12, color: Colors.white,),
            onPressed: (){
              ref.read(cartProvider.notifier).updateCartProduct(
                item.pid.toString(),
                (item.qty! + 1).toString(),
                "nopackage",
              );
            },)

        ],
      ),
    );
  }
}


// class CartItemTile extends ConsumerWidget {
//   final CartModel item;
//
//   const CartItemTile({
//     super.key,
//     required this.item,
//   });
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final cartState = ref.watch(cartProvider);
//     final isLoading = cartState.isLoading;
//     print("isloading::${cartState.isLoading}");
//     print("isloading::${cartState.count}");
//
//     return Container(
//       height: 30,
//       padding: const EdgeInsets.symmetric(horizontal: 10),
//       decoration: BoxDecoration(
//         color: Colors.pink,
//         borderRadius: BorderRadius.circular(6),
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           _StepperButton(
//             icon: Icons.remove,
//            // disabled: isLoading ,
//             onTap: () {
//               Logger.logger("tap on - icon");
//               if(item.qty! - 1 == 0){
//
//                 Logger.logger("tap on - icon");
//                 ref.read(cartProvider.notifier).deleteCartProduct(item.pid.toString(),item.qty.toString(), "nopackage");
//               } else{
//                 ref.read(cartProvider.notifier).updateCartProduct(
//                   item.pid.toString(),
//                   (item.qty! - 1).toString(),
//                   "nopackage",
//                 );
//               }
//
//             },
//           ),
//
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 6),
//             child: Text(
//               item.qty.toString(),
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 12,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ),
//
//           _StepperButton(
//             icon: Icons.add,
//             //disabled: isLoading,
//             onTap: () {
//               Logger.logger("tap on + icon");
//               ref.read(cartProvider.notifier).updateCartProduct(
//                 item.pid.toString(),
//                 (item.qty! + 1).toString(),
//                 "nopackage",
//               );
//
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class _StepperButton extends StatelessWidget {
//   final IconData icon;
//   final VoidCallback onTap;
//   //final bool disabled;
//
//   const _StepperButton({
//     required this.icon,
//     required this.onTap,
//    // required this.disabled,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       // onTap: disabled ? null : onTap,
//       onTap:  onTap,
//       child: Icon(
//         icon,
//         size: 16,
//         color:  Colors.white,
//         // color: disabled ? Colors.white54 : Colors.white,
//       ),
//     );
//   }
// }






