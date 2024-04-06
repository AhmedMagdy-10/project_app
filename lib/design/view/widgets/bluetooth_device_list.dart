// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
// import 'package:project_app/logic/cubit/measure_cubit/measure_cubit.dart';
// import 'package:project_app/logic/cubit/measure_cubit/measure_states.dart';

// class DeviceListPage extends StatelessWidget {
//   const DeviceListPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: const Text('Device List'),
//       ),
//       body: BlocBuilder<MeasureCubit, MeasureState>(
//         builder: (context, state) {
//           if (state is MeasureConnected) {
//             return const SizedBox();
//           } else {
//             return FutureBuilder<List<BluetoothDevice>>(
//               future: FlutterBluetoothSerial.instance.getBondedDevices(),
//               builder: (context, snapshot) {
//                 if (snapshot.hasData) {
//                   final devices = snapshot.data!;
//                   return ListView.builder(
//                     itemCount: devices.length,
//                     itemBuilder: (context, index) {
//                       BluetoothDevice device = devices[index];
//                       return ListTile(
//                         title: Text('${device.name}'),
//                         subtitle: Text(
//                           device.address,
//                         ),
//                         onTap: () async {
//                           final measureCubit = context.read<MeasureCubit>();
//                           await measureCubit.connectToESP32(device);
//                           Navigator.pop(context);
//                         },
//                       );
//                     },
//                   );
//                 } else if (snapshot.hasError) {
//                   return Text('Error: ${snapshot.error}');
//                 } else {
//                   return const Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }