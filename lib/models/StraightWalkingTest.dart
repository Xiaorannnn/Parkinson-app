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


/** This is an auto generated class representing the StraightWalkingTest type in your schema. */
@immutable
class StraightWalkingTest extends Model {
  static const classType = const _StraightWalkingTestModelType();
  final String id;
  final String? _uid;
  final String? _MedicineAnswer;
  final String? _stepcount;

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
  
  String get stepcount {
    try {
      return _stepcount!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  const StraightWalkingTest._internal({required this.id, required uid, required MedicineAnswer, required stepcount}): _uid = uid, _MedicineAnswer = MedicineAnswer, _stepcount = stepcount;
  
  factory StraightWalkingTest({String? id, required String uid, required String MedicineAnswer, required String stepcount}) {
    return StraightWalkingTest._internal(
      id: id == null ? UUID.getUUID() : id,
      uid: uid,
      MedicineAnswer: MedicineAnswer,
      stepcount: stepcount);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StraightWalkingTest &&
      id == other.id &&
      _uid == other._uid &&
      _MedicineAnswer == other._MedicineAnswer &&
      _stepcount == other._stepcount;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("StraightWalkingTest {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("uid=" + "$_uid" + ", ");
    buffer.write("MedicineAnswer=" + "$_MedicineAnswer" + ", ");
    buffer.write("stepcount=" + "$_stepcount");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  StraightWalkingTest copyWith({String? id, String? uid, String? MedicineAnswer, String? stepcount}) {
    return StraightWalkingTest(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      MedicineAnswer: MedicineAnswer ?? this.MedicineAnswer,
      stepcount: stepcount ?? this.stepcount);
  }
  
  StraightWalkingTest.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _uid = json['uid'],
      _MedicineAnswer = json['MedicineAnswer'],
      _stepcount = json['stepcount'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'uid': _uid, 'MedicineAnswer': _MedicineAnswer, 'stepcount': _stepcount
  };

  static final QueryField ID = QueryField(fieldName: "straightWalkingTest.id");
  static final QueryField UID = QueryField(fieldName: "uid");
  static final QueryField MEDICINEANSWER = QueryField(fieldName: "MedicineAnswer");
  static final QueryField STEPCOUNT = QueryField(fieldName: "stepcount");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "StraightWalkingTest";
    modelSchemaDefinition.pluralName = "StraightWalkingTests";
    
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
      key: StraightWalkingTest.UID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: StraightWalkingTest.MEDICINEANSWER,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: StraightWalkingTest.STEPCOUNT,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}

class _StraightWalkingTestModelType extends ModelType<StraightWalkingTest> {
  const _StraightWalkingTestModelType();
  
  @override
  StraightWalkingTest fromJson(Map<String, dynamic> jsonData) {
    return StraightWalkingTest.fromJson(jsonData);
  }
}