

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:victous/State/referral_state.dart';
import 'package:victous/services/repository.dart';


final referralProvider = StateNotifierProvider<ReferralNotifier, ReferralState>((ref) => ReferralNotifier(ref));

class ReferralNotifier extends StateNotifier<ReferralState>{
  final Ref ref;
  ReferralNotifier(this.ref): super(ReferralState());

  Future<dynamic> load() async {
    state = state.copyWith(isLoading: true);
    final resp =  await ref.read(repoProvider.notifier).getMyReferralsRpt();
    //state = state.copyWith(isLoading: false, referralList: resp );

  }
}