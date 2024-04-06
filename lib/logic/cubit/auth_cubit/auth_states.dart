abstract class AuthState {}

class InitialState extends AuthState {}

class LoadingLoginState extends AuthState {}

class SuccessLoginState extends AuthState {
  final String uId;

  SuccessLoginState({required this.uId});
}

class FailureLoginState extends AuthState {
  FailureLoginState({required this.errorMassage});
  final String errorMassage;
}

class InitialRegisterState extends AuthState {}

class LoadingRegisterState extends AuthState {}

class SuccessRegisterState extends AuthState {}

class FailureRegisterState extends AuthState {
  FailureRegisterState({required this.errorMassage});
  final String errorMassage;
}

class ChangePasswordShowState extends AuthState {}
