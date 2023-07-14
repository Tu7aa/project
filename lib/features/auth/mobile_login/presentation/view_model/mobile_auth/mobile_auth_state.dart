part of 'mobile_auth_cubit.dart';

@immutable
abstract class MobileAuthState {}

class MobileAuthInitial extends MobileAuthState {}

class MobileAuthLoading extends MobileAuthState {}
class MobileAuthFailure extends MobileAuthState {
  final String errMess;
  MobileAuthFailure({ required this.errMess});
}
class MobileAuthSuccess extends MobileAuthState {}

class MobileAuthOTPVerified extends MobileAuthState {}