import 'dart:developer' as developer;
import 'package:case_study_movies_project/services/abstract_classes/i_logger_service.dart';

class LoggerService implements ILoggerService {
  @override
  void logDebug(String message, {Map<String, dynamic>? extraData}) {
    developer.log('[DEBUG] $message', level: 500, error: extraData);

    /// TODO: [Firebase Analytics] Send debug logs as Analytics events here
  }

  @override
  void logInfo(String message, {Map<String, dynamic>? extraData}) {
    developer.log('[INFO] $message', level: 800, error: extraData);

    /// TODO: [Firebase Analytics] Send informational logs as Analytics events here
  }

  @override
  void logWarning(String message, {Map<String, dynamic>? extraData}) {
    developer.log('[WARNING] $message', level: 900, error: extraData);

    /// TODO: [Firebase Crashlytics] Log warnings or custom events here
  }

  @override
  void logError(String message,
      [Exception? exception,
      StackTrace? stackTrace,
      Map<String, dynamic>? extraData]) {
    developer.log('[ERROR] $message',
        level: 1000, error: exception, stackTrace: stackTrace);

    /// TODO: [Firebase Crashlytics] Record errors here
  }

  @override
  void logFatal(String message,
      [Exception? exception,
      StackTrace? stackTrace,
      Map<String, dynamic>? extraData]) {
    developer.log('[FATAL] $message',
        level: 1200, error: exception, stackTrace: stackTrace);

    /// TODO: [Firebase Crashlytics] Record fatal errors (app crashes) here
  }
}
