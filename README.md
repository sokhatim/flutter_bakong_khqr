# flutter_bakong_khqr

A Flutter plugin that provides integration with the Bakong QR payment system, allowing seamless payment processing in your Flutter applications.

<div align="center">
    <img src="https://raw.githubusercontent.com/sokhatim/flutter_bakong_khqr/main/assets/banner.png" alt="Screenshot" />
</div>

## Getting Started

This project is a starting point for a Flutter [plug-in package](https://flutter.dev/to/develop-plugins), a specialized package that includes platform-specific implementation code for Android and iOS.

## Screenshot

<div align="center">
    <img src="https://raw.githubusercontent.com/sokhatim/flutter_bakong_khqr/main/assets/screenshot.jpg" alt="Screenshot" />
</div>

## Requirements

- Flutter >=3.3.0
- Dart >= ^3.5.3
- Android compileSDK 34
- Java 17
- Android Gradle Plugin >= 8.3.0
- Gradle wrapper >= 8.4


### Features

- Supports Bakong KHQR payment processing.
- Supports currency Riel (៛).
- Generate KHQR for Individual and Merchant

### Suport Platform

- Android   | ✅
- iOS       | ❌
- MacOS     | ❌
- Web       | ❌
- Linux     | ❌
- Windows   | ❌


## Installation

To use this plugin, add `flutter_bakong_khqr` as a dependency in your `pubspec.yaml` file:

```yaml
dependencies:
  flutter_bakong_khqr: ^0.0.1+3
```


### Usage

Function generateKhqrIndividual

```bash

final response = await _bakongKhqr.generateKhqrIndividual(
      bakongAccountId: "sokha_tim@aclb",
      accountInformation: "855979515836",
      acquiringBank: "Dev Bank",
      amount: 10000,
      merchantName: "Sokha Tim",
      merchantCity: "PHNOM PENH",
      billNumber: "#12345",
      mobileNumber: "85512233455",
      storeLabel: "Coffee Shop",
      terminalLabel: "Cashier_1",
      upiAccountInformation: "1234567812345678ABCDEFGHIJKLMNO",
      purposeOfTransaction: "Buy coffee",
      merchantAlternateLanguagePreference: "km",
      merchantNameAlternateLanguage: "Sokha",
      merchantCityAlternateLanguage: "Phnom Penh",
    );

```

Return KHQR String and MD5 String

```bash

setState(() {
    print(response.qrCode);
    print(response.md5);
});

```


KHQR view for scan and payment

```bash

BakongKhqrView(
    merchantName: "Sokha Tim",
    qrString: _qrCode,
    amount: '10000',
),

```
