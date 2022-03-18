/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, file_names, unnecessary_new, prefer_if_null_operators, prefer_const_constructors, slash_for_doc_comments, annotate_overrides, non_constant_identifier_names, unnecessary_string_interpolations, prefer_adjacent_string_concatenation, unnecessary_const, dead_code

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the RecordVowelTest type in your schema. */
@immutable
class RecordVowelTest extends Model {
  static const classType = const _RecordVowelTestModelType();
  final String id;
  final String? _uid;
  final String? _MedicineAnswer;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String get uid {
    try {
      return _uid!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get MedicineAnswer {
    try {
      return _MedicineAnswer!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  const RecordVowelTest._internal({required this.id, required uid, required MedicineAnswer}): _uid = uid, _MedicineAnswer = MedicineAnswer;
  
  factory RecordVowelTest({String? id, required String uid, required String MedicineAnswer}) {
    return RecordVowelTest._internal(
      id: id == null ? UUID.getUUID() : id,
      uid: uid,
      MedicineAnswer: MedicineAnswer);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RecordVowelTest &&
      id == other.id &&
      _uid == other._uid &&
      _MedicineAnswer == other._MedicineAnswer;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("RecordVowelTest {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("uid=" + "$_uid" + ", ");
    buffer.write("MedicineAnswer=" + "$_MedicineAnswer");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  RecordVowelTest copyWith({String? id, String? uid, String? MedicineAnswer}) {
    return RecordVowelTest(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      MedicineAnswer: MedicineAnswer ?? this.MedicineAnswer);
  }
  
  RecordVowelTest.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _uid = json['uid'],
      _MedicineAnswer = json['MedicineAnswer'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'uid': _uid, 'MedicineAnswer': _MedicineAnswer
  };

  static final QueryField ID = QueryField(fieldName: "recordVowelTest.id");
  static final QueryField UID = QueryField(fieldName: "uid");
  static final QueryField MEDICINEANSWER = QueryField(fieldName: "MedicineAnswer");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "RecordVowelTest";
    modelSchemaDefinition.pluralName = "RecordVowelTests";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PUBLIC,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: RecordVowelTest.UID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: RecordVowelTest.MEDICINEANSWER,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}

class _RecordVowelTestModelType extends ModelType<RecordVowelTest> {
  const _RecordVowelTestModelType();
  
  @override
  RecordVowelTest fromJson(Map<String, dynamic> jsonData) {
    return RecordVowelTest.fromJson(jsonData);
  }
}