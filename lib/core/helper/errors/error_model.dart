class ErrorModel {
  final dynamic statusCode;
  final String errorMsg;

  ErrorModel({required this.statusCode, required this.errorMsg});

  factory ErrorModel.jsonData(jsonData) {
    return ErrorModel(
      statusCode: jsonData['error']['message'],
      errorMsg: jsonData['error']['type'],
    );
  }
}
