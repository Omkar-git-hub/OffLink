import 'dart:async';

import '../../core/bluetooth/bluetooth_device.dart';
import '../../core/bluetooth/bluetooth_service.dart';

class BluetoothController {
  final BluetoothService _bluetoothService;

  StreamSubscription<List<BluetoothDevice>>? _devicesSubscription;

  List<BluetoothDevice> _devices = [];
  bool _isScanning = false;

  BluetoothController(this._bluetoothService) {
    _devicesSubscription = _bluetoothService.devicesStream.listen(
      (devices) {
        _devices = devices;
      },
    );
  }

  bool get isScanning => _isScanning;

  List<BluetoothDevice> get devices {
    return List.unmodifiable(_devices);
  }

  Future<void> startScan() async {
    if (_isScanning) {
      return;
    }

    _isScanning = true;

    try {
      await _bluetoothService.startScan();
    } finally {
      _isScanning = false;
    }
  }

  Future<void> stopScan() async {
    if (!_isScanning) {
      return;
    }

    await _bluetoothService.stopScan();
    _isScanning = false;
  }

  Future<void> dispose() async {
    await _devicesSubscription?.cancel();
  }
}