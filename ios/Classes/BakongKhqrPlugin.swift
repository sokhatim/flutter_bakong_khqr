import Flutter
import UIKit
import BakongKHQR

public class BakongKhqrPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_bakong_khqr", binaryMessenger: registrar.messenger())
    let instance = BakongKhqrPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "generateKhqrIndividual":
            generateKhqrIndividual(call: call, result: result)
        case "generateKhqrMerchant":
            generateKhqrMerchant(call: call, result: result)
        case "generateDeepLink":
            generateDeepLink(call: call, result: result)
        default:
            result(FlutterMethodNotImplemented)
        }
    }

    private func generateKhqrIndividual(call: FlutterMethodCall, result: @escaping FlutterResult) {
    
    if call.arguments == nil {
      result(FlutterError(code: "Missing Parameter", message: "Missing Parameter", details: nil))
      return
    }

    let arguments = call.arguments as! [String: Any?]
    let currency = arguments["currency"] as! String
    let info = IndividualInfo(
      accountId: arguments["bakongAccountId"] as! String,
      merchantName: arguments["merchantName"] as! String,
      accountInformation: arguments["accountInformation"] as? String,
      acquiringBank: arguments["acquiringBank"] as? String,
      currency: currency == "KHR" ? .Khr : .Usd,
      amount: arguments["amount"] as! Double
    )
    info?.billNumber = arguments["billNumber"] as? String
    info?.mobileNumber = arguments["mobileNumber"] as? String
    info?.storeLabel = arguments["storeLabel"] as? String
    info?.terminalLabel = arguments["terminalLabel"] as? String
    info?.purposeOfTransaction = arguments["purposeOfTransaction"] as? String
    info?.upiAccountInformation = arguments["upiAccountInformation"] as? String
    info?.merchantAlternateLanguagePreference =
      arguments["merchantAlternateLanguagePreference"] as? String
    info?.merchantNameAlternateLanguage = arguments["merchantNameAlternateLanguage"] as? String
    info?.merchantCity = arguments["merchantCity"] as? String
    info?.merchantCityAlternateLanguage = arguments["merchantCityAlternateLanguage"] as? String

    let response = BakongKHQR.generateIndividual(info!)
    
    // Check for success and handle response
    if response.status?.code == 0 {
        let khqrData = response.data as? KHQRData
        if let qrCode = khqrData?.qr, let md5Hash = khqrData?.md5 {
            let responseMap: [String: Any] = ["qrCode": qrCode, "md5": md5Hash]
            result(responseMap)
        } else {
            result(FlutterError(code: "INVALID_RESPONSE", message: "QR code or MD5 hash missing in response", details: nil))
        }
    } else {
        result(FlutterError(code: "GENERATION_ERROR", message: "Failed to generate KHQR", details: response))
    }
}


    private func generateKhqrMerchant(call: FlutterMethodCall, result: @escaping FlutterResult) {
    
    if call.arguments == nil {
      result(FlutterError(code: "Missing Parameter", message: "Missing Parameter", details: nil))
      return
    }

    let arguments = call.arguments as! [String: Any?]
    let currency = arguments["currency"] as! String
    let info = MerchantInfo(
      accountId: arguments["bakongAccountId"] as! String,
      merchantId: arguments["merchantId"] as! String,
      merchantName: arguments["merchantName"] as! String,
      acquiringBank: arguments["acquiringBank"] as! String,
      currency: currency == "KHR" ? .Khr : .Usd,
      amount: arguments["amount"] as! Double
    )
    info?.billNumber = arguments["billNumber"] as? String
    info?.mobileNumber = arguments["mobileNumber"] as? String
    info?.storeLabel = arguments["storeLabel"] as? String
    info?.terminalLabel = arguments["terminalLabel"] as? String
    info?.purposeOfTransaction = arguments["purposeOfTransaction"] as? String
    info?.upiAccountInformation = arguments["upiAccountInformation"] as? String
    info?.merchantAlternateLanguagePreference =
      arguments["merchantAlternateLanguagePreference"] as? String
    info?.merchantNameAlternateLanguage = arguments["merchantNameAlternateLanguage"] as? String
    info?.merchantCity = arguments["merchantCity"] as? String
    info?.merchantCityAlternateLanguage = arguments["merchantCityAlternateLanguage"] as? String

    // Call the backend to generate KHQR for merchant
    let response = BakongKHQR.generateMerchant(info!)
    
    // Check for success and handle response
    if response.status?.code == 0 {
        let khqrData = response.data as? KHQRData
        if let qrCode = khqrData?.qr, let md5Hash = khqrData?.md5 {
            let responseMap: [String: Any] = ["qrCode": qrCode, "md5": md5Hash]
            result(responseMap)
        } else {
            result(FlutterError(code: "INVALID_RESPONSE", message: "QR code or MD5 hash missing in response", details: nil))
        }
    } else {
        result(FlutterError(code: "GENERATION_ERROR", message: "Failed to generate KHQR", details: response))
    }
}


    private func generateDeepLink(call: FlutterMethodCall, result: @escaping FlutterResult) {
    if call.arguments == nil {
      result(FlutterError(code: "Missing Parameter", message: "Missing Parameter", details: nil))
      return
    }

    let arguments = call.arguments as! [String: Any?]
    let qr = arguments["qr"] as! String
    let url = arguments["url"] as! String

    let sourceInfo = SourceInfo()
    if arguments["sourceInfo"] != nil {
      let sourceInfoObj = arguments["sourceInfo"] as! [String: Any?]
      sourceInfo.appName = sourceInfoObj["appName"] as! String
      sourceInfo.appIconURL = sourceInfoObj["appIconUrl"] as! String
      sourceInfo.appDeepLinkCallback = sourceInfoObj["appDeepLinkCallBack"] as! String
    }

    let response = BakongKHQR.generateDeepLink(url, qr: qr, sourceInfo: sourceInfo)
    if response?.status?.code == 0 {
        let shortLinkData = response?.data as? KHQRDeepLinkData
            let responseMap: [String: Any] = ["shortLink": shortLinkData?.shortLink]
            result(responseMap)
        
    } else {
        result(FlutterError(code: "GENERATION_ERROR", message: "Failed to generate DeepLink", details: response))
    } 
    
    }
}
