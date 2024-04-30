import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:project_app/logic/cubit/rate_note_cubit/add_note_states.dart';
import 'package:project_app/logic/data/models/rate_model.dart';

class AddNoteCubit extends Cubit<AddNoteStates> {
  AddNoteCubit() : super(InitialAddNotesSates());

  addNote(RateModel note) async {
    emit(LoadingAddNotesSates());
    try {
      var noteBox = Hive.box<RateModel>('RateModelBox');
      await noteBox.add(note);
      emit(SuccessAddNotesSates());
    } catch (e) {
      emit(FailureAddNotesSates(errorMassage: e.toString()));
    }
  }

  List<RateModel>? rate;
  fetchAllNotes() {
    var noteBox = Hive.box<RateModel>('RateModelBox');

    rate = noteBox.values.toList();
    emit(RefreshNotesCubit());
  }
}
