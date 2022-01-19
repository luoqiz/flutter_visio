import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:grpc/grpc.dart';
import 'package:visual_server/src/generated/server.pbgrpc.dart';

class ServerService extends ServerServiceBase {
  @override
  Future<HelloReply> initialize(
      ServiceCall call, InitializeFileRequest request) {
    // TODO: implement initialize
    throw UnimplementedError();
    // return null;
  }
}

Future<void> main(List<String> args) async {
  List<Service> services = [];
  services.add(ServerService());
  final server = Server(services);
  await server.serve(port: 50051);
  if (kDebugMode) {
    print('Server listening on port ${server.port}...');
  }
}
