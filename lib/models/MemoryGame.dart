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


/** This is an auto generated class representing the MemoryGame type in your schema. */
@immutable
class MemoryGame extends Model {
  static const classType = const _MemoryGameModelType();
  final String id;
  final String? _uid;
  final String? _MedicineAnswer;
  final int? _Tries;
  final int? _Difficulty;
  final bool? _GameFinished;

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
  
  int get Tries {
    try {
      return _Tries!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int get Difficulty {
    try {
      return _Difficulty!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  bool get GameFinished {
    try {
      return _GameFinished!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  const MemoryGame._internal({required this.id, required uid, required MedicineAnswer, required Tries, required Difficulty, required GameFinished}): _uid = uid, _MedicineAnswer = MedicineAnswer, _Tries = Tries, _Difficulty = Difficulty, _GameFinished = GameFinished;
  
  factory MemoryGame({String? id, required String uid, required String MedicineAnswer, required int Tries, required int Difficulty, required bool GameFinished}) {
    return MemoryGame._internal(
      id: id == null ? UUID.getUUID() : id,
      uid: uid,
      MedicineAnswer: MedicineAnswer,
      Tries: Tries,
      Difficulty: Difficulty,
      GameFinished: GameFinished);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MemoryGame &&
      id == other.id &&
      _uid == other._uid &&
      _MedicineAnswer == other._MedicineAnswer &&
      _Tries == other._Tries &&
      _Difficulty == other._Difficulty &&
      _GameFinished == other._GameFinished;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("MemoryGame {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("uid=" + "$_uid" + ", ");
    buffer.write("MedicineAnswer=" + "$_MedicineAnswer" + ", ");
    buffer.write("Tries=" + (_Tries != null ? _Tries!.toString() : "null") + ", ");
    buffer.write("Difficulty=" + (_Difficulty != null ? _Difficulty!.toString() : "null") + ", ");
    buffer.write("GameFinished=" + (_GameFinished != null ? _GameFinished!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  MemoryGame copyWith({String? id, String? uid, String? MedicineAnswer, int? Tries, int? Difficulty, bool? GameFinished}) {
    return MemoryGame(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      MedicineAnswer: MedicineAnswer ?? this.MedicineAnswer,
      Tries: Tries ?? this.Tries,
      Difficulty: Difficulty ?? this.Difficulty,
      GameFinished: GameFinished ?? this.GameFinished);
  }
  
  MemoryGame.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _uid = json['uid'],
      _MedicineAnswer = json['MedicineAnswer'],
      _Tries = (json['Tries'] as num?)?.toInt(),
      _Difficulty = (json['Difficulty'] as num?)?.toInt(),
      _GameFinished = json['GameFinished'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'uid': _uid, 'MedicineAnswer': _MedicineAnswer, 'Tries': _Tries, 'Difficulty': _Difficulty, 'GameFinished': _GameFinished
  };

  static final QueryField ID = QueryField(fieldName: "memoryGame.id");
  static final QueryField UID = QueryField(fieldName: "uid");
  static final QueryField MEDICINEANSWER = QueryField(fieldName: "MedicineAnswer");
  static final QueryField TRIES = QueryField(fieldName: "Tries");
  static final QueryField DIFFICULTY = QueryField(fieldName: "Difficulty");
  static final QueryField GAMEFINISHED = QueryField(fieldName: "GameFinished");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "MemoryGame";
    modelSchemaDefinition.pluralName = "MemoryGames";
    
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
      key: MemoryGame.UID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: MemoryGame.MEDICINEANSWER,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: MemoryGame.TRIES,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: MemoryGame.DIFFICULTY,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: MemoryGame.GAMEFINISHED,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
  });
}

class _MemoryGameModelType extends ModelType<MemoryGame> {
  const _MemoryGameModelType();
  
  @override
  MemoryGame fromJson(Map<String, dynamic> jsonData) {
    return MemoryGame.fromJson(jsonData);
  }
}