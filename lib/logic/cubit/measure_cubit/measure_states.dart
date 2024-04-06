abstract class MeasureState {}

class MeasureInitial extends MeasureState {}

class MeasureConnected extends MeasureState {}

class MeasureDisconnected extends MeasureState {}

class MeasureReceivedMessage extends MeasureState {
  final String message;

  MeasureReceivedMessage(this.message);
}
