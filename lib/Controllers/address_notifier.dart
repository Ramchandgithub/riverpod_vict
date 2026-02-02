

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:victous/services/repository.dart';
import '../model/address_model.dart';


final addressProvider = StateNotifierProvider<AddressNotifier, AsyncValue<List<AddressModel>>>((ref) => AddressNotifier(ref));

class AddressNotifier extends StateNotifier<AsyncValue<List<AddressModel>>>{
  final Ref ref ;
  AddressNotifier(this.ref) : super(const AsyncLoading());

  Future<void> load() async{
    try{
      final list = await ref.read(repoProvider.notifier).getshippingAddress();
      state = AsyncData(list);
    }catch(e, st){
      state = AsyncError(e, st);
    }
  }
}