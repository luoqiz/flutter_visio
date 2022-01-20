import 'package:grpc/grpc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:visual_components/generated/server.pbgrpc.dart';

class EditorServer extends ServerServiceBase {


  PublishSubject<SelectedWidgetWithProperties> updateSubject = PublishSubject();

  @override
  Future<HelloReply> initialize(ServiceCall call, InitializeFileRequest request) {
    Field f = Field()..double_1 = (DoubleField()..value = 4.0);

    f.getField(f.whichIt().index);
    // TODO: implement initialize
    throw UnimplementedError();
  }

  @override
  Future<GetFieldsResponse> getFields(ServiceCall call, GetFieldsRequest request) {
    // TODO: implement getFields
    throw UnimplementedError();
  }

  @override
  Future<HelloReply> streamUpdate(ServiceCall call, Stream<FieldUpdate> request) {
    // TODO: implement streamUpdate
    throw UnimplementedError();
  }

  @override
  Stream<SelectedWidgetWithProperties> streamSelected(ServiceCall call, SelectStream request) {
    return updateSubject.stream;
  }

}