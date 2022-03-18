export type AmplifyDependentResourcesAttributes = {
    "auth": {
        "authwithoutconfirm": {
            "IdentityPoolId": "string",
            "IdentityPoolName": "string",
            "UserPoolId": "string",
            "UserPoolArn": "string",
            "UserPoolName": "string",
            "AppClientIDWeb": "string",
            "AppClientID": "string",
            "CreatedSNSRole": "string"
        }
    },
    "api": {
        "pdappbackendfi": {
            "GraphQLAPIKeyOutput": "string",
            "GraphQLAPIIdOutput": "string",
            "GraphQLAPIEndpointOutput": "string"
        }
    },
    "storage": {
        "pdstorage": {
            "BucketName": "string",
            "Region": "string"
        }
    },
    "analytics": {
        "pdappbackendfi": {
            "Region": "string",
            "Id": "string",
            "appName": "string"
        }
    }
}