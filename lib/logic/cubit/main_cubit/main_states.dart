abstract class MainCubitStates {}

class MainInitailStates extends MainCubitStates {}

class MainSuccessState extends MainCubitStates {}

class MainErrorState extends MainCubitStates {
  final String errorMassage;

  MainErrorState({required this.errorMassage});
}

class MainLoadingState extends MainCubitStates {}

class ChangePages extends MainCubitStates {}
