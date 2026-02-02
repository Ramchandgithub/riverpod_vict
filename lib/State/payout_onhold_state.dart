
import 'package:victous/model/payout_model.dart';

class PayoutOnholdState {
  final List<PayoutModel> payoutlist;
  final bool isLoading;
  final String search;

  PayoutOnholdState({
   this.payoutlist = const [],
    this.isLoading = false,
    this.search = ''

});

  PayoutOnholdState copyWith({
    List<PayoutModel>? list,
    bool? isLoading,
    String? search,

}){
    return PayoutOnholdState(
        payoutlist : list ?? this.payoutlist,
        isLoading:  isLoading ?? this.isLoading,
      search:  search ?? this.search
    );

}

}