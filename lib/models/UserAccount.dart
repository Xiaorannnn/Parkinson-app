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


/** This is an auto generated class representing the UserAccount type in your schema. */
@immutable
class UserAccount extends Model {
  static const classType = const _UserAccountModelType();
  final String id;
  final String? _Username;
  final String? _Password;
  final String? _uid;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String get Username {
    try {
      return _Username!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get Password {
    try {
      return _Password!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
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
  
  const UserAccount._internal({required this.id, required Username, required Password, required uid}): _Username = Username, _Password = Password, _uid = uid;
  
  factory UserAccount({String? id, required String Username, required String Password, required String uid}) {
    return UserAccount._internal(
      id: id == null ? UUID.getUUID() : id,
      Username: Username,
      Password: Password,
      uid: uid);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserAccount &&
      id == other.id &&
      _Username == other._Username &&
      _Password == other._Password &&
      _uid == other._uid;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("UserAccount {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("Username=" + "$_Username" + ", ");
    buffer.write("Password=" + "$_Password" + ", ");
    buffer.write("uid=" + "$_uid");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  UserAccount copyWith({String? id, String? Username, String? Password, String? uid}) {
    return UserAccount(
      id: id ?? this.id,
      Username: Username ?? this.Username,
      Password: Password ?? this.Password,
      uid: uid ?? this.uid);
  }
  
  UserAccount.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _Username = json['Username'],
      _Password = json['Password'],
      _uid = json['uid'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'Username': _Username, 'Password': _Password, 'uid': _uid
  };

  static final QueryField ID = QueryField(fieldName: "userAccount.id");
  static final QueryField USERNAME = QueryField(fieldName: "Username");
  static final QueryField PASSWORD = QueryField(fieldName: "Password");
  static final QueryField UID = QueryField(fieldName: "uid");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "UserAccount";
    modelSchemaDefinition.pluralName = "UserAccounts";
    
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
      key: UserAccount.USERNAME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: UserAccount.PASSWORD,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: UserAccount.UID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}

class _UserAccountModelType extends ModelType<UserAccount> {
  const _UserAccountModelType();
  
  @override
  UserAccount fromJson(Map<String, dynamic> jsonData) {
    return UserAccount.fromJson(jsonData);
  }
}