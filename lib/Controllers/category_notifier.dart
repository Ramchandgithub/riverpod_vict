

import 'package:flutter_riverpod/legacy.dart';
import 'package:victous/State/category_prdcts_state.dart';
import 'package:victous/Utils/logger.dart';

import '../model/product_model.dart';

final categoryProductsProvider = StateNotifierProvider<CategoryNotifier, CategoryPrdctsState>((ref) => CategoryNotifier());


class CategoryNotifier extends StateNotifier<CategoryPrdctsState> {
  CategoryNotifier() : super(CategoryPrdctsState.initial());

  void initData({
    required List<Products> products,
    required List<Categories> categories,
  }) {
    final health = products.where((e) => e.category == "Healthcare Products").toList();

    final marketing = products.where((e) => e.category != "Healthcare Products").toList();

    state = state.copyWith(
      products: products,
      categories: categories,
      healthPrdcts: health,
      marketingPrdcts: marketing,
      isHealth: true,
    );
  }



   selectCategory(bool isHealth) {
    state = state.copyWith(isHealth: isHealth);
  }

}