# Practice-Jeston

# Instruction to complete exercises

### 2.a Create an S3 bucket for storing logs 

1. Go to AWS console and search for s3 bucket and create an s3 bucket by giving it a unique name


### 2.b Create a Lambda function to log each invocation with the timestamp to the created S3 bucket. 

1. Create a new lambda function from console by giving it the required user roles
2. In Permission policies click **Add permissions** and **Attach policies** and then add the following policy `AWSLambdaExecute`
3. Write the code in the code area deploy the code and then test it

---

### 2.c Create an API in API Gateway and link it to the above created lambda, so that you can invoke the lambda function via curl command/postman or programmatically. 

1. Select add a trigger option
2. In Trigger configuration select **API Gateway** and create a new API
3. Select **REST API**, for security select **Open** and click **Add**
4. We can then hit the given endpoint and then check the s3 bucket if the log has been created