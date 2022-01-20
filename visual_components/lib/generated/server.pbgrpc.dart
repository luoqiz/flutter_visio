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
  static final _$getFields =
      $grpc.ClientMethod<$0.GetFieldsRequest, $0.GetFieldsResponse>(
          '/helloworld.Server/GetFields',
          ($0.GetFieldsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetFieldsResponse.fromBuffer(value));
  static final _$streamUpdate =
      $grpc.ClientMethod<$0.FieldUpdate, $0.HelloReply>(
          '/helloworld.Server/StreamUpdate',
          ($0.FieldUpdate value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.HelloReply.fromBuffer(value));
  static final _$streamSelected =
      $grpc.ClientMethod<$0.SelectStream, $0.SelectedWidgetWithProperties>(
          '/helloworld.Server/StreamSelected',
          ($0.SelectStream value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.SelectedWidgetWithProperties.fromBuffer(value));
  static final _$streamSourceCode =
      $grpc.ClientMethod<$0.InitSourceCodeStream, $0.SourceCode>(
          '/helloworld.Server/StreamSourceCode',
          ($0.InitSourceCodeStream value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.SourceCode.fromBuffer(value));

  ServerClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.HelloReply> initialize(
      $0.InitializeFileRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$initialize, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetFieldsResponse> getFields(
      $0.GetFieldsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getFields, request, options: options);
  }

  $grpc.ResponseFuture<$0.HelloReply> streamUpdate(
      $async.Stream<$0.FieldUpdate> request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$streamUpdate, request, options: options)
        .single;
  }

  $grpc.ResponseStream<$0.SelectedWidgetWithProperties> streamSelected(
      $0.SelectStream request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$streamSelected, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseStream<$0.SourceCode> streamSourceCode(
      $0.InitSourceCodeStream request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$streamSourceCode, $async.Stream.fromIterable([request]),
        options: options);
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
    $addMethod($grpc.ServiceMethod<$0.GetFieldsRequest, $0.GetFieldsResponse>(
        'GetFields',
        getFields_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetFieldsRequest.fromBuffer(value),
        ($0.GetFieldsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FieldUpdate, $0.HelloReply>(
        'StreamUpdate',
        streamUpdate,
        true,
        false,
        ($core.List<$core.int> value) => $0.FieldUpdate.fromBuffer(value),
        ($0.HelloReply value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.SelectStream, $0.SelectedWidgetWithProperties>(
            'StreamSelected',
            streamSelected_Pre,
            false,
            true,
            ($core.List<$core.int> value) => $0.SelectStream.fromBuffer(value),
            ($0.SelectedWidgetWithProperties value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.InitSourceCodeStream, $0.SourceCode>(
        'StreamSourceCode',
        streamSourceCode_Pre,
        false,
        true,
        ($core.List<$core.int> value) =>
            $0.InitSourceCodeStream.fromBuffer(value),
        ($0.SourceCode value) => value.writeToBuffer()));
  }

  $async.Future<$0.HelloReply> initialize_Pre($grpc.ServiceCall call,
      $async.Future<$0.InitializeFileRequest> request) async {
    return initialize(call, await request);
  }

  $async.Future<$0.GetFieldsResponse> getFields_Pre($grpc.ServiceCall call,
      $async.Future<$0.GetFieldsRequest> request) async {
    return getFields(call, await request);
  }

  $async.Stream<$0.SelectedWidgetWithProperties> streamSelected_Pre(
      $grpc.ServiceCall call, $async.Future<$0.SelectStream> request) async* {
    yield* streamSelected(call, await request);
  }

  $async.Stream<$0.SourceCode> streamSourceCode_Pre($grpc.ServiceCall call,
      $async.Future<$0.InitSourceCodeStream> request) async* {
    yield* streamSourceCode(call, await request);
  }

  $async.Future<$0.HelloReply> initialize(
      $grpc.ServiceCall call, $0.InitializeFileRequest request);
  $async.Future<$0.GetFieldsResponse> getFields(
      $grpc.ServiceCall call, $0.GetFieldsRequest request);
  $async.Future<$0.HelloReply> streamUpdate(
      $grpc.ServiceCall call, $async.Stream<$0.FieldUpdate> request);
  $async.Stream<$0.SelectedWidgetWithProperties> streamSelected(
      $grpc.ServiceCall call, $0.SelectStream request);
  $async.Stream<$0.SourceCode> streamSourceCode(
      $grpc.ServiceCall call, $0.InitSourceCodeStream request);
}
