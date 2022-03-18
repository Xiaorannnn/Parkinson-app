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


/** This is an auto generated class representing the DemographicSurvey type in your schema. */
@immutable
class DemographicSurvey extends Model {
  static const classType = const _DemographicSurveyModelType();
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
  final String? _Question11;
  final String? _Question12;
  final String? _Question13;
  final String? _Question14;
  final String? _Question15;
  final String? _Question16;
  final String? _Question17;
  final String? _Question18;
  final String? _Question19;
  final String? _Question20;
  final String? _Question21;
  final String? _Question22;
  final String? _Question23;
  final String? _Question24;
  final String? _Question25;
  final String? _Question26;
  final String? _Question27;
  final String? _Question28;
  final String? _Question29;
  final String? _Question30;
  final String? _Question31;
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
  
  String get Question11 {
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
  
  String get Question12 {
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
  
  String get Question13 {
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
  
  String get Question14 {
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
  
  String get Question15 {
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
  
  String get Question16 {
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
  
  String get Question17 {
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
  
  String get Question18 {
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
  
  String get Question19 {
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
  
  String get Question20 {
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
  
  String get Question21 {
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
  
  String get Question22 {
    try {
      return _Question22!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get Question23 {
    try {
      return _Question23!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get Question24 {
    try {
      return _Question24!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get Question25 {
    try {
      return _Question25!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get Question26 {
    try {
      return _Question26!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get Question27 {
    try {
      return _Question27!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get Question28 {
    try {
      return _Question28!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get Question29 {
    try {
      return _Question29!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get Question30 {
    try {
      return _Question30!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get Question31 {
    try {
      return _Question31!;
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
  
  const DemographicSurvey._internal({required this.id, required uid, required Question1, required Question2, required Question3, required Question4, required Question5, required Question6, required Question7, required Question8, required Question9, required Question10, required Question11, required Question12, required Question13, required Question14, required Question15, required Question16, required Question17, required Question18, required Question19, required Question20, required Question21, required Question22, required Question23, required Question24, required Question25, required Question26, required Question27, required Question28, required Question29, required Question30, required Question31, required SurveyParticipant}): _uid = uid, _Question1 = Question1, _Question2 = Question2, _Question3 = Question3, _Question4 = Question4, _Question5 = Question5, _Question6 = Question6, _Question7 = Question7, _Question8 = Question8, _Question9 = Question9, _Question10 = Question10, _Question11 = Question11, _Question12 = Question12, _Question13 = Question13, _Question14 = Question14, _Question15 = Question15, _Question16 = Question16, _Question17 = Question17, _Question18 = Question18, _Question19 = Question19, _Question20 = Question20, _Question21 = Question21, _Question22 = Question22, _Question23 = Question23, _Question24 = Question24, _Question25 = Question25, _Question26 = Question26, _Question27 = Question27, _Question28 = Question28, _Question29 = Question29, _Question30 = Question30, _Question31 = Question31, _SurveyParticipant = SurveyParticipant;
  
  factory DemographicSurvey({String? id, required String uid, required String Question1, required String Question2, required String Question3, required String Question4, required String Question5, required String Question6, required String Question7, required String Question8, required String Question9, required String Question10, required String Question11, required String Question12, required String Question13, required String Question14, required String Question15, required String Question16, required String Question17, required String Question18, required String Question19, required String Question20, required String Question21, required String Question22, required String Question23, required String Question24, required String Question25, required String Question26, required String Question27, required String Question28, required String Question29, required String Question30, required String Question31, required String SurveyParticipant}) {
    return DemographicSurvey._internal(
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
      Question22: Question22,
      Question23: Question23,
      Question24: Question24,
      Question25: Question25,
      Question26: Question26,
      Question27: Question27,
      Question28: Question28,
      Question29: Question29,
      Question30: Question30,
      Question31: Question31,
      SurveyParticipant: SurveyParticipant);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DemographicSurvey &&
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
      _Question22 == other._Question22 &&
      _Question23 == other._Question23 &&
      _Question24 == other._Question24 &&
      _Question25 == other._Question25 &&
      _Question26 == other._Question26 &&
      _Question27 == other._Question27 &&
      _Question28 == other._Question28 &&
      _Question29 == other._Question29 &&
      _Question30 == other._Question30 &&
      _Question31 == other._Question31 &&
      _SurveyParticipant == other._SurveyParticipant;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("DemographicSurvey {");
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
    buffer.write("Question10=" + "$_Question10" + ", ");
    buffer.write("Question11=" + "$_Question11" + ", ");
    buffer.write("Question12=" + "$_Question12" + ", ");
    buffer.write("Question13=" + "$_Question13" + ", ");
    buffer.write("Question14=" + "$_Question14" + ", ");
    buffer.write("Question15=" + "$_Question15" + ", ");
    buffer.write("Question16=" + "$_Question16" + ", ");
    buffer.write("Question17=" + "$_Question17" + ", ");
    buffer.write("Question18=" + "$_Question18" + ", ");
    buffer.write("Question19=" + "$_Question19" + ", ");
    buffer.write("Question20=" + "$_Question20" + ", ");
    buffer.write("Question21=" + "$_Question21" + ", ");
    buffer.write("Question22=" + "$_Question22" + ", ");
    buffer.write("Question23=" + "$_Question23" + ", ");
    buffer.write("Question24=" + "$_Question24" + ", ");
    buffer.write("Question25=" + "$_Question25" + ", ");
    buffer.write("Question26=" + "$_Question26" + ", ");
    buffer.write("Question27=" + "$_Question27" + ", ");
    buffer.write("Question28=" + "$_Question28" + ", ");
    buffer.write("Question29=" + "$_Question29" + ", ");
    buffer.write("Question30=" + "$_Question30" + ", ");
    buffer.write("Question31=" + "$_Question31" + ", ");
    buffer.write("SurveyParticipant=" + "$_SurveyParticipant");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  DemographicSurvey copyWith({String? id, String? uid, String? Question1, String? Question2, String? Question3, String? Question4, String? Question5, String? Question6, String? Question7, String? Question8, String? Question9, String? Question10, String? Question11, String? Question12, String? Question13, String? Question14, String? Question15, String? Question16, String? Question17, String? Question18, String? Question19, String? Question20, String? Question21, String? Question22, String? Question23, String? Question24, String? Question25, String? Question26, String? Question27, String? Question28, String? Question29, String? Question30, String? Question31, String? SurveyParticipant}) {
    return DemographicSurvey(
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
      Question22: Question22 ?? this.Question22,
      Question23: Question23 ?? this.Question23,
      Question24: Question24 ?? this.Question24,
      Question25: Question25 ?? this.Question25,
      Question26: Question26 ?? this.Question26,
      Question27: Question27 ?? this.Question27,
      Question28: Question28 ?? this.Question28,
      Question29: Question29 ?? this.Question29,
      Question30: Question30 ?? this.Question30,
      Question31: Question31 ?? this.Question31,
      SurveyParticipant: SurveyParticipant ?? this.SurveyParticipant);
  }
  
  DemographicSurvey.fromJson(Map<String, dynamic> json)  
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
      _Question10 = json['Question10'],
      _Question11 = json['Question11'],
      _Question12 = json['Question12'],
      _Question13 = json['Question13'],
      _Question14 = json['Question14'],
      _Question15 = json['Question15'],
      _Question16 = json['Question16'],
      _Question17 = json['Question17'],
      _Question18 = json['Question18'],
      _Question19 = json['Question19'],
      _Question20 = json['Question20'],
      _Question21 = json['Question21'],
      _Question22 = json['Question22'],
      _Question23 = json['Question23'],
      _Question24 = json['Question24'],
      _Question25 = json['Question25'],
      _Question26 = json['Question26'],
      _Question27 = json['Question27'],
      _Question28 = json['Question28'],
      _Question29 = json['Question29'],
      _Question30 = json['Question30'],
      _Question31 = json['Question31'],
      _SurveyParticipant = json['SurveyParticipant'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'uid': _uid, 'Question1': _Question1, 'Question2': _Question2, 'Question3': _Question3, 'Question4': _Question4, 'Question5': _Question5, 'Question6': _Question6, 'Question7': _Question7, 'Question8': _Question8, 'Question9': _Question9, 'Question10': _Question10, 'Question11': _Question11, 'Question12': _Question12, 'Question13': _Question13, 'Question14': _Question14, 'Question15': _Question15, 'Question16': _Question16, 'Question17': _Question17, 'Question18': _Question18, 'Question19': _Question19, 'Question20': _Question20, 'Question21': _Question21, 'Question22': _Question22, 'Question23': _Question23, 'Question24': _Question24, 'Question25': _Question25, 'Question26': _Question26, 'Question27': _Question27, 'Question28': _Question28, 'Question29': _Question29, 'Question30': _Question30, 'Question31': _Question31, 'SurveyParticipant': _SurveyParticipant
  };

  static final QueryField ID = QueryField(fieldName: "demographicSurvey.id");
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
  static final QueryField QUESTION22 = QueryField(fieldName: "Question22");
  static final QueryField QUESTION23 = QueryField(fieldName: "Question23");
  static final QueryField QUESTION24 = QueryField(fieldName: "Question24");
  static final QueryField QUESTION25 = QueryField(fieldName: "Question25");
  static final QueryField QUESTION26 = QueryField(fieldName: "Question26");
  static final QueryField QUESTION27 = QueryField(fieldName: "Question27");
  static final QueryField QUESTION28 = QueryField(fieldName: "Question28");
  static final QueryField QUESTION29 = QueryField(fieldName: "Question29");
  static final QueryField QUESTION30 = QueryField(fieldName: "Question30");
  static final QueryField QUESTION31 = QueryField(fieldName: "Question31");
  static final QueryField SURVEYPARTICIPANT = QueryField(fieldName: "SurveyParticipant");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "DemographicSurvey";
    modelSchemaDefinition.pluralName = "DemographicSurveys";
    
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
      key: DemographicSurvey.UID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: DemographicSurvey.QUESTION1,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: DemographicSurvey.QUESTION2,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: DemographicSurvey.QUESTION3,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: DemographicSurvey.QUESTION4,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: DemographicSurvey.QUESTION5,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: DemographicSurvey.QUESTION6,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: DemographicSurvey.QUESTION7,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: DemographicSurvey.QUESTION8,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: DemographicSurvey.QUESTION9,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: DemographicSurvey.QUESTION10,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: DemographicSurvey.QUESTION11,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: DemographicSurvey.QUESTION12,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: DemographicSurvey.QUESTION13,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: DemographicSurvey.QUESTION14,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: DemographicSurvey.QUESTION15,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: DemographicSurvey.QUESTION16,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: DemographicSurvey.QUESTION17,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: DemographicSurvey.QUESTION18,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: DemographicSurvey.QUESTION19,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: DemographicSurvey.QUESTION20,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: DemographicSurvey.QUESTION21,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: DemographicSurvey.QUESTION22,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: DemographicSurvey.QUESTION23,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: DemographicSurvey.QUESTION24,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: DemographicSurvey.QUESTION25,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: DemographicSurvey.QUESTION26,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: DemographicSurvey.QUESTION27,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: DemographicSurvey.QUESTION28,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: DemographicSurvey.QUESTION29,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: DemographicSurvey.QUESTION30,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: DemographicSurvey.QUESTION31,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: DemographicSurvey.SURVEYPARTICIPANT,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}

class _DemographicSurveyModelType extends ModelType<DemographicSurvey> {
  const _DemographicSurveyModelType();
  
  @override
  DemographicSurvey fromJson(Map<String, dynamic> jsonData) {
    return DemographicSurvey.fromJson(jsonData);
  }
}