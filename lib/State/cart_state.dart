
import 'package:flutter/cupertino.dart';
import 'package:victous/model/cart_model.dart';

@immutable
class CartState{
  final bool isLoading;
  final int count;
  final double totalAmount;
  final double totalDpAmount;
  final double totalGst;
  final double totalTaxable;
  final double totalCourier;
  final double totalOfferCourier;
  final double totalBV;
  final int totalQty;
  final int totalOfferQty;
  final double totalOfferGst;
  final List<CartModel> items;

  const CartState({
  this.isLoading = true,
    this.count = 0,
    this.totalAmount = 0.0,
    this.totalGst = 0.0,
    this.totalDpAmount = 0.0,
    this.totalCourier = 0.0,
    this.totalTaxable = 0.0,
    this.totalBV = 0.0,
    this.totalOfferGst = 0.0,
    this.totalQty = 0,
    this.totalOfferQty = 0,
    this.totalOfferCourier = 0.0,
    this.items = const [],

});

  CartState copyWith({
    bool? isLoading,
    int? count,
    double? totalAmount,
    double? totalGst,
    double? totalDpAmount,
    double? totalCourier,
    double? totalTaxable,
    double? totalBV,
    double? totalOfferGst,
    double? totalOfferCourier,
    int? totalQty,
    int? totalOfferQty,
    List<CartModel>? items

}){
    return CartState(

        isLoading: isLoading ?? this.isLoading,
        count : count ?? this.count,
        totalAmount: totalAmount ?? this.totalAmount,
        totalBV: totalBV ?? this.totalBV,
        totalCourier: totalCourier ?? this.totalCourier,
        totalTaxable:  totalTaxable ?? this.totalTaxable,
        totalOfferQty : totalOfferQty ?? this.totalOfferQty,
        totalQty: totalQty ?? this.totalQty,
        totalOfferCourier: totalOfferCourier ?? this.totalOfferCourier,
        totalOfferGst: totalOfferGst ?? this.totalOfferGst,
        totalGst: totalGst ?? this.totalGst,
        totalDpAmount: totalDpAmount ?? this.totalDpAmount,
        items:  items ?? this.items,
    );

}


}