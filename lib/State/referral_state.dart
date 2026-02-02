

import 'package:victous/Model/referal_model.dart';


class ReferralState {
  final bool? isLoading;
  final List<ReferralModel>? referralList;

  ReferralState({
    this.isLoading = false,
    this.referralList = const [],
  });

  ReferralState copyWith({
    bool? isLoading,
    List<ReferralModel>? referralList,
  }) {
    return ReferralState(
      isLoading: isLoading ?? this.isLoading,
      referralList: referralList ?? this.referralList,
    );
  }
}
