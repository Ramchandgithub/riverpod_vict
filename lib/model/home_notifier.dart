

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:victous/State/home_state.dart';
import 'package:victous/services/repository.dart';

import '../Utils/logger.dart';
import 'home_model.dart';

final homeProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) =>HomeNotifier(ref)); //

class HomeNotifier extends StateNotifier<HomeState>{
  final Ref ref;
  HomeNotifier(this.ref): super(HomeState());

  Future<dynamic> load() async{
    state = state.copyWith(isLoading: true);
    final resp = await  ref.read(repoProvider.notifier).GetHomeData();
    Logger.logger("resp:::${resp}");
    // state = state.copyWith(isLoading: false, banners: resp['Banners'], ingredients: resp['Ingredients'], popupImages: resp['PopupImages'], products: resp['Products'], categories: resp['Categories']);
    state = state.copyWith(
      isLoading: false,
      banners: (resp['Banners'] as List).map((e) => Banners.fromJson(e)).toList(),
      popupImages: List<String>.from(resp['PopupImages']),
      products: (resp['Products'] as List).map((e) => Products.fromJson(e)).toList(),
      ingredients: (resp['Ingredients'] as List).map((e) => Ingredients.fromJson(e)).toList(),
      categories: (resp['Categories'] as List).map((e) => Categories.fromJson(e)).toList(),
    );

  }
}