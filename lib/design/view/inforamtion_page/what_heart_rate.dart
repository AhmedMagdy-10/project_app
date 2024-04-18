import 'package:flutter/material.dart';
import 'package:project_app/constants/constant.dart';
import 'package:project_app/design/view/inforamtion_page/other_pharse.dart';
import 'package:project_app/design/view/inforamtion_page/widgett/pharse_one.dart';

class WhatHeartRate extends StatelessWidget {
  const WhatHeartRate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text(
          'ما هو معدل نبضات القلب',
          style: TextStyle(
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              PharseOne(
                pharseOneTitle:
                    'معدل ضربات القلب ، أو النبض ، هو عدد ضربات قلبك لكل '
                    'وحدة زمنية ، وعادة ما تكون دقيقة. '
                    'في كل مرة ينبض فيها القلب ، يتم ضخ الدم من القلب إلى '
                    'الجسم لتزويد الجسم بالأكسجين نظرًا لأن الحاجة إلى '
                    'الأكسجين تتغير عندما يكون الناس في حالات مختلفة ، مثل '
                    'الراحة وممارسة الرياضة وما إلى ذلك، فإن عبء عمل القلب لتوزيع الدم يتغير \n'
                    'يوجد مؤشرين مختلفين لمعدل ضربات القلب ، معدل ضربات '
                    'القلب أثناء الراحة ومعدل ضربات القلب المستهدف. أحدهما '
                    'لقياس مدى دقات قلبك عندما تكون في حالة راحة. يتم '
                    'استخدام الآخر لمعرفة معدل ضربات القلب المستهدف المثالي '
                    'أثناء التمرين',
              ),
              SizedBox(
                height: 20,
              ),
              OtherPharse(
                titleOfPharse: ' :  نطاقات معدل ضربات القلب أثناء الراحة  ',
                bodyOfPharse:
                    'الأطفال من سنة إلى سنتين): 80 إلى 130 نبضة في الدقيقة\n'
                    'الأطفال من 3 إلى 4 سنوات): 80 إلى 120 نبضة في الدقيقة\n'
                    'الأطفال من 5 إلى 6 سنوات) : 75 إلى 115 نبضة في الدقيقة\n'
                    'الأطفال من 7 إلى 9 سنوات): 70 إلى 110 نبضة في الدقيقة\n'
                    'الأطفال من 10 إلى 15 سنة): 70 إلى 100 نبضة في الدقيقة\n'
                    'الناس (فوق 15 سنة): 60 إلى 100 نبضة في الدقيقة',
              ),
              SizedBox(
                height: 20,
              ),
              OtherPharse(
                  titleOfPharse: 'نطاقات شدة التمرين :',
                  bodyOfPharse:
                      'أثناء التمرين ، يمكنك رؤية شدة تدريبك عن طريق معدل ضربات القلب المستهدف. '
                      'فيما يلي نطاقات معدل ضربات القلب المستهدفة وفقًا لذلك:\n'
                      '\n'
                      'الإحماء: <60% من HRmax\n'
                      'التدريب المستهدف: 60% - 79% من HRmax\n'
                      'كثافة عالية: 80% - 89% من HRmax\n'
                      'متطرف = 90% من أقصى معدل لضربات القلب\n'
                      '\n'
                      'يرجى ملاحظة أنه لا يمكن استخدام تطبيقنا كبديل لخدمات الرعاية الصحية الاحترافية ، '
                      'إذا كان لديك تسارع مستمر في ضربات القلب أو أي مشاكل أخرى في معدل ضربات القلب ، '
                      'فمن الضروري استشارة طبيبك في الوقت المناسب.')
            ],
          ),
        ),
      ),
    );
  }
}
