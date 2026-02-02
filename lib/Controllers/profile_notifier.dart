
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:victous/State/profile_state.dart';
import 'package:victous/services/repository.dart';

final profileProvider = StateNotifierProvider<ProfileNotifier, ProfileState>((ref) => ProfileNotifier(ref));

class ProfileNotifier extends StateNotifier<ProfileState>{
  final Ref ref;
  ProfileNotifier(this.ref): super(ProfileState());


  Future<dynamic> load() async{
    state = state.copyWith(isLoading: true);
    final resp = await ref.read(repoProvider.notifier).getProfileData("");
    state = state.copyWith(isLoading: false, profileData: resp);
  }
}