import boto3
import json
import time

s3 = boto3.client('s3')

def lambda_handler(event, context):
    bucket_name = 'infuselogs'
    t = time.localtime()
    current_time = time.strftime("%H:%M:%S", t)
    key_name = f'logs/{current_time}.json'
    body = json.dumps(current_time)

    s3.put_object(Bucket=bucket_name, Key=key_name, Body=body)
    
    return{
        'statusCode':200,
        'body':json.dumps('Invocation logged to S3')
    }