abstract class ILoggerService {
  void logInfo(String message, {Map<String, dynamic>? params});

  Future<void> logEvent(String name, {Map<String, dynamic>? params});

  Future<void> logWarning(
    String message, {
    Object? error,
    StackTrace? stack,
    Map<String, dynamic>? params,
  });

  Future<void> logError(
    String message, {
    Object? error,
    StackTrace? stack,
    Map<String, dynamic>? params,
  });

  Future<void> logFatal(
    String message, {
    Object? error,
    StackTrace? stack,
    Map<String, dynamic>? params,
  });
}
