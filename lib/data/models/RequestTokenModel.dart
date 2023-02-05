class RequestTokenModel {
  RequestTokenModel({
    this.success,
    this.expiresAt,
    this.requestToken,
  });

  factory RequestTokenModel.fromJson(dynamic json) {
    return RequestTokenModel(
        success: json['success'],
        expiresAt: json['expires_at'],
        requestToken: json['request_token']);
  }
  final bool? success;
  final String? expiresAt;
  final String? requestToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['request_token'] = requestToken;
    return map;
  }
}
