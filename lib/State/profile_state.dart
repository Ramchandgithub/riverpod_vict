

import '../model/profile_model.dart';

class ProfileState {
  final bool? isLoading;
  final String? error;
  final List<ProfileModel?> profileData;
  ProfileState({
    this.isLoading = false,
    this.error = '',
    this.profileData = const []
});

  ProfileState copyWith({
    bool? isLoading,
    String? error,
    List<ProfileModel>? profileData,
}){
    return ProfileState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      profileData: profileData ?? this.profileData
    );

}
}