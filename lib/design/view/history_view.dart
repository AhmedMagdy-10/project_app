import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_app/design/view/widgets/history_item.dart';
import 'package:project_app/logic/cubit/rate_note_cubit/add_note_cubit.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text(
          'History',
          style: TextStyle(
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => AddNoteCubit()..fetchAllNotes(),
        child: const Padding(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: HistorItemList(),
          ),
        ),
      ),
    );
  }
}
