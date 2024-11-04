package com.example.flutter_bakong_khqr

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import kh.gov.nbc.bakong_khqr.BakongKHQR
import kh.gov.nbc.bakong_khqr.model.IndividualInfo
import kh.gov.nbc.bakong_khqr.model.KHQRCurrency
import kh.gov.nbc.bakong_khqr.model.KHQRData
import kh.gov.nbc.bakong_khqr.model.KHQRDeepLinkData
import kh.gov.nbc.bakong_khqr.model.KHQRResponse
import kh.gov.nbc.bakong_khqr.model.MerchantInfo
import kh.gov.nbc.bakong_khqr.model.SourceInfo

/** FlutterBakongKhqrPlugin */
class FlutterBakongKhqrPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "flutter_bakong_khqr")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    when (call.method) {
      "generateKhqrIndividual" -> {
        // Extract parameters from the MethodCall
        val bakongAccountId: String? = call.argument("bakongAccountId")
        val accountInformation: String? = call.argument("accountInformation")
        val acquiringBank: String? = call.argument("acquiringBank")
        val amount: Double? = call.argument("amount")
        val merchantName: String? = call.argument("merchantName")
        val merchantCity: String? = call.argument("merchantCity")
        val billNumber: String? = call.argument("billNumber")
        val mobileNumber: String? = call.argument("mobileNumber")
        val storeLabel: String? = call.argument("storeLabel")
        val terminalLabel: String? = call.argument("terminalLabel")
        val upiAccountInformation: String? = call.argument("upiAccountInformation")
        val purposeOfTransaction: String? = call.argument("purposeOfTransaction")
        val merchantAlternateLanguagePreference: String? =
                call.argument("merchantAlternateLanguagePreference")
        val merchantNameAlternateLanguage: String? = call.argument("merchantNameAlternateLanguage")
        val merchantCityAlternateLanguage: String? = call.argument("merchantCityAlternateLanguage")
        val individualInfo =
                IndividualInfo().apply {
                  this.bakongAccountId = bakongAccountId
                  this.accountInformation = accountInformation
                  this.acquiringBank = acquiringBank
                  this.currency = KHQRCurrency.KHR
                  this.amount = amount
                  this.merchantName = merchantName
                  this.merchantCity = merchantCity
                  this.billNumber = billNumber
                  this.mobileNumber = mobileNumber
                  this.storeLabel = storeLabel
                  this.terminalLabel = terminalLabel
                  this.upiAccountInformation = upiAccountInformation
                  this.purposeOfTransaction = purposeOfTransaction
                  this.merchantAlternateLanguagePreference = merchantAlternateLanguagePreference
                  this.merchantNameAlternateLanguage = merchantNameAlternateLanguage
                  this.merchantCityAlternateLanguage = merchantCityAlternateLanguage
                }

        // Generate KHQR
        val response: KHQRResponse<KHQRData> = BakongKHQR.generateIndividual(individualInfo)

        // Check response status and return QR data
        if (response.khqrStatus.code == 0) {
          val qrCode = response.data.qr
          val md5Hash = response.data.md5
          // Create a response map with the necessary data
          val responseMap: Map<String, Any?> = mapOf("qrCode" to qrCode, "md5" to md5Hash)
          result.success(responseMap) // Send the map as a success response
        } else {
          result.error("GENERATION_ERROR", "Failed to generate KHQR", null)
        }
      }
      "generateKhqrMerchant" -> {
        val bakongAccountId: String? = call.argument("bakongAccountId")
        val merchantId: String? = call.argument("merchantId")
        val acquiringBank: String? = call.argument("acquiringBank")
        val amount: Double? = call.argument("amount")
        val merchantName: String? = call.argument("merchantName")
        val merchantCity: String? = call.argument("merchantCity")
        val billNumber: String? = call.argument("billNumber")
        val mobileNumber: String? = call.argument("mobileNumber")
        val storeLabel: String? = call.argument("storeLabel")
        val terminalLabel: String? = call.argument("terminalLabel")
        val upiAccountInformation: String? = call.argument("upiAccountInformation")
        val purposeOfTransaction: String? = call.argument("purposeOfTransaction")
        val merchantAlternateLanguagePreference: String? =
                call.argument("merchantAlternateLanguagePreference")
        val merchantNameAlternateLanguage: String? = call.argument("merchantNameAlternateLanguage")
        val merchantCityAlternateLanguage: String? = call.argument("merchantCityAlternateLanguage")
        val merchantInfo =
                MerchantInfo().apply {
                  this.bakongAccountId = bakongAccountId
                  this.merchantId = merchantId
                  this.acquiringBank = acquiringBank
                  this.currency = KHQRCurrency.KHR
                  this.amount = amount
                  this.merchantName = merchantName
                  this.merchantCity = merchantCity
                  this.billNumber = billNumber
                  this.mobileNumber = mobileNumber
                  this.storeLabel = storeLabel
                  this.terminalLabel = terminalLabel
                  this.upiAccountInformation = upiAccountInformation
                  this.purposeOfTransaction = purposeOfTransaction
                  this.merchantAlternateLanguagePreference = merchantAlternateLanguagePreference
                  this.merchantNameAlternateLanguage = merchantNameAlternateLanguage
                  this.merchantCityAlternateLanguage = merchantCityAlternateLanguage
                }

        // Generate KHQR for Merchant
        val response: KHQRResponse<KHQRData> = BakongKHQR.generateMerchant(merchantInfo)

        if (response.khqrStatus.code == 0) {
          val qrCode = response.data.qr
          val md5Hash = response.data.md5
          val responseMap = mapOf("qrCode" to qrCode, "md5" to md5Hash)
          result.success(responseMap)
        } else {
          result.error("GENERATION_ERROR", "Failed to generate KHQR", null)
        }
      }
      "generateDeepLink" -> {
        val url: String? = call.argument("url")
        val qr: String? = call.argument("qr")
        val appName: String? = call.argument("appName")
        val appIconUrl: String? = call.argument("appIconUrl")
        val appDeepLinkCallback: String? = call.argument("appDeepLinkCallback")

        // Create SourceInfo object
        val sourceInfo =
                SourceInfo().apply {
                  this.appName = appName
                  this.appIconUrl = appIconUrl
                  this.appDeepLinkCallback = appDeepLinkCallback
                }

        // Generate KHQR Deep Link
        val response: KHQRResponse<KHQRDeepLinkData> =
                BakongKHQR.generateDeepLink(url, qr, sourceInfo)

        if (response.khqrStatus.code == 0) {
          val shortLink = response.data.shortLink
          val responseMap = mapOf("shortLink" to shortLink)
          result.success(responseMap)
        } else {
          result.error("DEEP_LINK_GENERATION_ERROR", response.khqrStatus.message, null)
        }
      }
      else -> {
        result.notImplemented()
      }
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
