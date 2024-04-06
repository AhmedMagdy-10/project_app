// import 'dart:async';
// import 'dart:convert';
// import 'dart:typed_data';

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
// import 'package:project_app/logic/cubit/measure_cubit/measure_states.dart';

// class MeasureCubit extends Cubit<MeasureState> {
//   final FlutterBluetoothSerial bluetoothSerial =
//       FlutterBluetoothSerial.instance;
//   BluetoothConnection? _connection;
//   bool _isConnected = false;

//   MeasureCubit() : super(MeasureInitial());

//   Future<void> initBluetooth() async {
//     try {
//       await bluetoothSerial.requestEnable();
//     } catch (e) {
//       print('Error enabling Bluetooth: $e');
//     }
//   }

//  Future<void> connectToESP32(BluetoothDevice device) async {
//   try {
//     final BluetoothDevice? selectedDevice = await FlutterBluetoothSerial.instance.selectFromDevicesPage();
//     if (selectedDevice != null) {
//       _connection = await BluetoothConnection.toAddress(selectedDevice.address);
//       _isConnected = true;
//       print('Connected to ESP32');
//       startListening();
//       emit(MeasureConnected());
//     } else {
//       print('No device selected');
//     }
//   } catch (e) {
//     print('Error connecting to ESP32: $e');
//   }
// }

//   void startListening() {
//     _connection?.input?.listen((Uint8List data) {
//       String message = String.fromCharCodes(data);
//       emit(MeasureReceivedMessage(message));
//       // Handle received message
//     }).onDone(() {
//       disconnectFromESP32();
//     });
//   }

//   void sendData(String data) {
//     if (_connection != null && _isConnected) {
//       _connection!.output.add(utf8.encode(data));
//       _connection!.output.allSent.then((_) {
//         print('Sent message: $data');
//         // Handle sent message
//       });
//     } else {
//       print('Not connected to ESP32');
//     }
//   }

//   void disconnectFromESP32() {
//     if (_connection != null && _isConnected) {
//       _connection!.finish();
//       _connection = null;
//       _isConnected = false;
//       print('Disconnected from ESP32');
//       emit(MeasureDisconnected());
//     }
//   }

//   @override
//   Future<void> close() {
//     _connection?.finish();
//     return super.close();
//   }
// }
