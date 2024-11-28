import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bakong_khqr/model/bakong_khqr_model.dart';

import 'flutter_bakong_khqr_platform_interface.dart';

/// An implementation of [FlutterBakongKhqrPlatform] that uses method channels.
class MethodChannelFlutterBakongKhqr extends FlutterBakongKhqrPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_bakong_khqr');

  @override
  Future<BakongKhqrModel> generateKhqrIndividual({
    required String bakongAccountId,
    String? accountInformation,
    String? acquiringBank,
    String? currency,
    double? amount,
    required String merchantName,
    String? merchantCity,
    String? billNumber,
    String? mobileNumber,
    String? storeLabel,
    String? terminalLabel,
    String? upiAccountInformation,
    String? purposeOfTransaction,
    String? merchantAlternateLanguagePreference,
    String? merchantNameAlternateLanguage,
    String? merchantCityAlternateLanguage,
  }) async {
    final result = await methodChannel.invokeMethod('generateKhqrIndividual', {
      'bakongAccountId': bakongAccountId,
      'accountInformation': accountInformation,
      'acquiringBank': acquiringBank,
      'currency': currency,
      'amount': amount,
      'merchantName': merchantName,
      'merchantCity': merchantCity,
      'billNumber': billNumber,
      'mobileNumber': mobileNumber,
      'storeLabel': storeLabel,
      'terminalLabel': terminalLabel,
      'upiAccountInformation': upiAccountInformation,
      'purposeOfTransaction': purposeOfTransaction,
      'merchantAlternateLanguagePreference': merchantAlternateLanguagePreference,
      'merchantNameAlternateLanguage': merchantNameAlternateLanguage,
      'merchantCityAlternateLanguage': merchantCityAlternateLanguage,
    });
    return BakongKhqrModel.fromMap(result.cast<String, dynamic>());
  }

  @override
  Future<BakongKhqrModel> generateKhqrMerchant({
    required String bakongAccountId,
    required String merchantId,
    required String acquiringBank,
    String? currency,
    double? amount,
    required String merchantName,
    String? merchantCity,
    String? billNumber,
    String? mobileNumber,
    String? storeLabel,
    String? terminalLabel,
    String? upiAccountInformation,
    String? purposeOfTransaction,
    String? merchantAlternateLanguagePreference,
    String? merchantNameAlternateLanguage,
    String? merchantCityAlternateLanguage,
  }) async {
    final result = await methodChannel.invokeMethod('generateKhqrMerchant', {
      'bakongAccountId': bakongAccountId,
      'merchantId': merchantId,
      'acquiringBank': acquiringBank,
      'currency': currency,
      'amount': amount,
      'merchantName': merchantName,
      'merchantCity': merchantCity,
      'billNumber': billNumber,
      'mobileNumber': mobileNumber,
      'storeLabel': storeLabel,
      'terminalLabel': terminalLabel,
      'upiAccountInformation': upiAccountInformation,
      'purposeOfTransaction': purposeOfTransaction,
      'merchantAlternateLanguagePreference': merchantAlternateLanguagePreference,
      'merchantNameAlternateLanguage': merchantNameAlternateLanguage,
      'merchantCityAlternateLanguage': merchantCityAlternateLanguage,
    });
    return BakongKhqrModel.fromMap(result.cast<String, dynamic>());
  }

  @override
  Future<String> generateDeepLink({
    required String url,
    required String qr,
    required String appName,
    required String appIconUrl,
    required String appDeepLinkCallback,
  }) async {
    final result = await methodChannel.invokeMethod('generateDeepLink', {
      'url': url,
      'qr': qr,
      'appName': appName,
      'appIconUrl': appIconUrl,
      'appDeepLinkCallback': appDeepLinkCallback,
    });

    return result['shortLink'];
  }
}
