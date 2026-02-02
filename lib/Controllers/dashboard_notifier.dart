

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:victous/State/dashboard_state.dart';
import 'package:victous/services/repository.dart';

import '../Utils/logger.dart';

final dashboardProvider = StateNotifierProvider<DashboardNotifier, DashboardState>((ref)=>DashboardNotifier(ref));

class DashboardNotifier extends StateNotifier<DashboardState>{
  final Ref ref;
  DashboardNotifier(this.ref): super(DashboardState());

  Future<dynamic> load() async{
    try{
      // state = state.copyWith(isLoading: true);
      final resp = await ref.read(repoProvider.notifier).getDashboardData();
      state = state.copyWith(isLoading: false, data: resp);
    } catch(e){
      state = state.copyWith(isLoading: false, error: e.toString());
    }
    
  }

}