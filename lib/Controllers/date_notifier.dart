


import 'package:flutter_riverpod/legacy.dart';
import 'package:victous/State/date_filter_state.dart';


final DateFilterProvider = StateNotifierProvider<DateFilterNotifier, DateFilterState>((ref) => DateFilterNotifier());

class DateFilterNotifier  extends StateNotifier<DateFilterState>{
  DateFilterNotifier() : super( DateFilterState());

  void changeGroup(int val) {
   if(val == 0){
     state = state.copyWith(groupValue: 0,onDate: '', fromDate:'', toDate: '');
   } else if(val == 1){
     state = state.copyWith(groupValue: 1,fromDate: '', toDate: '' );
   } else{
     state = state.copyWith(groupValue: 2, onDate: '');
   }
  }

  void setOnDate(String v) => state = state.copyWith(onDate: v);
  void setFromDate(String v) => state = state.copyWith(fromDate: v);
  void setToDate(String v) => state = state.copyWith(toDate: v);
  void setPayno(int i) => state = state.copyWith(paynoIndex: i);
  void setOption(int i) => state = state.copyWith(optionIndex: i);

}
