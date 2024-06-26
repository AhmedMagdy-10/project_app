import 'package:flutter/material.dart';
import 'package:project_app/constants/constant.dart';
import 'package:project_app/design/view/inforamtion_page/widgett/other_pharse.dart';
import 'package:project_app/design/view/inforamtion_page/widgett/pharse_one.dart';

class MissUnderstanding extends StatelessWidget {
  const MissUnderstanding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text(
          'سوء فهم ضغط الدم',
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
                    'يختلف معدل ضربات قلبك على مدار اليوم. ذلك لأن بعض'
                    'العوامل يمكن أن تلعب دورًا في التأثير بشكل مباشر على معدل'
                    'ضربات القلب. إذا قرأت ، فستعرف عنها.',
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
                          bodyOfPharse:
                              '1. لا تقلق إذا كنت تعاني من انخفاض ضغط الدم. في العديد من الحالات، يمكن للتغييرات البسيطة في نمط الحياة أن تساعد في التعامل مع المشكلة. ومع ذلك، إذا كنت تشعر بالدوار المفاجئ بعد الوقوف أو تعاني من الإغماءات المتكررة أو تعاني من أعراض أخرى مزعجة، فقد تحتاج إلى استشارة طبيب مختص. قد يكون انخفاض ضغط الدم في هذه الحالات مهددًا للحياة إذا لم يتم علاجه على الفور.\n\n'
                              '2. لا يعني عدم ظهور أعراض أنك لا تعاني من ارتفاع ضغط الدم. في الواقع، يُعرف ارتفاع ضغط الدم في بعض الأحيان بأنه "القاتل الصامت" لأنه قد لا يكون لديك أعراض واضحة. إذا لم يتم التحكم في ارتفاع ضغط الدم، فقد يؤدي ذلك إلى تلف في القلب والأوعية الدموية والأعضاء الأخرى ويزيد من خطر الإصابة بالأمراض المرتبطة بارتفاع ضغط الدم.\n\n'
                              '3. يمكن علاج ارتفاع ضغط الدم، خاصة إذا كان ثانويًا أي بسبب سبب واضح مثل حالة صحية أخرى. في حالة الارتفاع الأساسي، لا يمكن علاجه بشكل كامل، ولكن يمكن التحكم فيه والسيطرة عليه من خلال الأدوية وتغييرات في نمط الحياة. يجب استشارة الطبيب لتحديد العلاج المناسب ومتابعة الحالة بانتظام.\n\n'
                              '4. لا يوجد دليل قاطع على فوائد شرب النبيذ الأحمر للتحكم في ضغط الدم. على الرغم من احتوائه على مركب يسمى ريسفيراترول الذي يعتقد أنه يفيد صحة القلب، إلا أن الدراسات لم تثبت بشكل قاطع هذا التأثير. بالإضافة إلى ذلك، يمكن أن يكون تناول كميات زائدة من النبيذ الأحمر ضارًا للجسم. يجب توخي الحذر وتناول المشروبات الكحولية بمعتدل.\n\n'
                              '5. لا يمكن التوقف عن تناول الأدوية لارتفاع ضغط الدم إلا بعد استشارة الطبيب. يعتمد تحكم ضغط الدم على الأدوية التي تتناولها، وعدم تناول الدواء يمكن أن يؤدي إلى ارتفاع ضغط الدم مرة أخرى وزيادة خطر الأمراض المرتبطة بارتفاع ضغط الدم. إذا كنت تفكر في التوقف عن تناول الأدوية، يجب عليك استشارة الطبيب أولاً لتقييم الوضع وتوجيهك بشأن الخطوات المناسبة.\n\n'
                              '6. لتحسين ضغط الدم المنخفض، يمكنك اتباع بعض الإرشادات العامة. تناول كميات كافية من السوائل لتجنب الجفاف، وارتفاع الأرجل عند الجلوس أو الاستلقاء لتحسين تدفق الدم، وتجنب الوقوف لفترات طويل')
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
