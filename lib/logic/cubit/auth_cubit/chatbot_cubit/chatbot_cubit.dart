import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_app/core/helper/dio_helper.dart';
import 'package:project_app/logic/cubit/auth_cubit/chatbot_cubit/chatbot_state.dart';
import 'package:project_app/logic/data/models/massage_model.dart';

class ChatBotCubit extends Cubit<ChatBotStates> {
  ChatBotCubit() : super(ChatBotInitialState());

  List<MassageModel> massages = [];

  void userMassage(String massage, String dateTime) {
    massages.insert(
      0,
      MassageModel(
        sender: 'user',
        massage: massage,
        dateTime: dateTime,
      ),
    );

    chatBotMassage(massage, dateTime);

    emit(MassageAddedState());
  }

  Future<void> chatBotMassage(String message, String dateTime) async {
    const apiKey = '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';

    const url = 'https://api.openai.com/v1/chat/completions';

    final body = {
      'messages': [
        {
          'role': 'assistant',
          'content': message,
        },
      ],
      'model': 'gpt-3.5-turbo-0125',
      'max_tokens': 200,
    };

    try {
      emit(ChatBotLoadingState());
      final response = await DioHelper()
          .postDate(url: url, data: body, token: 'Bearer $apiKey');

      if (response.statusCode == 200) {
        final responseData = response.data;
        final choices = responseData['choices'] as List<dynamic>;
        if (choices.isNotEmpty) {
          final chatBotMessages = choices
              .map((choice) => choice['message']['content'] as String)
              .toList();

          for (var chatBotMassage in chatBotMessages.reversed) {
            massages.insert(
                0,
                MassageModel(
                    massage: chatBotMassage,
                    dateTime: dateTime,
                    sender: 'chatBot'));
          }

          emit(ChatBotSuccessState());
        } else {
          log('No choices found in response.');
        }
      } else {
        DioException.connectionError(
            requestOptions: response.data,
            reason: 'No Internet Connection,try again');
      }
    } catch (e) {
      emit(ChatBotfaluireState(errorMassage: e.toString()));
      log('Request failed with error: ${e.toString()}');
    }
  }

  // getUserToken() async {
  //   await FirebaseMessaging.instance.requestPermission();

  //   return await FirebaseMessaging.instance.getToken().then((value) => {
  //         print(value),
  //       });
  // }
}
