class AuthErrorResponseModel {
  final int? code;
  final String? message;

  AuthErrorResponseModel({this.code, this.message});

  factory AuthErrorResponseModel.fromMap(Map<String, dynamic> map) {
    final responseMap = map['response'] as Map<String, dynamic>?;

    return AuthErrorResponseModel(
      code: responseMap != null ? responseMap['code'] as int? : null,
      message: responseMap != null ? responseMap['message'] as String? : null,
    );
  }

  @override
  String toString() => 'Code: $code, Message: $message';
}
