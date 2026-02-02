
import 'package:victous/model/dashboard_model.dart';

class DashboardState {
  final bool? isLoading;
  final DashboardModel? data;
  final String? error;
  DashboardState({
    this.isLoading= false,  this.data, this.error,
});
  DashboardState copyWith({
  bool?  isLoading,
    DashboardModel? data,
    String? error
}){
    return DashboardState(
      isLoading: isLoading ?? this.isLoading,
      data: data ?? this.data,
      error: error ?? this.error
    );

}
}