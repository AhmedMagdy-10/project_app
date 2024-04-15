abstract class MainCubitStates {}

class MainInitailStates extends MainCubitStates {}

class MainSuccessState extends MainCubitStates {}

class MainErrorState extends MainCubitStates {
  final String errorMassage;

  MainErrorState({required this.errorMassage});
}

class MainLoadingState extends MainCubitStates {}

class ChangePages extends MainCubitStates {}

class GetProfileImageSuccess extends MainCubitStates {}

class GetProfileImageFailed extends MainCubitStates {}

class UploadImageLoadingState extends MainCubitStates {}

class UploadImageSucessState extends MainCubitStates {}

class UploadImageErrorState extends MainCubitStates {
  final String error;

  UploadImageErrorState(
    this.error,
  );
}

class UpdateUserDataLoading extends MainCubitStates {}

class UpdateUserDataSuccess extends MainCubitStates {}

class UpdateUserDataError extends MainCubitStates {
  final String error;

  UpdateUserDataError({required this.error});
}

class LoadingUser extends MainCubitStates {}

class UserSuccess extends MainCubitStates {}

class UserError extends MainCubitStates {
  final String error;

  UserError({required this.error});
}
