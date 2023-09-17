// ignore: avoid_classes_with_only_static_members
/// Configure REST API properties to be used later on
/// throughout API calls
///
/// Though for a specific use case these can also be
/// overridden in API call functions it [getRequest()]
/// and [postRequest()]
class APIConfig {
  /// base url for the project
  static String baseUrl = '';

  /// header for the project
  static Map<String, String>? header;

  /// duration for timeout request
  static Duration responseTimeOut = const Duration(seconds: 60);

  /// Allowed SHA256 Fingerprint
  static String allowedSHAFingerprint = '';
}
