import 'package:flutter/material.dart';
import 'package:project_app/constants/constant.dart';
import 'package:project_app/design/view/inforamtion_page/widgett/other_pharse.dart';
import 'package:project_app/design/view/inforamtion_page/widgett/pharse_one.dart';

class EmergenyLow extends StatelessWidget {
  const EmergenyLow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text(
          'إرشادات أزمة ارتفاع ضغط الدم',
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
                      '.عادة ، لا يرتفع ضغط الدم إذا تم التحكم فيه جيدًا. ومع ذلك '
                      'قد تكون هناك حالات يرتفع فيها ضغط الدم بشكل غير متوقع '
                      'يصل ضغط الدم الانقباضي إلى 180 و / أو الانبساطي يصل '
                      'إلى 120 ملم زئبقي والرعاية الطارئة مطلوبة. بعد الاتصال '
                      'بالخدمة الطبية الفورية أو أثناء انتظارك لسيارة الإسعاف ، ماذا '
                      'يمكن أن تكون الإسعافات الأولية؟ لا تقلق ، لقد أعددنا لك كل '),
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
                        titleOfPharse: '1. تهدئة نفسك من فوائد خفض ضغط الدم',
                        bodyOfPharse:
                            '.شيء واحد يجب على جميع مرضى ارتفاع ضغط الدم مراعاته '
                            'هو أن انخفاض التوتر يعني انخفاض ضغط الدم. وجد الباحثون '
                            'أن الاسترخاء التام لبضع دقائق يمكن أن يقلل ضغط الدم '
                            'الانقباضي بمقدار 10 ملم زئبقي أو أكثر. وبالتالي ، فهي الطريقة '
                            'الأكثر طبيعية لخفض ضغط الدم أثناء إلحاح ارتفاع ضغط الدم. '
                            'فيما يلي بعض نصائح الاسترخاء التي يمكنك تجربتها:\n'
                            '1. أوقف مهمتك الحالية.\n'
                            '2. خذ نفسا عميقا.\n'
                            '3. اجلس أو استلق بشكل مسطح.\n'
                            '4. استمع إلى أصوات الاسترخاء.\n'
                            '5. يتأمل.'),
                    SizedBox(
                      height: 20,
                    ),
                    OtherPharse(
                        titleOfPharse: ' 2. تناول دواء ضغط الدم',
                        bodyOfPharse:
                            '.إذا كنت تعاني من ارتفاع ضغط الدم ، فيجب أن تتناول أدوية '
                            'ضغط الدم التي وصفها لك الطبيب الدواء هو الخيار الرئيسي '
                            'لعلاج ارتفاع ضغط الدم. لذلك، إذا كنت أنت أو أفراد أسرتك '
                            'يعانون من حالة طارئة لارتفاع ضغط الدم ، فلا تنس أبدًا أن'),
                    SizedBox(
                      height: 20,
                    ),
                    OtherPharse(
                      titleOfPharse: '3 رشفة كوب من شاي الكركديه',
                      bodyOfPharse:
                          '.لا تتفاجأ. تم تحسينه من خلال العديد من الدراسات أن شاي '
                          'الكركديه يمكن أن يكون له تأثيرات إيجابية مباشرة وغير '
                          'مباشرة على ضغط الدم. يمكن أن تخفض الأنثوسيانين وبعض '
                          'مضادات الأكسدة الموجودة في الكركديه من ضغط الدم ، مثلها '
                          'مثل بعض العلاجات الطبية المفيدة يمكن أن يؤدي شرب شاي '
                          'الكركديه إلى خفض ضغط الدم الانقباضي بمقدار 7 نقاط في '
                          'أحسن الأحوال. وفي الوقت نفسه ، يمكن أن يقلل تناول الشاي '
                          'من ضغط الدم بشكل غير مباشر عن طريق تقليل التوتر. يساعدك '
                          'الشاي المهدئ على الشعور بالهدوء والتحكم في الغضب وتقليل '
                          'أرقام ضغط الدم لديك.',
                    ),
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
