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
import 'AuditoryMemoryFiveWords.dart';
import 'AuditoryMemoryFourWords.dart';
import 'AuditoryMemoryThreeWords.dart';
import 'ClockDrawingTest.dart';
import 'DemographicSurvey.dart';
import 'InformationTest.dart';
import 'JoinCirclesTest.dart';
import 'MDSUPDRS.dart';
import 'MMSE.dart';
import 'MemoryGame.dart';
import 'RecordBreathTest.dart';
import 'RecordSentenceTest.dart';
import 'RecordVowelTest.dart';
import 'RhythmTest.dart';
import 'StraightWalkingTest.dart';
import 'SubmitTime.dart';
import 'TremorTest.dart';
import 'TurningTest.dart';
import 'UserAccount.dart';

export 'AuditoryMemoryFiveWords.dart';
export 'AuditoryMemoryFourWords.dart';
export 'AuditoryMemoryThreeWords.dart';
export 'ClockDrawingTest.dart';
export 'DemographicSurvey.dart';
export 'InformationTest.dart';
export 'JoinCirclesTest.dart';
export 'MDSUPDRS.dart';
export 'MMSE.dart';
export 'MemoryGame.dart';
export 'RecordBreathTest.dart';
export 'RecordSentenceTest.dart';
export 'RecordVowelTest.dart';
export 'RhythmTest.dart';
export 'StraightWalkingTest.dart';
export 'SubmitTime.dart';
export 'TremorTest.dart';
export 'TurningTest.dart';
export 'UserAccount.dart';

class ModelProvider implements ModelProviderInterface {
  @override
  String version = "7c67fa6983a685944fa77cb7ee65b9fc";
  @override
  List<ModelSchema> modelSchemas = [AuditoryMemoryFiveWords.schema, AuditoryMemoryFourWords.schema, AuditoryMemoryThreeWords.schema, ClockDrawingTest.schema, DemographicSurvey.schema, InformationTest.schema, JoinCirclesTest.schema, MDSUPDRS.schema, MMSE.schema, MemoryGame.schema, RecordBreathTest.schema, RecordSentenceTest.schema, RecordVowelTest.schema, RhythmTest.schema, StraightWalkingTest.schema, SubmitTime.schema, TremorTest.schema, TurningTest.schema, UserAccount.schema];
  static final ModelProvider _instance = ModelProvider();

  static ModelProvider get instance => _instance;
  
  ModelType getModelTypeByModelName(String modelName) {
    switch(modelName) {
      case "AuditoryMemoryFiveWords":
        return AuditoryMemoryFiveWords.classType;
      case "AuditoryMemoryFourWords":
        return AuditoryMemoryFourWords.classType;
      case "AuditoryMemoryThreeWords":
        return AuditoryMemoryThreeWords.classType;
      case "ClockDrawingTest":
        return ClockDrawingTest.classType;
      case "DemographicSurvey":
        return DemographicSurvey.classType;
      case "InformationTest":
        return InformationTest.classType;
      case "JoinCirclesTest":
        return JoinCirclesTest.classType;
      case "MDSUPDRS":
        return MDSUPDRS.classType;
      case "MMSE":
        return MMSE.classType;
      case "MemoryGame":
        return MemoryGame.classType;
      case "RecordBreathTest":
        return RecordBreathTest.classType;
      case "RecordSentenceTest":
        return RecordSentenceTest.classType;
      case "RecordVowelTest":
        return RecordVowelTest.classType;
      case "RhythmTest":
        return RhythmTest.classType;
      case "StraightWalkingTest":
        return StraightWalkingTest.classType;
      case "SubmitTime":
        return SubmitTime.classType;
      case "TremorTest":
        return TremorTest.classType;
      case "TurningTest":
        return TurningTest.classType;
      case "UserAccount":
        return UserAccount.classType;
      default:
        throw Exception("Failed to find model in model provider for model name: " + modelName);
    }
  }
}