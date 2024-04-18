import 'package:flutter/material.dart';
import 'package:project_app/design/Mohmed/mo_widgets/artical_part.dart';

class HealthCrePage extends StatelessWidget {
  const HealthCrePage({super.key});
  final Divider divider = const Divider(
    color: Colors.grey,
    thickness: 1,
    indent: 15,
    endIndent: 15,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        scrolledUnderElevation: 0,
        title: const Text(
          'Healthcare',
          style: TextStyle(
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const ArticalPart(
            articalImage:
                'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aGVhbHRoeSUyMGZvb2R8ZW58MHx8MHx8fDA%3D',
            articalText:
                'Healthy food is this food that contains a lot of health benefits for the body and does not contain any damage, \nwhich is the food that everyone must add to their diet,\n healthy food helps greatly to enjoy good health and a strong,\n healthy and healthy body and in the prevention of obesity and many bad diseases',
            cookerImage:
                'https://www.boneta.ca/wp-content/uploads/2018/08/Alain-Ducasse.jpg',
            cookerName: "Alain Ducasse",
          ),
          divider,
          const ArticalPart(
            articalImage:
                'https://images.unsplash.com/photo-1610441009633-b6ca9c6d4be2?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mjh8fGhlYWx0aHklMjBmb29kfGVufDB8fDB8fHww',
            articalText:
                'The future doctor will not treat the human framework with drugs,\n but he will cure the disease and prevent it with nutrition.\n A cheerful heart does the trick  as a medicine, but a broken soul dries bones and the best doctors give the least medicine.The more you eat, the less you enjoy the flavor, and the less you eat, the more you enjoy the flavor',
            cookerImage:
                'https://www.boneta.ca/wp-content/uploads/2021/07/Pierre-Gagnaire.jpg',
            cookerName: "Pierre Gagnaire",
          ),
          divider,
          const ArticalPart(
            articalImage:
                'https://images.unsplash.com/photo-1606756790138-261d2b21cd75?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fGhlYWx0aHklMjBmb29kfGVufDB8fDB8fHww',
            articalText:
                'An apple a day keeps the doctor away.\nFixing your true health starts in your kitchen.\nYou are what you eat.\n- Get up from the table hungry.\nThe belly of man is his enemy completely.\n- We are a people who do not eat until we are hungry and when we eat we are not satisfied.',
            cookerImage:
                'https://www.boneta.ca/wp-content/uploads/2018/08/Martin-Berasategui.jpg',
            cookerName: "Martin Berasategui",
          ),
          divider,
          const ArticalPart(
            articalImage:
                'https://images.unsplash.com/photo-1576021182211-9ea8dced3690?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fGhlYWx0aHklMjBmb29kfGVufDB8fDB8fHww',
            articalText:
                'Fitness is not only one of the most important keys to a healthy body, it is the basis of dynamic and creative intellectual activity.\nFitness is not only one of the most important keys to a healthy body,\n it is the basis of dynamic and creative intellectual activity.',
            cookerImage:
                'https://www.boneta.ca/wp-content/uploads/2021/07/Yannick-Alleno.jpg',
            cookerName: "Yannick Alleno",
          ),
          divider,
          const ArticalPart(
            articalImage:
                'https://plus.unsplash.com/premium_photo-1676106623769-539ecc6d7f92?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjV8fGhlYWx0aHklMjBmb29kfGVufDB8fDB8fHww',
            articalText:
                'Health is a state of complete harmony of body, mind and spirit.\n When one is free from physical disabilities and mental deviations,\n the doors of the soul open.\nHealth is a state of complete harmony of body, mind and spirit. \nWhen one is free from physical disabilities and mental deviations,\n the doors of the soul open.',
            cookerImage:
                'https://www.boneta.ca/wp-content/uploads/2019/09/yoshihiro-murata.jpg',
            cookerName: "Yoshihiro Murata",
          ),
          divider,
          const ArticalPart(
            articalImage:
                'https://images.unsplash.com/photo-1615865441757-e5328eb6a5ad?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGhlYWx0aHklMjAlMjBmb29kfGVufDB8fDB8fHww',
            articalText:
                'Eating a healthy diet is not about strict limitations, staying unrealistically thin, or depriving yourself of the foods you love.\n Rather, it’s about feeling great, having more energy,\n improving your health, and boosting your mood.',
            cookerImage:
                'https://www.boneta.ca/wp-content/uploads/2018/08/Joel-Robuchon.jpg',
            cookerName: "Joel Robuchon ",
          ),
          divider,
          const ArticalPart(
            articalImage:
                'https://images.unsplash.com/photo-1519708227418-c8fd9a32b7a2?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8aGVhbHRoeSUyMCUyMGZvb2R8ZW58MHx8MHx8fDA%3D',
            articalText:
                'Switching to a healthy diet doesn’t have to be an all or nothing proposition.\n You don’t have to be perfect, you don’t have to completely eliminate foods you enjoy, and you don’t have to change everything all at once—that usually only leads to cheating or giving up on your new eating plan.',
            cookerImage:
                'https://www.boneta.ca/wp-content/uploads/2019/09/anne-sophie-pic.jpg',
            cookerName: "Anne Sophie Pic",
          ),
          divider,
          const ArticalPart(
            articalImage:
                'https://plus.unsplash.com/premium_photo-1699293238823-7f56fe53ae3e?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aGVhbHRoeSUyMCUyMGZvb2R8ZW58MHx8MHx8fDA%3D',
            articalText:
                'BetterHelp is an online therapy service that matches you to licensed, accredited therapists who can help with depression, anxiety, relationships, and more. \nTake the assessment and get matched with a therapist in as little as 48 hours.',
            cookerImage:
                'https://www.boneta.ca/wp-content/uploads/2021/07/Andreas-Caminada.jpg',
            cookerName: "Andreas Caminada",
          ),
          divider,
          const ArticalPart(
            articalImage:
                'https://images.unsplash.com/photo-1615865441757-e5328eb6a5ad?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGhlYWx0aHklMjAlMjBmb29kfGVufDB8fDB8fHww',
            articalText:
                'Eating a healthy diet is not about strict limitations, staying unrealistically thin, or depriving yourself of the foods you love.\n Rather, it’s about feeling great, having more energy,\n improving your health, and boosting your mood.',
            cookerImage:
                'https://www.boneta.ca/wp-content/uploads/2018/08/Joel-Robuchon.jpg',
            cookerName: "Joel Robuchon ",
          ),
          divider,
          const ArticalPart(
            articalImage:
                'https://images.unsplash.com/photo-1576021182211-9ea8dced3690?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fGhlYWx0aHklMjBmb29kfGVufDB8fDB8fHww',
            articalText:
                'Fitness is not only one of the most important keys to a healthy body, it is the basis of dynamic and creative intellectual activity.\nFitness is not only one of the most important keys to a healthy body,\n it is the basis of dynamic and creative intellectual activity.',
            cookerImage:
                'https://www.boneta.ca/wp-content/uploads/2021/07/Yannick-Alleno.jpg',
            cookerName: "Yannick Alleno",
          ),
        ],
      ),
    );
  }
}
