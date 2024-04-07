abstract class MainCubitStates {}

class MainInitailStates extends MainCubitStates {}

class MainSuccessState extends MainCubitStates {}

class MainErrorState extends MainCubitStates {
  final String errorMassage;

  MainErrorState({required this.errorMassage});
}

class MainLoadingState extends MainCubitStates {}

class ChangePages extends MainCubitStates {}

class UploadProfileImageSuccess extends MainCubitStates {
  final String massage;

  UploadProfileImageSuccess({required this.massage});
}

class UploadProfileImageFailed extends MainCubitStates {
  final String massage;

  UploadProfileImageFailed({required this.massage});
}
