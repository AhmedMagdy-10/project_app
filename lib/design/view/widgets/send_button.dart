import 'package:flutter/material.dart';

import 'package:project_app/constants/icon_broken.dart';
import 'package:project_app/design/view/widgets/custom_text_field.dart';

class SendButton extends StatelessWidget {
  const SendButton(
      {super.key, this.onPressed, this.controller, required this.isLoading});
  final void Function()? onPressed;
  final TextEditingController? controller;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomTextField(
          hintText: 'Write your massage..',
          controller: controller,
        ),
        const SizedBox(
          width: 10,
        ),
        CircleAvatar(
            radius: 22,
            backgroundColor: Colors.blue,
            child: IconButton(
                onPressed: onPressed,
                icon: isLoading
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : const Icon(
                        IconBroken.Send,
                        color: Colors.white,
                      )))
      ],
    );
  }
}
