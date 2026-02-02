

class DateFilterState {
  final int groupValue;
  final String onDate;
  final String fromDate;
  final String toDate;
  final int paynoIndex;
  final int optionIndex;
  DateFilterState({
     this.groupValue = 0,
     this.onDate = '',
     this.fromDate = '',
     this.toDate = '',
     this.paynoIndex = 0,
     this.optionIndex = 0

});

  DateFilterState copyWith({
    int? groupValue,
    String? onDate,
    String? fromDate,
    String? toDate,
    int? paynoIndex,
    int? optionIndex


}){
    return DateFilterState(
      groupValue:  groupValue ?? this.groupValue,
      onDate: onDate ?? this.onDate,
      fromDate: fromDate ?? this.fromDate,
      toDate: toDate ?? this.toDate,
      paynoIndex: paynoIndex ?? this.paynoIndex,
      optionIndex:  optionIndex ?? this.optionIndex
    );

}
}