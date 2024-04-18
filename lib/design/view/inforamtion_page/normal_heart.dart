import 'package:flutter/material.dart';
import 'package:project_app/constants/constant.dart';
import 'package:project_app/design/view/inforamtion_page/widgett/other_pharse.dart';
import 'package:project_app/design/view/inforamtion_page/widgett/pharse_one.dart';

class NormalHeart extends StatelessWidget {
  const NormalHeart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text(
          'التهدئة السريعة للقلب المتسارع',
          textAlign: TextAlign.right,
          maxLines: 2,
          style: TextStyle(
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const PharseOne(
                pharseOneTitle:
                    '.في بعض الأحيان يرتفع معدل ضربات القلب وقد يرتفع معدل '
                    'ضربات القلب. لإرخاء قلبك وخفض النبض المرتفع مؤقتًا في '
                    'الوقت الحالي ، جرب هذه الطرق أدناه.',
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: kprimaryColor,
                ),
                child: const Column(
                  children: [
                    OtherPharse(
                      titleOfPharse: 'تمارين التنفس العميق',
                      bodyOfPharse:
                          '.عادة ما تحدث التغيرات المفاجئة في معدل ضربات القلب '
                          'بسبب الاضطراب العاطفي أو القلق لتريح نفسك ، تحتاج إلى '
                          'ممارسة التنفس العميق أو التأمل.'
                          '\n'
                          'علاوة على ذلك ، وفقًا للدكتور جون إلفتريادس ، الذي يدير '
                          'معهد الأورطي في جامعة ييل ، هناك تمرين سريع للتنفس '
                          'لإرخاء قلبك ، وهو ما يسمى مناورات vagal.'
                          '\n'
                          'يمكنك إغلاق فمك وأنفك لزيادة الضغط على صدرك ، كما لو '
                          'كنت تعطس. ثم تحتاج إلى الشهيق لمدة 5 ثوان ، حبس '
                          'أنفاسك لمدة 5 ثوان ، ثم الزفير ببطء. يمكن أن يؤدي تكرار '
                          'ذلك عدة مرات إلى تنشيط العصب المبهم لخفض معدل ضربات '
                          'القلب.',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    OtherPharse(
                        titleOfPharse: 'ابق بعيدًا عن الحرارة',
                        bodyOfPharse:
                            'كلما زادت درجة الحرارة، زادت سرعة دقات قلبك. وبالتالى '
                            'فأنت بحاجة إلى البقاء في مكان بارد ومريح للحفاظ على معدل '
                            'ضربات القلب الطبيعي.'),
                    SizedBox(
                      height: 20,
                    ),
                    OtherPharse(
                      titleOfPharse: 'ارتفاع ببطء',
                      bodyOfPharse:
                          'يمكن أن يؤدي تغيير وضعيتك من الجلوس إلى الوقوف بسرعة '
                          'كبيرة إلى رفع معدل ضربات القلب. احذر من ذلك وحاول أن '
                          'تنهض ببطء.',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    OtherPharse(
                        titleOfPharse: ' الغمر في الماء البارد',
                        bodyOfPharse:
                            'يمكنك غمر وجهك أو أجزاء أخرى من الجسم في الماء البارد '
                            'لخفض درجة حرارة بشرتك ، مما يؤدي إلى انخفاض تدفق الدم '
                            'المحيطي وانخفاض معدل ضربات القلب.'),
                    SizedBox(
                      height: 20,
                    ),
                    OtherPharse(
                        titleOfPharse: ' اتصل بخدمات الطوارئ الطبية',
                        bodyOfPharse:
                            'بالنسبة للمرضى الذين تم تشخيص إصابتهم بتسرع القلب ، '
                            'عندما يكون لديهم تسارع في القلب لمدة 30 دقيقة ، من '
                            'الضروري الاتصال بخدمات الطوارئ الطبية والحصول على '
                            'العلاج المناسب.'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
