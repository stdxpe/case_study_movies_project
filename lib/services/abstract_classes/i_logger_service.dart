abstract class ILoggerService {
  void logDebug(String message, {Map<String, dynamic>? extraData});
  void logInfo(String message, {Map<String, dynamic>? extraData});
  void logWarning(String message, {Map<String, dynamic>? extraData});
  void logError(
    String message, [
    Exception? exception,
    StackTrace? stackTrace,
    Map<String, dynamic>? extraData,
  ]);
  void logFatal(
    String message, [
    Exception? exception,
    StackTrace? stackTrace,
    Map<String, dynamic>? extraData,
  ]);
}
