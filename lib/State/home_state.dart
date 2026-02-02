
import '../model/home_model.dart';

class HomeState {
  final bool? isLoading;
  final List<Banners>? banners;
  final List<String>? popupImages;
  final List<Products>? products;
  final List<Ingredients>? ingredients;
 final List<Categories>? categories;
 final String error;

 HomeState({
   this.isLoading = false,
   this.banners = const [],
   this.popupImages = const [],
   this.products = const [],
   this.ingredients = const [],
   this.categories = const [],
   this.error = ''
});

 HomeState copyWith({
    bool? isLoading,
   List<Banners>? banners,
   List<String>? popupImages,
   List<Products>? products,
   List<Ingredients>? ingredients,
   List<Categories>? categories


}){
   return HomeState(
    isLoading: isLoading ?? this.isLoading,
     banners: banners ?? this.banners,
     popupImages: popupImages ?? this.popupImages,
     products: products ?? this.products,
     ingredients: ingredients ?? this.ingredients,
     categories: categories ?? this.categories
   );
}
}