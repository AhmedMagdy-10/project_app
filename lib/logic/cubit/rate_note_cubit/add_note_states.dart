abstract class AddNoteStates {}

class InitialAddNotesSates extends AddNoteStates {}

class LoadingAddNotesSates extends AddNoteStates {}

class SuccessAddNotesSates extends AddNoteStates {}

class FailureAddNotesSates extends AddNoteStates {
  final String errorMassage;

  FailureAddNotesSates({required this.errorMassage});
}

class InitialNotesCubit extends AddNoteStates {}

class RefreshNotesCubit extends AddNoteStates {}
