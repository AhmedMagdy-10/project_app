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
          'إرشادات أزمة انخفاض ضغط الدم',
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
                    'لا توجد نقطة محددة يصبح فيها ضغط الدم منخفضًا جدًا. ومع'
                    'ذلك ، إذا كانت الأعراض الشديدة ناجمة عن انخفاض ضغط'
                    'الدم ، فهذا يشير إلى حالة طارئة لخفض ضغط الدم. يجب أن'
                    'تكون الخطوة الأولى هي الاتصال بطبيبك للحصول على علاج'
                    'طبي فوري وإجراء مراجعة دقيقة لأدويتك. ولكن ماذا يمكنك'
                    'أن تفعل ؟ تعلم النصائح أدناه ولن تكون جاهلًا بعد الآن.',
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
                      titleOfPharse: '1. الاستلقاء',
                      bodyOfPharse:
                          'عندما تعاني من أي من أعراض انخفاض ضغط الدم ، حاول'
                          'الجلوس أو الاستلقاء على سطح مستو بأمان وعلى الفور. يمكن'
                          'أن يؤدي الاستمرار في الوقوف إلى تفاقم انخفاض ضغط الدم'
                          'الوضعي. يفيد الاستلقاء أو الجلوس في تطبيع ضغط الدم.',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    OtherPharse(
                        titleOfPharse: '2. ابق رطبًا',
                        bodyOfPharse:
                            'الجفاف هو أحد الأسباب الشائعة لانخفاض ضغط الدم. '
                            'وبالتالي، فإن شرب المزيد من السوائل، وتغطية المياه ، وماء '
                            'جوز الهند ، والمشروبات الرياضية ، لا يمكن أن يخفف من '
                            'الجفاف فحسب ، بل يساعد أيضًا في الحفاظ على السوائل في '
                            'جسمك. إلى جانب ذلك ، يمكنك إضافة كمية صغيرة من الملح أو '),
                    SizedBox(
                      height: 20,
                    ),
                    OtherPharse(
                      titleOfPharse: '.3. تناول الملح الكافي',
                      bodyOfPharse:
                          'جرب تناول المزيد من الأطعمة المالحة أو قم بلعق قليل من '
                          'الملح للسماح للصوديوم برفع ضغط الدم. يمكنك أيضًا شرب '
                          'المشروبات الرياضية أو تناول أملاح الإماهة الفموية (ORS) '
                          'التي يمكن أن تعيد ترطيبك وتوفر الملح بالإضافة إلى الأملاح '
                          'الأخرى لتحسين ضغط الدم. ومع ذلك ، لا تتناول أملاح الإماهة '
                          'الفموية إذا كنت مريضًا بالسكري وتأكد من أنك لا تتناول الكثير',
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
