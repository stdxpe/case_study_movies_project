import 'dart:convert';

class TokenModel {
  final int id;
  final double tokenCount;
  final double formerTokenCount;
  final double price;
  final String currency;
  final double discountPercent;
  final String assetPath;

  TokenModel({
    required this.id,
    required this.tokenCount,
    required this.formerTokenCount,
    required this.price,
    required this.currency,
    required this.discountPercent,
    required this.assetPath,
  });

  factory TokenModel.fromMap(Map<String, dynamic> json) => TokenModel(
        id: json["id"],
        tokenCount: json["tokenCount"],
        formerTokenCount: json["formerTokenCount"],
        price: json["price"].toDouble(),
        currency: json["currency"],
        discountPercent: json["discountPercent"].toDouble(),
        assetPath: json["assetPath"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "tokenCount": tokenCount,
        "formerTokenCount": formerTokenCount,
        "price": price,
        "currency": currency,
        "discountPercent": discountPercent,
        "assetPath": assetPath,
      };

  factory TokenModel.fromJson(String str) =>
      TokenModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  TokenModel copyWith({
    int? id,
    double? tokenCount,
    double? formerTokenCount,
    double? price,
    String? currency,
    double? discountPercent,
    String? assetPath,
  }) =>
      TokenModel(
        id: id ?? this.id,
        tokenCount: tokenCount ?? this.tokenCount,
        formerTokenCount: formerTokenCount ?? this.formerTokenCount,
        price: price ?? this.price,
        currency: currency ?? this.currency,
        discountPercent: discountPercent ?? this.discountPercent,
        assetPath: assetPath ?? this.assetPath,
      );

  @override
  String toString() {
    return 'TokenModel(id: $id, tokenCount: $tokenCount, formerTokenCount: $formerTokenCount, price: $price, currency: $currency, discountPercent: $discountPercent, assetPath: $assetPath)';
  }
}
