///
//  Generated code. Do not modify.
//  source: server.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class FieldUpdate extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FieldUpdate', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'helloworld'), createEmptyInstance: create)
    ..aOM<Field>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'field', subBuilder: Field.create)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..hasRequiredFields = false
  ;

  FieldUpdate._() : super();
  factory FieldUpdate({
    Field? field_1,
    $core.String? id,
  }) {
    final _result = create();
    if (field_1 != null) {
      _result.field_1 = field_1;
    }
    if (id != null) {
      _result.id = id;
    }
    return _result;
  }
  factory FieldUpdate.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FieldUpdate.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FieldUpdate clone() => FieldUpdate()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FieldUpdate copyWith(void Function(FieldUpdate) updates) => super.copyWith((message) => updates(message as FieldUpdate)) as FieldUpdate; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FieldUpdate create() => FieldUpdate._();
  FieldUpdate createEmptyInstance() => create();
  static $pb.PbList<FieldUpdate> createRepeated() => $pb.PbList<FieldUpdate>();
  @$core.pragma('dart2js:noInline')
  static FieldUpdate getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FieldUpdate>(create);
  static FieldUpdate? _defaultInstance;

  @$pb.TagNumber(1)
  Field get field_1 => $_getN(0);
  @$pb.TagNumber(1)
  set field_1(Field v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasField_1() => $_has(0);
  @$pb.TagNumber(1)
  void clearField_1() => clearField(1);
  @$pb.TagNumber(1)
  Field ensureField_1() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get id => $_getSZ(1);
  @$pb.TagNumber(2)
  set id($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);
}

enum Field_It {
  double_1, 
  align, 
  color, 
  notSet
}

class Field extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, Field_It> _Field_ItByTag = {
    1 : Field_It.double_1,
    2 : Field_It.align,
    3 : Field_It.color,
    0 : Field_It.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Field', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'helloworld'), createEmptyInstance: create)
    ..oo(0, [1, 2, 3])
    ..aOM<DoubleField>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'double', subBuilder: DoubleField.create)
    ..aOM<AlignmentField>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'align', subBuilder: AlignmentField.create)
    ..aOM<ColorField>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'color', subBuilder: ColorField.create)
    ..hasRequiredFields = false
  ;

  Field._() : super();
  factory Field({
    DoubleField? double_1,
    AlignmentField? align,
    ColorField? color,
  }) {
    final _result = create();
    if (double_1 != null) {
      _result.double_1 = double_1;
    }
    if (align != null) {
      _result.align = align;
    }
    if (color != null) {
      _result.color = color;
    }
    return _result;
  }
  factory Field.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Field.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Field clone() => Field()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Field copyWith(void Function(Field) updates) => super.copyWith((message) => updates(message as Field)) as Field; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Field create() => Field._();
  Field createEmptyInstance() => create();
  static $pb.PbList<Field> createRepeated() => $pb.PbList<Field>();
  @$core.pragma('dart2js:noInline')
  static Field getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Field>(create);
  static Field? _defaultInstance;

  Field_It whichIt() => _Field_ItByTag[$_whichOneof(0)]!;
  void clearIt() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  DoubleField get double_1 => $_getN(0);
  @$pb.TagNumber(1)
  set double_1(DoubleField v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasDouble_1() => $_has(0);
  @$pb.TagNumber(1)
  void clearDouble_1() => clearField(1);
  @$pb.TagNumber(1)
  DoubleField ensureDouble_1() => $_ensure(0);

  @$pb.TagNumber(2)
  AlignmentField get align => $_getN(1);
  @$pb.TagNumber(2)
  set align(AlignmentField v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasAlign() => $_has(1);
  @$pb.TagNumber(2)
  void clearAlign() => clearField(2);
  @$pb.TagNumber(2)
  AlignmentField ensureAlign() => $_ensure(1);

  @$pb.TagNumber(3)
  ColorField get color => $_getN(2);
  @$pb.TagNumber(3)
  set color(ColorField v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasColor() => $_has(2);
  @$pb.TagNumber(3)
  void clearColor() => clearField(3);
  @$pb.TagNumber(3)
  ColorField ensureColor() => $_ensure(2);
}

class DoubleField extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DoubleField', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'helloworld'), createEmptyInstance: create)
    ..a<$core.double>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'value', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  DoubleField._() : super();
  factory DoubleField({
    $core.double? value,
  }) {
    final _result = create();
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory DoubleField.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DoubleField.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DoubleField clone() => DoubleField()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DoubleField copyWith(void Function(DoubleField) updates) => super.copyWith((message) => updates(message as DoubleField)) as DoubleField; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DoubleField create() => DoubleField._();
  DoubleField createEmptyInstance() => create();
  static $pb.PbList<DoubleField> createRepeated() => $pb.PbList<DoubleField>();
  @$core.pragma('dart2js:noInline')
  static DoubleField getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DoubleField>(create);
  static DoubleField? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get value => $_getN(0);
  @$pb.TagNumber(1)
  set value($core.double v) { $_setDouble(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);
}

class AlignmentField extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AlignmentField', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'helloworld'), createEmptyInstance: create)
    ..a<$core.double>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'x', $pb.PbFieldType.OD)
    ..a<$core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'y', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  AlignmentField._() : super();
  factory AlignmentField({
    $core.double? x,
    $core.double? y,
  }) {
    final _result = create();
    if (x != null) {
      _result.x = x;
    }
    if (y != null) {
      _result.y = y;
    }
    return _result;
  }
  factory AlignmentField.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AlignmentField.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AlignmentField clone() => AlignmentField()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AlignmentField copyWith(void Function(AlignmentField) updates) => super.copyWith((message) => updates(message as AlignmentField)) as AlignmentField; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AlignmentField create() => AlignmentField._();
  AlignmentField createEmptyInstance() => create();
  static $pb.PbList<AlignmentField> createRepeated() => $pb.PbList<AlignmentField>();
  @$core.pragma('dart2js:noInline')
  static AlignmentField getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AlignmentField>(create);
  static AlignmentField? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get x => $_getN(0);
  @$pb.TagNumber(1)
  set x($core.double v) { $_setDouble(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasX() => $_has(0);
  @$pb.TagNumber(1)
  void clearX() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get y => $_getN(1);
  @$pb.TagNumber(2)
  set y($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasY() => $_has(1);
  @$pb.TagNumber(2)
  void clearY() => clearField(2);
}

class ColorField extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ColorField', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'helloworld'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'color', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  ColorField._() : super();
  factory ColorField({
    $core.int? color,
  }) {
    final _result = create();
    if (color != null) {
      _result.color = color;
    }
    return _result;
  }
  factory ColorField.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ColorField.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ColorField clone() => ColorField()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ColorField copyWith(void Function(ColorField) updates) => super.copyWith((message) => updates(message as ColorField)) as ColorField; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ColorField create() => ColorField._();
  ColorField createEmptyInstance() => create();
  static $pb.PbList<ColorField> createRepeated() => $pb.PbList<ColorField>();
  @$core.pragma('dart2js:noInline')
  static ColorField getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ColorField>(create);
  static ColorField? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get color => $_getIZ(0);
  @$pb.TagNumber(1)
  set color($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasColor() => $_has(0);
  @$pb.TagNumber(1)
  void clearColor() => clearField(1);
}

class InitializeFileRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'InitializeFileRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'helloworld'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'path')
    ..hasRequiredFields = false
  ;

  InitializeFileRequest._() : super();
  factory InitializeFileRequest({
    $core.String? path,
  }) {
    final _result = create();
    if (path != null) {
      _result.path = path;
    }
    return _result;
  }
  factory InitializeFileRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory InitializeFileRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  InitializeFileRequest clone() => InitializeFileRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  InitializeFileRequest copyWith(void Function(InitializeFileRequest) updates) => super.copyWith((message) => updates(message as InitializeFileRequest)) as InitializeFileRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static InitializeFileRequest create() => InitializeFileRequest._();
  InitializeFileRequest createEmptyInstance() => create();
  static $pb.PbList<InitializeFileRequest> createRepeated() => $pb.PbList<InitializeFileRequest>();
  @$core.pragma('dart2js:noInline')
  static InitializeFileRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<InitializeFileRequest>(create);
  static InitializeFileRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get path => $_getSZ(0);
  @$pb.TagNumber(1)
  set path($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPath() => $_has(0);
  @$pb.TagNumber(1)
  void clearPath() => clearField(1);
}

class HelloReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'HelloReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'helloworld'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..hasRequiredFields = false
  ;

  HelloReply._() : super();
  factory HelloReply({
    $core.String? message,
  }) {
    final _result = create();
    if (message != null) {
      _result.message = message;
    }
    return _result;
  }
  factory HelloReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HelloReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  HelloReply clone() => HelloReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  HelloReply copyWith(void Function(HelloReply) updates) => super.copyWith((message) => updates(message as HelloReply)) as HelloReply; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HelloReply create() => HelloReply._();
  HelloReply createEmptyInstance() => create();
  static $pb.PbList<HelloReply> createRepeated() => $pb.PbList<HelloReply>();
  @$core.pragma('dart2js:noInline')
  static HelloReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HelloReply>(create);
  static HelloReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);
}

class GetFieldsRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetFieldsRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'helloworld'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..hasRequiredFields = false
  ;

  GetFieldsRequest._() : super();
  factory GetFieldsRequest({
    $core.String? id,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    return _result;
  }
  factory GetFieldsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetFieldsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetFieldsRequest clone() => GetFieldsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetFieldsRequest copyWith(void Function(GetFieldsRequest) updates) => super.copyWith((message) => updates(message as GetFieldsRequest)) as GetFieldsRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetFieldsRequest create() => GetFieldsRequest._();
  GetFieldsRequest createEmptyInstance() => create();
  static $pb.PbList<GetFieldsRequest> createRepeated() => $pb.PbList<GetFieldsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetFieldsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetFieldsRequest>(create);
  static GetFieldsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class GetFieldsResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetFieldsResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'helloworld'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..m<$core.String, Field>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fields', entryClassName: 'GetFieldsResponse.FieldsEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OM, valueCreator: Field.create, packageName: const $pb.PackageName('helloworld'))
    ..hasRequiredFields = false
  ;

  GetFieldsResponse._() : super();
  factory GetFieldsResponse({
    $core.String? id,
    $core.Map<$core.String, Field>? fields,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (fields != null) {
      _result.fields.addAll(fields);
    }
    return _result;
  }
  factory GetFieldsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetFieldsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetFieldsResponse clone() => GetFieldsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetFieldsResponse copyWith(void Function(GetFieldsResponse) updates) => super.copyWith((message) => updates(message as GetFieldsResponse)) as GetFieldsResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetFieldsResponse create() => GetFieldsResponse._();
  GetFieldsResponse createEmptyInstance() => create();
  static $pb.PbList<GetFieldsResponse> createRepeated() => $pb.PbList<GetFieldsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetFieldsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetFieldsResponse>(create);
  static GetFieldsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.Map<$core.String, Field> get fields => $_getMap(1);
}

class SelectStream extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SelectStream', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'helloworld'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  SelectStream._() : super();
  factory SelectStream() => create();
  factory SelectStream.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SelectStream.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SelectStream clone() => SelectStream()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SelectStream copyWith(void Function(SelectStream) updates) => super.copyWith((message) => updates(message as SelectStream)) as SelectStream; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SelectStream create() => SelectStream._();
  SelectStream createEmptyInstance() => create();
  static $pb.PbList<SelectStream> createRepeated() => $pb.PbList<SelectStream>();
  @$core.pragma('dart2js:noInline')
  static SelectStream getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SelectStream>(create);
  static SelectStream? _defaultInstance;
}

class SelectedWidgetWithProperties extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SelectedWidgetWithProperties', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'helloworld'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type')
    ..m<$core.String, Field>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'properties', entryClassName: 'SelectedWidgetWithProperties.PropertiesEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OM, valueCreator: Field.create, packageName: const $pb.PackageName('helloworld'))
    ..hasRequiredFields = false
  ;

  SelectedWidgetWithProperties._() : super();
  factory SelectedWidgetWithProperties({
    $core.String? id,
    $core.String? type,
    $core.Map<$core.String, Field>? properties,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (type != null) {
      _result.type = type;
    }
    if (properties != null) {
      _result.properties.addAll(properties);
    }
    return _result;
  }
  factory SelectedWidgetWithProperties.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SelectedWidgetWithProperties.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SelectedWidgetWithProperties clone() => SelectedWidgetWithProperties()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SelectedWidgetWithProperties copyWith(void Function(SelectedWidgetWithProperties) updates) => super.copyWith((message) => updates(message as SelectedWidgetWithProperties)) as SelectedWidgetWithProperties; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SelectedWidgetWithProperties create() => SelectedWidgetWithProperties._();
  SelectedWidgetWithProperties createEmptyInstance() => create();
  static $pb.PbList<SelectedWidgetWithProperties> createRepeated() => $pb.PbList<SelectedWidgetWithProperties>();
  @$core.pragma('dart2js:noInline')
  static SelectedWidgetWithProperties getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SelectedWidgetWithProperties>(create);
  static SelectedWidgetWithProperties? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get type => $_getSZ(1);
  @$pb.TagNumber(2)
  set type($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => clearField(2);

  @$pb.TagNumber(3)
  $core.Map<$core.String, Field> get properties => $_getMap(2);
}

