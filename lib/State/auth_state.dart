import 'package:flutter/cupertino.dart';

@immutable
class AuthState {
  final bool isLoading;
  final bool isLoggedIn;
  final String userId;
  final String userName;
  final String ip;
  final String? error;

  const AuthState({
    required this.isLoading,
    required this.isLoggedIn,
    required this.userId,
    required this.userName,
    required this.ip,
    this.error,
  });

  factory AuthState.initial() {
    return const AuthState(
      isLoading: false,
      isLoggedIn: false,
      userId: '',
      userName: '',
      ip: '',
      error: null,
    );
  }

  AuthState copyWith({
    bool? isLoading,
    bool? isLoggedIn,
    String? userId,
    String? userName,
    String? ip,
    String? error,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      ip: ip ?? this.ip,
      error: error,
    );
  }
}
