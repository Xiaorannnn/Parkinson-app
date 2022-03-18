import 'dart:io';

// import 'package:firebase_storage/firebase_storage.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:crypt/crypt.dart';
import 'package:flutter/cupertino.dart';
import 'package:parkinsons_app/services/Util.dart';

import 'package:parkinsons_app/models/ModelProvider.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify.dart';

import 'package:path_provider/path_provider.dart';

//a database class for all database activities
class DataBaseService {
  //set the variables
  final String uid;
  //the constructor function
  DataBaseService({required this.uid});

  //update user's information as a table to the database
  Future updateUserData(String email, String password, String uid) async {
    UserAccount user = UserAccount(
        Username: email,
        Password: password,
        uid: uid);
    print("%%%%%%%%%%%%%");
    return await Amplify.DataStore.save(user);
  }

  //update the result of ryhthm game to the database
  Future updateUserRythmGame(
      int score, double pixelsFromCenter, String medicineAnswer) async {
    RhythmTest rhythm = RhythmTest(
        uid: uid,
        MedicineAnswer: medicineAnswer,
        Score: score,
        TotalPixelsFromCenter: pixelsFromCenter);
    return await Amplify.DataStore.save(rhythm);
  }

  //update the result of memory game to the database
  Future updateUserMemoryGame(int tries, int difficulty, bool gameFinished,
      String medicineAnswer) async {
    MemoryGame memory = MemoryGame(
        uid: uid,
        MedicineAnswer: medicineAnswer,
        Tries: tries,
        Difficulty: difficulty,
        GameFinished: gameFinished);
    return await Amplify.DataStore.save(memory);
  }

  //update the result of ClockDrawingTest to the database
  Future updateClockDrawingTest(String medicineAnswer) async {
    ClockDrawingTest clockDrawing = ClockDrawingTest(
        uid: uid,
        MedicineAnswer: medicineAnswer);
    return await Amplify.DataStore.save(clockDrawing);
  }

  //update the result of JoinCirclesTest to the database
  Future updateJoinCirclesTest(String medicineAnswer) async {
    JoinCirclesTest joinCircles = JoinCirclesTest(
        uid: uid,
        MedicineAnswer: medicineAnswer);
    return await Amplify.DataStore.save(joinCircles);
  }

  //update the result of TremorTest to the database
  Future updateTremorTest(String medicineAnswer) async {
    TremorTest tremor = TremorTest(
        uid: uid,
        MedicineAnswer: medicineAnswer);
    return await Amplify.DataStore.save(tremor);
  }

  //update the result of StraightWalkingTest to the database
  Future updateStraightWalkingTest(String medicineAnswer) async {
    StraightWalkingTest straight = StraightWalkingTest(
        uid: uid,
        MedicineAnswer: medicineAnswer);
    return await Amplify.DataStore.save(straight);
  }

  //update the result of TurningTest to the database
  Future updateTurningTest(String medicineAnswer) async {
    TurningTest turning = TurningTest(
        uid: uid,
        MedicineAnswer: medicineAnswer);
    return await Amplify.DataStore.save(turning);
  }

  //update the result of DemographicSurvey to the database
  Future updateDemographicSurvey(List Answer, String surveyParticipant) async {
    DemographicSurvey demo = DemographicSurvey(
        uid: uid,
        Question1: Answer[0],
        Question2: Answer[1],
        Question3: Answer[2],
        Question4: Answer[3],
        Question5: Answer[4],
        Question6: Answer[5],
        Question7: Answer[6],
        Question8: Answer[7],
        Question9: Answer[8],
        Question10: Answer[9],
        Question11: Answer[10],
        Question12: Answer[11],
        Question13: Answer[12],
        Question14: Answer[13],
        Question15: Answer[14],
        Question16: Answer[15],
        Question17: Answer[16],
        Question18: Answer[17],
        Question19: Answer[18],
        Question20: Answer[19],
        Question21: Answer[20],
        Question22: Answer[21],
        Question23: Answer[22],
        Question24: Answer[23],
        Question25: Answer[24],
        Question26: Answer[25],
        Question27: Answer[26],
        Question28: Answer[27],
        Question29: Answer[28],
        Question30: Answer[29],
        Question31: Answer[30],
        SurveyParticipant: surveyParticipant);
    return await Amplify.DataStore.save(demo);
  }

  //update the result of MDSUPDRS to the database
  Future updateMDSUPDRS(List Answer, String surveyParticipant) async {
    MDSUPDRS mdsupdrs = MDSUPDRS(
        uid: uid,
        Question1: Answer[0],
        Question2: Answer[1],
        Question3: Answer[2],
        Question4: Answer[3],
        Question5: Answer[4],
        Question6: Answer[5],
        Question7: Answer[6],
        Question8: Answer[7],
        Question9: Answer[8],
        Question10: Answer[9],
        Question11: Answer[10],
        Question12: Answer[11],
        Question13: Answer[12],
        Question14: Answer[13],
        Question15: Answer[14],
        Question16: Answer[15],
        Question17: Answer[16],
        Question18: Answer[17],
        Question19: Answer[18],
        Question20: Answer[19],
        Question21: Answer[20],
        SurveyParticipant: surveyParticipant);
    return await Amplify.DataStore.save(mdsupdrs);
  }

  //update the result of MMSE to the database
  Future updateMMSE(List Answer) async {
    MMSE mmse = MMSE(
        uid: uid,
        Question1: Answer[0],
        Question2: Answer[1],
        Question3: Answer[2],
        Question4: Answer[3],
        Question5: Answer[4],
        Question6: Answer[5],
        Question7: Answer[6],
        Question8: Answer[7],
        Question9: Answer[8],
        Question10: Answer[9]);
    return await Amplify.DataStore.save(mmse);
  }

  //update the result of AuditoryMemoryThreeWords to the database
  Future updateAuditoryMemoryThreeWords(String medicineAnswer) async {
    AuditoryMemoryThreeWords auditoryThree = AuditoryMemoryThreeWords(
        uid: uid,
        MedicineAnswer: medicineAnswer);
    return await Amplify.DataStore.save(auditoryThree);
  }

  //update the result of AuditoryMemoryFourWords to the database
  Future updateAuditoryMemoryFourWords(String medicineAnswer) async {
    AuditoryMemoryFourWords auditoryFour = AuditoryMemoryFourWords(
        uid: uid,
        MedicineAnswer: medicineAnswer);
    return await Amplify.DataStore.save(auditoryFour);
  }

  //update the result of AuditoryMemoryFiveWords to the database
  Future updateAuditoryMemoryFiveWords(String medicineAnswer) async {
    AuditoryMemoryFiveWords auditoryFive = AuditoryMemoryFiveWords(
        uid: uid,
        MedicineAnswer: medicineAnswer);
    return await Amplify.DataStore.save(auditoryFive);
  }

  //update the result of RecordVowelTest to the database
  Future updateRecordVowelTest(String medicineAnswer) async {
    RecordVowelTest vowel = RecordVowelTest(
        uid: uid,
        MedicineAnswer: medicineAnswer);
    return await Amplify.DataStore.save(vowel);
  }

  //update the result of RecordBreathTest to the database
  Future updateRecordBreathTest(String medicineAnswer) async {
    RecordBreathTest breath = RecordBreathTest(
        uid: uid,
        MedicineAnswer: medicineAnswer);
    return await Amplify.DataStore.save(breath);
  }

  //update the result of RecordSentenceTest to the database
  Future updateRecordSentenceTest(String medicineAnswer) async {
    RecordSentenceTest sentence = RecordSentenceTest(
        uid: uid,
        MedicineAnswer: medicineAnswer);
    return await Amplify.DataStore.save(sentence);
  }

  //upload corresponding files to database
  Future uploadFile(File file, String folderName, String filetype) async {
    String timeStamp = createTimeStamp();
    try {
      final UploadFileResult result = await Amplify.Storage.uploadFile(
        local: file,
        key: uid + '/' + folderName + filetype,
        onProgress: (progress) {
          print("Fraction completed: " + progress.getFractionCompleted().toString());
        }
      );
      print('Successfully uploaded file: ${result.key}');
    } on StorageException catch (e) {
      print('Error uploading file: $e');
    }
  }
}
