
import '../model/product_model.dart';


class CategoryPrdctsState {
  final List<Products> products;
  final List<Categories> categories;
  final List<Products> healthPrdcts;
  final List<Products> marketingPrdcts;
  final bool isHealth;

  CategoryPrdctsState({
    required this.products,
    required this.categories,
    required this.healthPrdcts,
    required this.marketingPrdcts,
    required this.isHealth,
  });

  factory CategoryPrdctsState.initial() {
    return CategoryPrdctsState(
      products: [],
      categories: [],
      healthPrdcts: [],
      marketingPrdcts: [],
      isHealth: true,
    );
  }

  CategoryPrdctsState copyWith({
    List<Products>? products,
    List<Categories>? categories,
    List<Products>? healthPrdcts,
    List<Products>? marketingPrdcts,
    bool? isHealth,
  }) {
    return CategoryPrdctsState(
      products: products ?? this.products,
      categories: categories ?? this.categories,
      healthPrdcts: healthPrdcts ?? this.healthPrdcts,
      marketingPrdcts: marketingPrdcts ?? this.marketingPrdcts,
      isHealth: isHealth ?? this.isHealth,
    );
  }
}
