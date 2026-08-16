import 'dart:async';

import 'package:flutter_blue_plus/flutter_blue_plus.dart' as fbp;

import 'bluetooth_device.dart';
import 'bluetooth_service.dart';

class FlutterBluePlusService implements BluetoothService {
  final List<BluetoothDevice> _devices = [];
  final Map<String, fbp.BluetoothDevice> _flutterDevices = {};

  final StreamController<List<BluetoothDevice>> _devicesController =
      StreamController<List<BluetoothDevice>>.broadcast();

  StreamSubscription<List<fbp.ScanResult>>? _scanSubscription;

  @override
  Stream<List<BluetoothDevice>> get devicesStream =>
      _devicesController.stream;

  @override
  Future<void> startScan() async {
    _devices.clear();
    _flutterDevices.clear();

    _devicesController.add(List.unmodifiable(_devices));

    await _scanSubscription?.cancel();

    _scanSubscription =
        fbp.FlutterBluePlus.scanResults.listen((results) {
      for (final result in results) {
        final device = result.device;
        final id = device.remoteId.str;

        _flutterDevices[id] = device;

        final bluetoothDevice = BluetoothDevice(
          id: id,
          name: device.platformName.isNotEmpty
              ? device.platformName
              : 'Unknown Device',
        );

        final existingIndex = _devices.indexWhere(
          (item) => item.id == id,
        );

        if (existingIndex >= 0) {
          _devices[existingIndex] = bluetoothDevice;
        } else {
          _devices.add(bluetoothDevice);
        }

        _devicesController.add(
          List.unmodifiable(_devices),
        );
      }
    });

    await fbp.FlutterBluePlus.startScan();
  }

  @override
  Future<void> stopScan() async {
    await fbp.FlutterBluePlus.stopScan();

    await _scanSubscription?.cancel();
    _scanSubscription = null;
  }

  @override
  Future<void> connect(BluetoothDevice device) async {
    final flutterDevice = _flutterDevices[device.id];

    if (flutterDevice == null) {
      throw Exception('Bluetooth device not found');
    }

    await flutterDevice.connect(
      license: fbp.License.nonprofit,
    );
  }

  @override
  Future<void> disconnect(BluetoothDevice device) async {
    final flutterDevice = _flutterDevices[device.id];

    if (flutterDevice == null) {
      throw Exception('Bluetooth device not found');
    }

    await flutterDevice.disconnect();
  }

  @override
  List<BluetoothDevice> getDevices() {
    return List.unmodifiable(_devices);
  }

  Future<void> dispose() async {
    await _scanSubscription?.cancel();
    await _devicesController.close();
  }
}