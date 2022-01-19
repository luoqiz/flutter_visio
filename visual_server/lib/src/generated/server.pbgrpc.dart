///
//  Generated code. Do not modify.
//  source: server.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'server.pb.dart' as $0;
export 'server.pb.dart';

class ServerClient extends $grpc.Client {
  static final _$initialize =
      $grpc.ClientMethod<$0.InitializeFileRequest, $0.HelloReply>(
          '/helloworld.Server/Initialize',
          ($0.InitializeFileRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.HelloReply.fromBuffer(value));

  ServerClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.HelloReply> initialize(
      $0.InitializeFileRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$initialize, request, options: options);
  }
}

abstract class ServerServiceBase extends $grpc.Service {
  $core.String get $name => 'helloworld.Server';

  ServerServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.InitializeFileRequest, $0.HelloReply>(
        'Initialize',
        initialize_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.InitializeFileRequest.fromBuffer(value),
        ($0.HelloReply value) => value.writeToBuffer()));
  }

  $async.Future<$0.HelloReply> initialize_Pre($grpc.ServiceCall call,
      $async.Future<$0.InitializeFileRequest> request) async {
    return initialize(call, await request);
  }

  $async.Future<$0.HelloReply> initialize(
      $grpc.ServiceCall call, $0.InitializeFileRequest request);
}
