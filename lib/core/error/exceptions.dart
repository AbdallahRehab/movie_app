import 'package:movies_app/core/network/error_message_model.dart';

class ServerException implements Exception {
  final ErrorMassageModel errorMassageModel;

  ServerException({required this.errorMassageModel});
}

class DatabaseException implements Exception {
  final ErrorMassageModel errorMassageModel;

  DatabaseException({required this.errorMassageModel});
}
