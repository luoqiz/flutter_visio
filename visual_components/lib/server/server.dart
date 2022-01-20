import 'package:grpc/grpc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:visual_components/generated/server.pbgrpc.dart';
import 'package:visual_components/properties/converter.dart';

import '../editor/key_resolver.dart';

final EditorServer editorServer = EditorServer();

class EditorServer extends ServerServiceBase {
  PublishSubject<SelectedWidgetWithProperties> updateSubject = PublishSubject();

  PublishSubject<SourceCode> updateSourceCode = PublishSubject();

  @override
  Future<GetFieldsResponse> getFields(
      ServiceCall call, GetFieldsRequest request) {
    // TODO: implement getFields
    throw UnimplementedError();
  }

  @override
  Future<HelloReply> initialize(
      ServiceCall call, InitializeFileRequest request) {
    print("Got init!");
    throw UnimplementedError();
  }

  @override
  Stream<SelectedWidgetWithProperties> streamSelected(
      ServiceCall call, SelectStream request) {
    return updateSubject.stream;
  }

  @override
  Stream<SourceCode> streamSourceCode(
      ServiceCall call, InitSourceCodeStream request) {
    return updateSourceCode;
  }

  @override
  Future<HelloReply> streamUpdate(
      ServiceCall call, Stream<FieldUpdate> request) async {
    // TODO move this logic out of here
    await for (var it in request) {
      print("Resceived ${it.toString()}");
      var widgetId = it.id;
      var propertyName = it.propertyName;
      var state = keyResolver.map[widgetId];
      state?.currentState
          ?.setValue(propertyName, convertToProperty(it.property));
    }
    return HelloReply();
  }
}
