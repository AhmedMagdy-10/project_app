import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:project_app/constants/constant.dart';
import 'package:project_app/core/helper/show_toast_state.dart';
import 'package:project_app/design/view/widgets/action_button.dart';
import 'package:project_app/design/view/widgets/custom_button.dart';
import 'package:project_app/design/view/widgets/custom_user_info.dart';
import 'package:project_app/logic/cubit/main_cubit/main_cubit.dart';
import 'package:project_app/logic/cubit/main_cubit/main_states.dart';

class MeasureView extends StatefulWidget {
  const MeasureView({super.key});

  @override
  MeasureViewState createState() => MeasureViewState();
}

class MeasureViewState extends State<MeasureView> {
  String receivedMessage = '';
  bool isSendingData = false;
  BluetoothConnection? connection;
  bool isConnected = false;

  @override
  void initState() {
    super.initState();
  }

  Future<void> initBluetooth() async {
    try {
      await FlutterBluetoothSerial.instance.requestEnable();
    } catch (e) {
      print('Error enabling Bluetooth: $e');
      showToast(text: 'Error enabling Bluetooth: $e', state: ToastStates.error);
    }
  }

  void connectToESP32() async {
    await initBluetooth();

    BluetoothDevice? selectedDevice = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const DeviceListPage()),
    );

    if (selectedDevice != null) {
      try {
        BluetoothConnection newConnection =
            await BluetoothConnection.toAddress(selectedDevice.address);
        setState(() {
          connection = newConnection;
          isConnected = true;
        });
        print('Connected to ESP32');
        showToast(text: 'Connected to ESP32', state: ToastStates.success);
      } catch (e) {
        print('Error connecting to ESP32: $e');
        showToast(
            text: 'Error connecting to ESP32: $e', state: ToastStates.error);
      }
    }
  }

  void sendData(String data, Function(String) onReceivedMessage) {
    if (connection != null && isConnected) {
      setState(() {
        isSendingData = true;
      });

      connection!.output.add(utf8.encode(data));
      connection!.output.allSent.then((_) {
        print('Sent message: $data');
        // Handle sent message
        setState(() {
          isSendingData = false;
        });
      });

      // Register the callback function to handle received message
      connection!.input?.listen((Uint8List data) {
        String message = String.fromCharCodes(data);
        print('Received message: $message');
        onReceivedMessage(message); // Call the callback function
      }).onDone(() {
        disconnectFromESP32();
      });
    } else {
      showToast(text: 'Not connected to ESP32', state: ToastStates.error);
    }
  }

  void disconnectFromESP32() {
    if (connection != null && isConnected) {
      connection!.finish();
      setState(() {
        connection = null;
        isConnected = false;
      });
      print('Disconnected from ESP32');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainCubitStates>(builder: (context, state) {
      final userModel = BlocProvider.of<MainCubit>(context).userModel;
      if (userModel != null) {
        return Scaffold(
            appBar: AppBar(
              toolbarHeight: 85,
              scrolledUnderElevation: 0,
              title: ImageAvater(
                model: userModel,
              ),
            ),
            body: Padding(
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Center(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/graph.png',
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 180,
                        ),
                        isSendingData
                            ? const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircularProgressIndicator(
                                    color: Colors.blue,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('الصبر جميل',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ))
                                ],
                              )
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                    Text(
                                      receivedMessage,
                                      style: const TextStyle(
                                        fontSize: 35,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      'Bp/m',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ]),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomActionButton(
                                onTap: () {
                                  connectToESP32();
                                },
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Eye Contact ',
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Icon(
                                      Icons.bluetooth_connected,
                                      size: 20,
                                      color: Colors.blue,
                                    ),
                                  ],
                                )),
                            CustomActionButton(
                                onTap: () {
                                  disconnectFromESP32();
                                },
                                child: const Center(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'DisConnect',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Icon(
                                          Icons.bluetooth_disabled,
                                          size: 20,
                                          color: Colors.blue,
                                        )
                                      ]),
                                ))
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomActionButton(
                              onTap: () {
                                Future.delayed(const Duration(seconds: 10), () {
                                  BlocProvider.of<MainCubit>(context)
                                      .sendNotification();
                                });
                              },
                              child: const Center(
                                child: Text(
                                  'HealthCare  🚑',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            CustomActionButton(
                              onTap: () {},
                              child: const Center(
                                child: Text(
                                  'Food Details 🥗',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        CustomButton(
                          onTapButton: () {
                            sendData('start', (receivedMessage) {
                              setState(() {
                                this.receivedMessage = receivedMessage;
                              });
                            });
                          },
                          child: const Text(
                            'Start Measure',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                )));
      } else {
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.blue,
          ),
        );
      }
    });
  }
}

class DeviceListPage extends StatefulWidget {
  const DeviceListPage({super.key});

  @override
  DeviceListPageState createState() => DeviceListPageState();
}

class DeviceListPageState extends State<DeviceListPage> {
  List<BluetoothDevice> devices = [];

  @override
  void initState() {
    super.initState();
    _getPairedDevices();
  }

  void _getPairedDevices() async {
    List<BluetoothDevice> pairedDevices =
        await FlutterBluetoothSerial.instance.getBondedDevices();
    setState(() {
      devices = pairedDevices;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text('Device List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return Container(
              width: double.infinity,
              height: 1.5,
              color: kprimaryColor,
            );
          },
          itemCount: devices.length,
          itemBuilder: (context, index) {
            BluetoothDevice device = devices[index];
            return ListTile(
                title: Text(
                  '${device.name}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                subtitle: Text(
                  device.address,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
                trailing: const Icon(
                  Icons.signal_cellular_alt,
                  color: kprimaryColor,
                ),
                onTap: () {
                  Navigator.pop(context, device);
                });
          },
        ),
      ),
    );
  }
}
