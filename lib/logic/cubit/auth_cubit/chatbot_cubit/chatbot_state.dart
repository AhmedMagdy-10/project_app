abstract class ChatBotStates {}

class ChatBotInitialState extends ChatBotStates {}

class ChatBotLoadingState extends ChatBotStates {}

class MassageAddedState extends ChatBotStates {}

class ChatBotSuccessState extends ChatBotStates {}

class ChatBotfaluireState extends ChatBotStates {
  final dynamic errorMassage;

  ChatBotfaluireState({required this.errorMassage});
}
