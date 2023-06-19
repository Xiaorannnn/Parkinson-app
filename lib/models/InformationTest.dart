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


/** This is an auto generated class representing the InformationTest type in your schema. */
@immutable
class InformationTest extends Model {
  static const classType = const _InformationTestModelType();
  final String id;
  final String? _uid;
  final String? _number;
  final String? _age;
  final String? _gender;
  final String? _testtime;
  final String? _medicinetype;
  final String? _medicinefreq;
  final String? _symptom;

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
  
  String get number {
    try {
      return _number!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get age {
    try {
      return _age!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get gender {
    try {
      return _gender!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get testtime {
    try {
      return _testtime!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get medicinetype {
    try {
      return _medicinetype!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get medicinefreq {
    try {
      return _medicinefreq!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get symptom {
    try {
      return _symptom!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  const InformationTest._internal({required this.id, required uid, required number, required age, required gender, required testtime, required medicinetype, required medicinefreq, required symptom}): _uid = uid, _number = number, _age = age, _gender = gender, _testtime = testtime, _medicinetype = medicinetype, _medicinefreq = medicinefreq, _symptom = symptom;
  
  factory InformationTest({String? id, required String uid, required String number, required String age, required String gender, required String testtime, required String medicinetype, required String medicinefreq, required String symptom}) {
    return InformationTest._internal(
      id: id == null ? UUID.getUUID() : id,
      uid: uid,
      number: number,
      age: age,
      gender: gender,
      testtime: testtime,
      medicinetype: medicinetype,
      medicinefreq: medicinefreq,
      symptom: symptom);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InformationTest &&
      id == other.id &&
      _uid == other._uid &&
      _number == other._number &&
      _age == other._age &&
      _gender == other._gender &&
      _testtime == other._testtime &&
      _medicinetype == other._medicinetype &&
      _medicinefreq == other._medicinefreq &&
      _symptom == other._symptom;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("InformationTest {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("uid=" + "$_uid" + ", ");
    buffer.write("number=" + "$_number" + ", ");
    buffer.write("age=" + "$_age" + ", ");
    buffer.write("gender=" + "$_gender" + ", ");
    buffer.write("testtime=" + "$_testtime" + ", ");
    buffer.write("medicinetype=" + "$_medicinetype" + ", ");
    buffer.write("medicinefreq=" + "$_medicinefreq" + ", ");
    buffer.write("symptom=" + "$_symptom");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  InformationTest copyWith({String? id, String? uid, String? number, String? age, String? gender, String? testtime, String? medicinetype, String? medicinefreq, String? symptom}) {
    return InformationTest(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      number: number ?? this.number,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      testtime: testtime ?? this.testtime,
      medicinetype: medicinetype ?? this.medicinetype,
      medicinefreq: medicinefreq ?? this.medicinefreq,
      symptom: symptom ?? this.symptom);
  }
  
  InformationTest.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _uid = json['uid'],
      _number = json['number'],
      _age = json['age'],
      _gender = json['gender'],
      _testtime = json['testtime'],
      _medicinetype = json['medicinetype'],
      _medicinefreq = json['medicinefreq'],
      _symptom = json['symptom'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'uid': _uid, 'number': _number, 'age': _age, 'gender': _gender, 'testtime': _testtime, 'medicinetype': _medicinetype, 'medicinefreq': _medicinefreq, 'symptom': _symptom
  };

  static final QueryField ID = QueryField(fieldName: "informationTest.id");
  static final QueryField UID = QueryField(fieldName: "uid");
  static final QueryField NUMBER = QueryField(fieldName: "number");
  static final QueryField AGE = QueryField(fieldName: "age");
  static final QueryField GENDER = QueryField(fieldName: "gender");
  static final QueryField TESTTIME = QueryField(fieldName: "testtime");
  static final QueryField MEDICINETYPE = QueryField(fieldName: "medicinetype");
  static final QueryField MEDICINEFREQ = QueryField(fieldName: "medicinefreq");
  static final QueryField SYMPTOM = QueryField(fieldName: "symptom");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "InformationTest";
    modelSchemaDefinition.pluralName = "InformationTests";
    
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
      key: InformationTest.UID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: InformationTest.NUMBER,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: InformationTest.AGE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: InformationTest.GENDER,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: InformationTest.TESTTIME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: InformationTest.MEDICINETYPE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: InformationTest.MEDICINEFREQ,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: InformationTest.SYMPTOM,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}

class _InformationTestModelType extends ModelType<InformationTest> {
  const _InformationTestModelType();
  
  @override
  InformationTest fromJson(Map<String, dynamic> jsonData) {
    return InformationTest.fromJson(jsonData);
  }
}