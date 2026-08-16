import 'bluetooth_device.dart';

abstract class BluetoothService {
  Stream<List<BluetoothDevice>> get devicesStream;

  Future<void> startScan();

  Future<void> stopScan();

  Future<void> connect(BluetoothDevice device);

  Future<void> disconnect(BluetoothDevice device);

  List<BluetoothDevice> getDevices();
}