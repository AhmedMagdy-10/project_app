import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:project_app/constants/constant.dart';
import 'package:project_app/design/view/widgets/content_of_massage.dart';
import 'package:project_app/design/view/widgets/send_button.dart';
import 'package:project_app/logic/cubit/auth_cubit/chatbot_cubit/chatbot_cubit.dart';
import 'package:project_app/logic/cubit/auth_cubit/chatbot_cubit/chatbot_state.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({super.key});

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  TextEditingController messageController = TextEditingController();
  final controller = ScrollController(initialScrollOffset: 50);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatBotCubit(),
      child: Scaffold(
          backgroundColor: const Color(0x00077777),
          appBar: AppBar(
            title: const Text(
              'ChatBot 💙',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
            scrolledUnderElevation: 0,
            centerTitle: true,
          ),
          body: BlocBuilder<ChatBotCubit, ChatBotStates>(
              builder: (context, state) {
            DateTime now = DateTime.now();
            String dateNow = DateFormat('h:mm a').format(now);

            var massageList = BlocProvider.of<ChatBotCubit>(context).massages;
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      reverse: true,
                      controller: controller,
                      physics: const BouncingScrollPhysics(),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                      itemBuilder: (context, index) => ContentOfMessage(
                        model: massageList[index],
                        alignment: massageList[index].sender == 'user'
                            ? AlignmentDirectional.centerEnd
                            : AlignmentDirectional.centerStart,
                        color: massageList[index].sender == 'user'
                            ? kprimaryColor
                            : chatMassage,
                        borderRaduis: massageList[index].sender == 'user'
                            ? const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                              )
                            : const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              ),
                      ),
                      itemCount: BlocProvider.of<ChatBotCubit>(context)
                          .massages
                          .length,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SendButton(
                    isLoading: state is MassageAddedState,
                    controller: messageController,
                    onPressed: () {
                      BlocProvider.of<ChatBotCubit>(context)
                          .userMassage(messageController.text, dateNow);
                      messageController.clear();
                      controller.animateTo(controller.position.minScrollExtent,
                          duration: const Duration(seconds: 1),
                          curve: Curves.fastOutSlowIn);
                    },
                  ),
                ],
              ),
            );
          })),
    );
  }
}
