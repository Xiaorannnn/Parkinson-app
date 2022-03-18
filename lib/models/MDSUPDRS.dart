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


/** This is an auto generated class representing the MDSUPDRS type in your schema. */
@immutable
class MDSUPDRS extends Model {
  static const classType = const _MDSUPDRSModelType();
  final String id;
  final String? _uid;
  final int? _Question1;
  final int? _Question2;
  final int? _Question3;
  final int? _Question4;
  final int? _Question5;
  final int? _Question6;
  final int? _Question7;
  final int? _Question8;
  final int? _Question9;
  final int? _Question10;
  final int? _Question11;
  final int? _Question12;
  final int? _Question13;
  final int? _Question14;
  final int? _Question15;
  final int? _Question16;
  final int? _Question17;
  final int? _Question18;
  final int? _Question19;
  final int? _Question20;
  final int? _Question21;
  final String? _SurveyParticipant;

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
  
  int get Question1 {
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
  
  int get Question2 {
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
  
  int get Question3 {
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
  
  int get Question4 {
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
  
  int get Question5 {
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
  
  int get Question6 {
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
  
  int get Question7 {
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
  
  int get Question8 {
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
  
  int get Question9 {
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
  
  int get Question10 {
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
  
  int get Question11 {
    try {
      return _Question11!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int get Question12 {
    try {
      return _Question12!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int get Question13 {
    try {
      return _Question13!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int get Question14 {
    try {
      return _Question14!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int get Question15 {
    try {
      return _Question15!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int get Question16 {
    try {
      return _Question16!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int get Question17 {
    try {
      return _Question17!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int get Question18 {
    try {
      return _Question18!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int get Question19 {
    try {
      return _Question19!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int get Question20 {
    try {
      return _Question20!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int get Question21 {
    try {
      return _Question21!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get SurveyParticipant {
    try {
      return _SurveyParticipant!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  const MDSUPDRS._internal({required this.id, required uid, required Question1, required Question2, required Question3, required Question4, required Question5, required Question6, required Question7, required Question8, required Question9, required Question10, required Question11, required Question12, required Question13, required Question14, required Question15, required Question16, required Question17, required Question18, required Question19, required Question20, required Question21, required SurveyParticipant}): _uid = uid, _Question1 = Question1, _Question2 = Question2, _Question3 = Question3, _Question4 = Question4, _Question5 = Question5, _Question6 = Question6, _Question7 = Question7, _Question8 = Question8, _Question9 = Question9, _Question10 = Question10, _Question11 = Question11, _Question12 = Question12, _Question13 = Question13, _Question14 = Question14, _Question15 = Question15, _Question16 = Question16, _Question17 = Question17, _Question18 = Question18, _Question19 = Question19, _Question20 = Question20, _Question21 = Question21, _SurveyParticipant = SurveyParticipant;
  
  factory MDSUPDRS({String? id, required String uid, required int Question1, required int Question2, required int Question3, required int Question4, required int Question5, required int Question6, required int Question7, required int Question8, required int Question9, required int Question10, required int Question11, required int Question12, required int Question13, required int Question14, required int Question15, required int Question16, required int Question17, required int Question18, required int Question19, required int Question20, required int Question21, required String SurveyParticipant}) {
    return MDSUPDRS._internal(
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
      Question10: Question10,
      Question11: Question11,
      Question12: Question12,
      Question13: Question13,
      Question14: Question14,
      Question15: Question15,
      Question16: Question16,
      Question17: Question17,
      Question18: Question18,
      Question19: Question19,
      Question20: Question20,
      Question21: Question21,
      SurveyParticipant: SurveyParticipant);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MDSUPDRS &&
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
      _Question10 == other._Question10 &&
      _Question11 == other._Question11 &&
      _Question12 == other._Question12 &&
      _Question13 == other._Question13 &&
      _Question14 == other._Question14 &&
      _Question15 == other._Question15 &&
      _Question16 == other._Question16 &&
      _Question17 == other._Question17 &&
      _Question18 == other._Question18 &&
      _Question19 == other._Question19 &&
      _Question20 == other._Question20 &&
      _Question21 == other._Question21 &&
      _SurveyParticipant == other._SurveyParticipant;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("MDSUPDRS {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("uid=" + "$_uid" + ", ");
    buffer.write("Question1=" + (_Question1 != null ? _Question1!.toString() : "null") + ", ");
    buffer.write("Question2=" + (_Question2 != null ? _Question2!.toString() : "null") + ", ");
    buffer.write("Question3=" + (_Question3 != null ? _Question3!.toString() : "null") + ", ");
    buffer.write("Question4=" + (_Question4 != null ? _Question4!.toString() : "null") + ", ");
    buffer.write("Question5=" + (_Question5 != null ? _Question5!.toString() : "null") + ", ");
    buffer.write("Question6=" + (_Question6 != null ? _Question6!.toString() : "null") + ", ");
    buffer.write("Question7=" + (_Question7 != null ? _Question7!.toString() : "null") + ", ");
    buffer.write("Question8=" + (_Question8 != null ? _Question8!.toString() : "null") + ", ");
    buffer.write("Question9=" + (_Question9 != null ? _Question9!.toString() : "null") + ", ");
    buffer.write("Question10=" + (_Question10 != null ? _Question10!.toString() : "null") + ", ");
    buffer.write("Question11=" + (_Question11 != null ? _Question11!.toString() : "null") + ", ");
    buffer.write("Question12=" + (_Question12 != null ? _Question12!.toString() : "null") + ", ");
    buffer.write("Question13=" + (_Question13 != null ? _Question13!.toString() : "null") + ", ");
    buffer.write("Question14=" + (_Question14 != null ? _Question14!.toString() : "null") + ", ");
    buffer.write("Question15=" + (_Question15 != null ? _Question15!.toString() : "null") + ", ");
    buffer.write("Question16=" + (_Question16 != null ? _Question16!.toString() : "null") + ", ");
    buffer.write("Question17=" + (_Question17 != null ? _Question17!.toString() : "null") + ", ");
    buffer.write("Question18=" + (_Question18 != null ? _Question18!.toString() : "null") + ", ");
    buffer.write("Question19=" + (_Question19 != null ? _Question19!.toString() : "null") + ", ");
    buffer.write("Question20=" + (_Question20 != null ? _Question20!.toString() : "null") + ", ");
    buffer.write("Question21=" + (_Question21 != null ? _Question21!.toString() : "null") + ", ");
    buffer.write("SurveyParticipant=" + "$_SurveyParticipant");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  MDSUPDRS copyWith({String? id, String? uid, int? Question1, int? Question2, int? Question3, int? Question4, int? Question5, int? Question6, int? Question7, int? Question8, int? Question9, int? Question10, int? Question11, int? Question12, int? Question13, int? Question14, int? Question15, int? Question16, int? Question17, int? Question18, int? Question19, int? Question20, int? Question21, String? SurveyParticipant}) {
    return MDSUPDRS(
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
      Question10: Question10 ?? this.Question10,
      Question11: Question11 ?? this.Question11,
      Question12: Question12 ?? this.Question12,
      Question13: Question13 ?? this.Question13,
      Question14: Question14 ?? this.Question14,
      Question15: Question15 ?? this.Question15,
      Question16: Question16 ?? this.Question16,
      Question17: Question17 ?? this.Question17,
      Question18: Question18 ?? this.Question18,
      Question19: Question19 ?? this.Question19,
      Question20: Question20 ?? this.Question20,
      Question21: Question21 ?? this.Question21,
      SurveyParticipant: SurveyParticipant ?? this.SurveyParticipant);
  }
  
  MDSUPDRS.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _uid = json['uid'],
      _Question1 = (json['Question1'] as num?)?.toInt(),
      _Question2 = (json['Question2'] as num?)?.toInt(),
      _Question3 = (json['Question3'] as num?)?.toInt(),
      _Question4 = (json['Question4'] as num?)?.toInt(),
      _Question5 = (json['Question5'] as num?)?.toInt(),
      _Question6 = (json['Question6'] as num?)?.toInt(),
      _Question7 = (json['Question7'] as num?)?.toInt(),
      _Question8 = (json['Question8'] as num?)?.toInt(),
      _Question9 = (json['Question9'] as num?)?.toInt(),
      _Question10 = (json['Question10'] as num?)?.toInt(),
      _Question11 = (json['Question11'] as num?)?.toInt(),
      _Question12 = (json['Question12'] as num?)?.toInt(),
      _Question13 = (json['Question13'] as num?)?.toInt(),
      _Question14 = (json['Question14'] as num?)?.toInt(),
      _Question15 = (json['Question15'] as num?)?.toInt(),
      _Question16 = (json['Question16'] as num?)?.toInt(),
      _Question17 = (json['Question17'] as num?)?.toInt(),
      _Question18 = (json['Question18'] as num?)?.toInt(),
      _Question19 = (json['Question19'] as num?)?.toInt(),
      _Question20 = (json['Question20'] as num?)?.toInt(),
      _Question21 = (json['Question21'] as num?)?.toInt(),
      _SurveyParticipant = json['SurveyParticipant'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'uid': _uid, 'Question1': _Question1, 'Question2': _Question2, 'Question3': _Question3, 'Question4': _Question4, 'Question5': _Question5, 'Question6': _Question6, 'Question7': _Question7, 'Question8': _Question8, 'Question9': _Question9, 'Question10': _Question10, 'Question11': _Question11, 'Question12': _Question12, 'Question13': _Question13, 'Question14': _Question14, 'Question15': _Question15, 'Question16': _Question16, 'Question17': _Question17, 'Question18': _Question18, 'Question19': _Question19, 'Question20': _Question20, 'Question21': _Question21, 'SurveyParticipant': _SurveyParticipant
  };

  static final QueryField ID = QueryField(fieldName: "mDSUPDRS.id");
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
  static final QueryField QUESTION11 = QueryField(fieldName: "Question11");
  static final QueryField QUESTION12 = QueryField(fieldName: "Question12");
  static final QueryField QUESTION13 = QueryField(fieldName: "Question13");
  static final QueryField QUESTION14 = QueryField(fieldName: "Question14");
  static final QueryField QUESTION15 = QueryField(fieldName: "Question15");
  static final QueryField QUESTION16 = QueryField(fieldName: "Question16");
  static final QueryField QUESTION17 = QueryField(fieldName: "Question17");
  static final QueryField QUESTION18 = QueryField(fieldName: "Question18");
  static final QueryField QUESTION19 = QueryField(fieldName: "Question19");
  static final QueryField QUESTION20 = QueryField(fieldName: "Question20");
  static final QueryField QUESTION21 = QueryField(fieldName: "Question21");
  static final QueryField SURVEYPARTICIPANT = QueryField(fieldName: "SurveyParticipant");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "MDSUPDRS";
    modelSchemaDefinition.pluralName = "MDSUPDRS";
    
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
      key: MDSUPDRS.UID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: MDSUPDRS.QUESTION1,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: MDSUPDRS.QUESTION2,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: MDSUPDRS.QUESTION3,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: MDSUPDRS.QUESTION4,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: MDSUPDRS.QUESTION5,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: MDSUPDRS.QUESTION6,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: MDSUPDRS.QUESTION7,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: MDSUPDRS.QUESTION8,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: MDSUPDRS.QUESTION9,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: MDSUPDRS.QUESTION10,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: MDSUPDRS.QUESTION11,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: MDSUPDRS.QUESTION12,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: MDSUPDRS.QUESTION13,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: MDSUPDRS.QUESTION14,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: MDSUPDRS.QUESTION15,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: MDSUPDRS.QUESTION16,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: MDSUPDRS.QUESTION17,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: MDSUPDRS.QUESTION18,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: MDSUPDRS.QUESTION19,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: MDSUPDRS.QUESTION20,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: MDSUPDRS.QUESTION21,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: MDSUPDRS.SURVEYPARTICIPANT,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}

class _MDSUPDRSModelType extends ModelType<MDSUPDRS> {
  const _MDSUPDRSModelType();
  
  @override
  MDSUPDRS fromJson(Map<String, dynamic> jsonData) {
    return MDSUPDRS.fromJson(jsonData);
  }
}