import 'package:flutter/material.dart';
import 'package:project_app/logic/data/localData/history_data.dart';
import 'package:project_app/logic/data/models/history_item_model.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem({super.key, required this.model});
  final HistoryItemModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 24, bottom: 24, left: 16),
      decoration: BoxDecoration(
          color: model.color, borderRadius: BorderRadius.circular(16)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        ListTile(
          title: Row(
            children: [
              Text(
                ' Rate :  ${model.title} ',
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
              onPressed: () {},
              icon: const Icon(
                Icons.delete_sharp,
                color: Colors.black,
                size: 30,
              )),
          subtitle: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(
              'Condition : ${model.subtitle}',
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
        const Padding(
          padding: EdgeInsets.only(right: 24),
          child: Text(
            '4/18/2024',
            style: TextStyle(color: Colors.black, fontSize: 16),
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
    return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return HistoryItem(model: historyData[index]);
        },
        separatorBuilder: (context, index) => const SizedBox(
              height: 16,
            ),
        itemCount: historyData.length);
  }
}
