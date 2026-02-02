/*RepoState is a state model.

It represents WHAT IS HAPPENING in your Repository at any moment.

In this case it answers questions like:

Is an API call in progress?

Did something go wrong?
final   ===> state should be immutable.
Riverpod depends on immutability to detect changes.
*/




import '../Utils/constants.dart';
import '../Utils/network_call.dart';
import '../Utils/session_manager.dart';

class RepoState{
  final bool isLoading;
  final String? error;
  RepoState({required this.isLoading, this.error});

 factory RepoState.initial(){
   return RepoState(isLoading: false);
 }

 RepoState copyWith({
   bool? isLoading,
   String? error

}){
   return RepoState(isLoading: isLoading ?? this.isLoading, error: error ?? this.error);

}

  Future getarchivedreport(from, to) async {
    Map<String, dynamic> params = {
      "rtype": "Archived_Orders",
      "Idno": SessionManager.getInt(Constants.PREF_Regid).toString(),
      "fromdate": from,
      "todate": to,
      "Reptype": -1,
      "RStatus": 0,
      "StateId": 0,
      "PageNumber": 0,
      "RowsCountPerPage": 0
    };
    final value = await  NetworkCall().onCallServer(endPoint: Constants.api_ArchievedReport, parameters: params);

    final data = NetworkCall.getParse(value);


    //     .then((
    //     value) {
    //   var data = NetworkCall.getParse(value);
    //   if (data.toString() == "") {
    //     Logger.showWarningAlert("Alert", "No Data Found");
    //   } else {
    //     if (data.length > 0) {
    //       Get.toNamed(ArchievedReportView.routeName, arguments: data);
    //     } else {
    //       Logger.showWarningAlert("Alert", "No Data Found");
    //     }
    //   }
    // });
  }


}