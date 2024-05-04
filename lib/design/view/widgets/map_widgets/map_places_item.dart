import 'package:flutter/material.dart';
import 'package:project_app/constants/icon_broken.dart';
import 'package:project_app/logic/data/models/map_suggestion_model.dart';

class ResultsPlacesItem extends StatelessWidget {
  const ResultsPlacesItem({super.key, required this.placesModel});

  final PlacesSugestionModel placesModel;
  @override
  Widget build(BuildContext context) {
    var subTitle = placesModel.description
        .replaceAll(placesModel.description.split(',')[0], '');
    return Container(
      width: double.infinity,
      padding: const EdgeInsetsDirectional.all(4),
      margin: const EdgeInsetsDirectional.all(8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadiusDirectional.circular(8)),
      child: Column(
        children: [
          ListTile(
            leading: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.lightBlue,
              ),
              child: const Icon(
                IconBroken.Location,
                color: Colors.white,
              ),
            ),
            title: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '${placesModel.description.split(',')[0]}\n',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                      text: subTitle,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
