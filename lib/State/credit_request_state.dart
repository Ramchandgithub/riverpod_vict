


import 'package:victous/Utils/statemodel.dart';

class CreditRequestState {
  final double balanceAmnt;
  final double rqstAmnt;
  final int modeOfPymntIndex;
  final String transactionDate;
  final String base64Img;
  final String transactionId;
  final bool isImagePicked;
  final String rmrks;
  final int bankIndex;
  final List<StateModel> modes;
  final List<StateModel> banks;

  CreditRequestState({
   this.balanceAmnt = 0.0,
    this.rqstAmnt = 0.0,
    this.modeOfPymntIndex = 0,
    this.base64Img = '',
    this.isImagePicked = false,
    this.rmrks = '',
    this.transactionDate  = '',
    this.transactionId = '',
    this.banks = const [],
    this.modes = const [],
    this.bankIndex = 0,


});

  CreditRequestState copyWith({
    double? balanceAmnt,
    double? rqstAmnt,
    int? modeOfPymntIndex,
    String? transactionDate,
    String? base64Img,
    String? transactionId,
    bool? isImagePicked,
    String? rmrks,
    List<StateModel>? modes,
    List<StateModel>? banks,
    int? bankIndex,
}){

    return CreditRequestState(
      balanceAmnt: balanceAmnt ?? this.balanceAmnt,
      rqstAmnt:  rqstAmnt ?? this.rqstAmnt,
      modeOfPymntIndex: modeOfPymntIndex ?? this.modeOfPymntIndex,
      transactionDate:  transactionDate ?? this.transactionDate,
      base64Img: base64Img ?? this.base64Img,
      transactionId: transactionId ?? this.transactionId,
      isImagePicked:  isImagePicked ?? this.isImagePicked,
      rmrks: rmrks ?? this.rmrks,
      banks: banks ?? this.banks,
      modes: modes ?? this.modes,
      bankIndex: bankIndex ?? this.bankIndex

    );

}


}