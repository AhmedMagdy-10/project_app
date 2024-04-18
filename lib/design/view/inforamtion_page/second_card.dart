import 'package:flutter/material.dart';
import 'package:project_app/constants/constant.dart';
import 'package:project_app/design/view/inforamtion_page/widgett/other_pharse.dart';
import 'package:project_app/design/view/inforamtion_page/widgett/pharse_one.dart';

class ElementAffect extends StatelessWidget {
  const ElementAffect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text(
          'العوامل المؤثرة في معدل نبضات القلب',
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
                      titleOfPharse: 'درجة حرارة',
                      bodyOfPharse:
                          'سيؤثر تغيير درجة حرارة الهواء أو درجة حرارة جسمك على معدل ضربات قلبك. '
                          'إذا كنت تشعر بالبرودة الشديدة أو السخونة الشديدة ، فإن القلب سيعزز ضخ الدم إلى بشرتك لتدفئتك أو تبريدك ، '
                          'وبالتالي ، لا يزيد معدل ضربات قلبك عن 5 إلى 10 نبضات في الدقيقة. '
                          'علاوة على ذلك ، يمكن أن تؤدي الرطوبة المرتفعة أيضًا إلى زيادة معدل ضربات القلب.',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    OtherPharse(
                        titleOfPharse: 'وضع الجسم',
                        bodyOfPharse: 'ومع'
                            'عادةً لا يتغير معدل ضربات قلبك في أوضاع الجسم المختلفة.'
                            'ذلك ، إذا غيرت وضع جسمك فجأة إلى وضع الوقوف '
                            'فسوف يرتفع معدل ضربات قلبك في أول 15 إلى 20 ثانية. بعد'),
                    SizedBox(
                      height: 20,
                    ),
                    OtherPharse(
                        titleOfPharse: 'الكافيين والنيكوتين',
                        bodyOfPharse: 'ومع'
                            'يمكن للقهوة والشاي والصودا وغيرها من المشروبات التي تحتوي على الكافيين أن ترفع معدل ضربات قلبك ، وكذلك يفعل النيكوتين في غضون ساعة واحدة من تناول الكافيين يصل تأثيره على معدل ضربات القلب إلى ذروته. لن يعود معدل ضربات قلبك إلى الرقم الأصلي إلا بعد 4 إلى 6 ساعات.'),
                    SizedBox(
                      height: 20,
                    ),
                    OtherPharse(
                        titleOfPharse: 'عمر :',
                        bodyOfPharse:
                            'عندما تكبر ، لن يتغير معدل ضربات القلب RHR معدل ضربات القلب أثناء (الراحة بشكل ملحوظ بينما يصبح معدل ضربات القلب أثناء التدريب (THR) أبطأ. '
                            'جنس تذكير أو تأنيث: '
                            'متوسط معدل ضربات القلب عند النساء أعلى من معدل ضربات القلب عند الرجال. ومع ذلك، تميل النساء إلى أن يكون لديهن خطر أقل من الرجال للإصابة بأمراض القلب.'),
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
