# AWS Lambda Example Python Script
# Designed to provide a response to a GET and POST methods from API Gateway

import json

def get_handler(event, context):
    output = {}
    output['statusCode'] = 200
    output['body'] = json.dumps({"Result" : "Success", "Message" : "GET Response!"})
    return output

def post_handler(event, context):
    output = {}
    output['statusCode'] = 200
    output['body'] = json.dumps({"Result" : "Success", "Message" : "POST Response!"})
    return output