import 'dart:convert';
import 'dart:developer' as developer;
import 'package:case_study_movies_project/services/abstract_classes/i_logger_service.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class FirebaseLoggerService implements ILoggerService {
  final FirebaseAnalytics _analytics;
  final FirebaseCrashlytics _crashlytics;

  FirebaseLoggerService({
    required FirebaseAnalytics analytics,
    required FirebaseCrashlytics crashlytics,
  })  : _analytics = analytics,
        _crashlytics = crashlytics;

  String _formatLog(String level, String message,
      [Map<String, dynamic>? data]) {
    final hasData = data != null && data.isNotEmpty;
    final dataString = hasData ? ' | ${jsonEncode(data)}' : '';
    return '[$level] $message$dataString';
  }

  String _formatError(Object? error, StackTrace? stackTrace) {
    if (error == null && stackTrace == null) return '';
    final errorStr = error?.toString() ?? '';
    // final stackStr = stackTrace?.toString() ?? '';
    // return '\nError: $errorStr\nStackTrace: $stackStr';
    return '\nError: $errorStr';
  }

  @override
  void logInfo(String message, {Map<String, dynamic>? params}) {
    developer.log(_formatLog('INFO', message, params), level: 800);
  }

  @override
  Future<void> logEvent(String name, {Map<String, dynamic>? params}) async {
    developer.log(
        '[EVENT] $name${params != null && params.isNotEmpty ? ' | ${jsonEncode(params)}' : ''}');

    final safeParams = params?.map<String, Object>((key, value) {
      if (value == null) return MapEntry(key, 'null');
      if (value is String || value is int || value is double || value is bool) {
        return MapEntry(key, value);
      }
      return MapEntry(key, value.toString());
    });

    await _analytics.logEvent(name: name, parameters: safeParams);
  }

  @override
  Future<void> logWarning(
    String message, {
    Object? error,
    StackTrace? stack,
    Map<String, dynamic>? params,
  }) async {
    developer.log(
        '${_formatLog('WARNING', message, params)}${_formatError(error, stack)}',
        level: 900);

    await _crashlytics.log(
      '${_formatLog('WARNING', message, params)}${_formatError(error, stack)}',
    );
  }

  @override
  Future<void> logError(
    String message, {
    Object? error,
    StackTrace? stack,
    Map<String, dynamic>? params,
  }) async {
    developer.log(
        '${_formatLog('ERROR', message, params)}${_formatError(error, stack)}',
        level: 1000);
    await _crashlytics.log(
      '${_formatLog('ERROR', message, params)}${_formatError(error, stack)}',
    );
    if (error != null) {
      final exception =
          error is Exception ? error : Exception(error.toString());
      await _crashlytics.recordError(exception, null,
          reason: message, fatal: false);
    }
  }

  @override
  Future<void> logFatal(
    String message, {
    Object? error,
    StackTrace? stack,
    Map<String, dynamic>? params,
  }) async {
    developer.log(
        '${_formatLog('FATAL', message, params)}${_formatError(error, stack)}',
        level: 1200);

    await _crashlytics.log(
        '${_formatLog('FATAL', message, params)}${_formatError(error, stack)}');

    if (error != null) {
      final exception =
          error is Exception ? error : Exception(error.toString());
      await _crashlytics.recordError(exception, null,
          reason: message, fatal: true);
    }
  }
}
