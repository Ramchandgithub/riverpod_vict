

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:victous/State/payout_onhold_state.dart';
import 'package:victous/services/repository.dart';


final payoutProvider = StateNotifierProvider<PayoutOnholdNotifier, PayoutOnholdState>((ref)=> PayoutOnholdNotifier(ref));


class PayoutOnholdNotifier extends StateNotifier<PayoutOnholdState>{
  final Ref ref;
  PayoutOnholdNotifier(this.ref) : super(PayoutOnholdState());


  Future<void> load(String action) async {
    state = state.copyWith(isLoading: true);
    final data = await ref.read(repoProvider.notifier).getPayoutReport("MemberPayoutOnHold");
    state = state.copyWith(isLoading: false, list: data);

  }

  void search(String text){
    final filtered = state.payoutlist.where((e) =>
      e.memberId.toString().contains(text) ||
        e.name!.toLowerCase().contains(text.toLowerCase())
    ).toList();

    state = state.copyWith(search: text, list: filtered);
  }

  void clearSearch(){
    load("MemberPayoutOnHold");
  }

}

