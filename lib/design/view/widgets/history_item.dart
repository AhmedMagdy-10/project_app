import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_app/logic/cubit/rate_note_cubit/add_note_cubit.dart';
import 'package:project_app/logic/cubit/rate_note_cubit/add_note_states.dart';
import 'package:project_app/logic/data/models/rate_model.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem({super.key, required this.rateModel});
  final RateModel rateModel;

  @override
  Widget build(BuildContext context) {
    Color getColor() {
      if (rateModel.rate > 100 && rateModel.rate < 60) {
        return Colors.red;
      } else if (rateModel.rate == 60 && rateModel.rate == 100) {
        return Colors.limeAccent;
      } else {
        return Colors.green;
      }
    }

    String getConditoin() {
      if (rateModel.rate > 100 && rateModel.rate < 60) {
        return 'Danger';
      } else if (rateModel.rate == 60 && rateModel.rate == 100) {
        return 'Warning ';
      } else {
        return 'Normal';
      }
    }

    final color = getColor();

    return Container(
      padding: const EdgeInsets.only(top: 24, bottom: 24, left: 16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        ListTile(
          title: Row(
            children: [
              Text(
                ' Rate :  ${rateModel.rate} ',
                style: const TextStyle(
                  fontSize: 26,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Bp/m',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          trailing: IconButton(
              onPressed: () {
                rateModel.delete();
                BlocProvider.of<AddNoteCubit>(context).fetchAllNotes();
              },
              icon: const Icon(
                Icons.delete_sharp,
                color: Colors.black,
                size: 30,
              )),
          subtitle: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(
              'Condition : ${getConditoin()}',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 24),
          child: Text(
            rateModel.date,
            style: const TextStyle(color: Colors.black, fontSize: 16),
          ),
        )
      ]),
    );
  }
}

class HistorItemList extends StatelessWidget {
  const HistorItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddNoteCubit, AddNoteStates>(builder: (context, state) {
      List<RateModel> rateList = BlocProvider.of<AddNoteCubit>(context).rate!;
      return ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return HistoryItem(rateModel: rateList[index]);
          },
          separatorBuilder: (context, index) => const SizedBox(
                height: 16,
              ),
          itemCount: rateList.length);
    });
  }
}
