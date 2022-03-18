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


/** This is an auto generated class representing the MMSE type in your schema. */
@immutable
class MMSE extends Model {
  static const classType = const _MMSEModelType();
  final String id;
  final String? _uid;
  final String? _Question1;
  final String? _Question2;
  final String? _Question3;
  final String? _Question4;
  final String? _Question5;
  final String? _Question6;
  final String? _Question7;
  final String? _Question8;
  final String? _Question9;
  final String? _Question10;

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
  
  String get Question1 {
    try {
      return _Question1!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get Question2 {
    try {
      return _Question2!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get Question3 {
    try {
      return _Question3!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get Question4 {
    try {
      return _Question4!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get Question5 {
    try {
      return _Question5!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get Question6 {
    try {
      return _Question6!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get Question7 {
    try {
      return _Question7!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get Question8 {
    try {
      return _Question8!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get Question9 {
    try {
      return _Question9!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get Question10 {
    try {
      return _Question10!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  const MMSE._internal({required this.id, required uid, required Question1, required Question2, required Question3, required Question4, required Question5, required Question6, required Question7, required Question8, required Question9, required Question10}): _uid = uid, _Question1 = Question1, _Question2 = Question2, _Question3 = Question3, _Question4 = Question4, _Question5 = Question5, _Question6 = Question6, _Question7 = Question7, _Question8 = Question8, _Question9 = Question9, _Question10 = Question10;
  
  factory MMSE({String? id, required String uid, required String Question1, required String Question2, required String Question3, required String Question4, required String Question5, required String Question6, required String Question7, required String Question8, required String Question9, required String Question10}) {
    return MMSE._internal(
      id: id == null ? UUID.getUUID() : id,
      uid: uid,
      Question1: Question1,
      Question2: Question2,
      Question3: Question3,
      Question4: Question4,
      Question5: Question5,
      Question6: Question6,
      Question7: Question7,
      Question8: Question8,
      Question9: Question9,
      Question10: Question10);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MMSE &&
      id == other.id &&
      _uid == other._uid &&
      _Question1 == other._Question1 &&
      _Question2 == other._Question2 &&
      _Question3 == other._Question3 &&
      _Question4 == other._Question4 &&
      _Question5 == other._Question5 &&
      _Question6 == other._Question6 &&
      _Question7 == other._Question7 &&
      _Question8 == other._Question8 &&
      _Question9 == other._Question9 &&
      _Question10 == other._Question10;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("MMSE {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("uid=" + "$_uid" + ", ");
    buffer.write("Question1=" + "$_Question1" + ", ");
    buffer.write("Question2=" + "$_Question2" + ", ");
    buffer.write("Question3=" + "$_Question3" + ", ");
    buffer.write("Question4=" + "$_Question4" + ", ");
    buffer.write("Question5=" + "$_Question5" + ", ");
    buffer.write("Question6=" + "$_Question6" + ", ");
    buffer.write("Question7=" + "$_Question7" + ", ");
    buffer.write("Question8=" + "$_Question8" + ", ");
    buffer.write("Question9=" + "$_Question9" + ", ");
    buffer.write("Question10=" + "$_Question10");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  MMSE copyWith({String? id, String? uid, String? Question1, String? Question2, String? Question3, String? Question4, String? Question5, String? Question6, String? Question7, String? Question8, String? Question9, String? Question10}) {
    return MMSE(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      Question1: Question1 ?? this.Question1,
      Question2: Question2 ?? this.Question2,
      Question3: Question3 ?? this.Question3,
      Question4: Question4 ?? this.Question4,
      Question5: Question5 ?? this.Question5,
      Question6: Question6 ?? this.Question6,
      Question7: Question7 ?? this.Question7,
      Question8: Question8 ?? this.Question8,
      Question9: Question9 ?? this.Question9,
      Question10: Question10 ?? this.Question10);
  }
  
  MMSE.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _uid = json['uid'],
      _Question1 = json['Question1'],
      _Question2 = json['Question2'],
      _Question3 = json['Question3'],
      _Question4 = json['Question4'],
      _Question5 = json['Question5'],
      _Question6 = json['Question6'],
      _Question7 = json['Question7'],
      _Question8 = json['Question8'],
      _Question9 = json['Question9'],
      _Question10 = json['Question10'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'uid': _uid, 'Question1': _Question1, 'Question2': _Question2, 'Question3': _Question3, 'Question4': _Question4, 'Question5': _Question5, 'Question6': _Question6, 'Question7': _Question7, 'Question8': _Question8, 'Question9': _Question9, 'Question10': _Question10
  };

  static final QueryField ID = QueryField(fieldName: "mMSE.id");
  static final QueryField UID = QueryField(fieldName: "uid");
  static final QueryField QUESTION1 = QueryField(fieldName: "Question1");
  static final QueryField QUESTION2 = QueryField(fieldName: "Question2");
  static final QueryField QUESTION3 = QueryField(fieldName: "Question3");
  static final QueryField QUESTION4 = QueryField(fieldName: "Question4");
  static final QueryField QUESTION5 = QueryField(fieldName: "Question5");
  static final QueryField QUESTION6 = QueryField(fieldName: "Question6");
  static final QueryField QUESTION7 = QueryField(fieldName: "Question7");
  static final QueryField QUESTION8 = QueryField(fieldName: "Question8");
  static final QueryField QUESTION9 = QueryField(fieldName: "Question9");
  static final QueryField QUESTION10 = QueryField(fieldName: "Question10");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "MMSE";
    modelSchemaDefinition.pluralName = "MMSES";
    
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
      key: MMSE.UID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: MMSE.QUESTION1,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: MMSE.QUESTION2,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: MMSE.QUESTION3,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: MMSE.QUESTION4,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: MMSE.QUESTION5,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: MMSE.QUESTION6,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: MMSE.QUESTION7,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: MMSE.QUESTION8,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: MMSE.QUESTION9,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: MMSE.QUESTION10,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}

class _MMSEModelType extends ModelType<MMSE> {
  const _MMSEModelType();
  
  @override
  MMSE fromJson(Map<String, dynamic> jsonData) {
    return MMSE.fromJson(jsonData);
  }
}