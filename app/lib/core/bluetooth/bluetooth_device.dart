class BluetoothDevice {
  final String id;
  final String name;
  final bool isConnected;

  const BluetoothDevice({
    required this.id,
    required this.name,
    this.isConnected = false,
  });
}