import 'package:flutter_bakong_khqr/model/bakong_khqr_model.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_bakong_khqr_method_channel.dart';

abstract class FlutterBakongKhqrPlatform extends PlatformInterface {
  /// Constructs a FlutterBakongKhqrPlatform.
  FlutterBakongKhqrPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterBakongKhqrPlatform _instance = MethodChannelFlutterBakongKhqr();

  /// The default instance of [FlutterBakongKhqrPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterBakongKhqr].
  static FlutterBakongKhqrPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterBakongKhqrPlatform] when
  /// they register themselves.
  static set instance(FlutterBakongKhqrPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

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
  }) {
    throw UnimplementedError('generateKhqrIndividual() has not been implemented.');
  }

  Future<BakongKhqrModel> generateKhqrMerchant({
    required String bakongAccountId,
    required String merchantId,
    required String acquiringBank,
    String? currency,
    double? amount,
    required String merchantName,
    required String merchantCity,
    String? billNumber,
    String? mobileNumber,
    String? storeLabel,
    String? terminalLabel,
    String? upiAccountInformation,
    String? purposeOfTransaction,
    String? merchantAlternateLanguagePreference,
    String? merchantNameAlternateLanguage,
    String? merchantCityAlternateLanguage,
  }) {
    throw UnimplementedError('generateKhqrMerchant() has not been implemented.');
  }

  Future<String> generateDeepLink({
    required String url,
    required String qr,
    required String appName,
    required String appIconUrl,
    required String appDeepLinkCallback,
  }) {
    throw UnimplementedError('generateDeepLink() has not been implemented.');
  }
}
