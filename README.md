# OffLink

**Secure. Offline. Nearby.**

OffLink is a lightweight, offline-first device-to-device communication system designed to enable secure communication without internet access or a SIM card.

## 🎯 Project Goal

Build a simple, secure, and resource-efficient communication system that allows nearby devices to communicate directly without depending on internet infrastructure.

The project starts with **Bluetooth Low Energy (BLE)** and is designed to support future **ESP32-based relay and mesh communication**.

## ⭐ Core Priorities

* 🔐 Security
* 📶 Reliable connectivity
* 💾 Low storage consumption
* 🔋 Low battery consumption
* 🧩 Simple user interface
* 📈 Scalable architecture
* 🌐 No internet dependency
* 📱 No SIM requirement

## 🏗️ Initial Architecture

```text
Mobile App
    │
    ▼
Application Layer
    │
    ▼
Communication Layer
    │
    ├── BLE
    │
    └── Future Transports
            │
            ├── ESP32
            ├── Relay
            └── Mesh
```

## 🚀 Development Approach

OffLink follows a modular architecture based on the **Open/Closed Principle**.

The core system should remain stable while new capabilities can be added through independent implementations.

Initial development will focus on:

1. Project foundation
2. BLE device discovery
3. BLE connection management
4. Secure device identity
5. Encrypted messaging
6. Local message storage
7. Reliability and security testing

Future development may introduce:

* ESP32 relay nodes
* Multi-hop communication
* Mesh networking
* Additional offline communication transports

## 📂 Documentation

Project documentation is maintained separately and defines the project's requirements, architecture, technology decisions, development roadmap, and engineering rules.

## 🛠️ Planned Technology

* **Flutter**
* **Dart**
* **Bluetooth Low Energy (BLE)**
* **Local database**
* **Established cryptographic libraries**
* **ESP32** for future relay/mesh experiments

## 🔒 Security

Security is a core requirement of OffLink.

The project will use established cryptographic standards and libraries rather than custom encryption algorithms.

Future relay nodes should forward encrypted data without requiring access to the plaintext message.

## 📌 Project Status

**Early Development**

The current focus is establishing the project foundation and implementing the first direct BLE communication MVP.

## 📄 License

OffLink is released under the **MIT License**.
