# random

Lambda function that simply outputs a random number between 0 and 99, inclusive

## dependencies

- ruby
- Docker
- AWS SAM

## build

`aws sam build --use-container`

## test

`aws sam local invoke --event event.json --region us-east-1`
The output should show a number between 0 and 99:
```
sam local invoke --event event.json --region us-east-1
2020-02-17 18:03:26 Found credentials in shared credentials file: ~/.aws/credentials
2020-02-17 18:03:26 Invoking handler.Handler.handle (ruby2.5)

Fetching lambci/lambda:ruby2.5 Docker container image......
2020-02-17 18:03:27 Mounting /Users/ecox/workspace/go/src/github.com/slizco/ab-statemachine/lambda/random/.aws-sam/build/RandomFn as /var/task:ro,delegated inside runtime container
START RequestId: 30e9bccd-7d44-1d12-9e36-b051b7c4cc7f Version: $LATEST
receiving event: {"message"=>"this is a test"}
returning random number: 48
END RequestId: 30e9bccd-7d44-1d12-9e36-b051b7c4cc7f
REPORT RequestId: 30e9bccd-7d44-1d12-9e36-b051b7c4cc7f	Init Duration: 126.66 ms	Duration: 4.18 ms	Billed Duration: 100 ms	Memory Size: 128 MB	Max Memory Used: 18 MB

48
```
## package
`sam package --s3-bucket slizco-sam-artifacts --output-template-file template.yaml.out`

## deploy
`sam deploy --template-file template.yaml.out --stack-name slizco-random-lambda --region us-east-1 --capabilities CAPABILITY_IAMi`
Note that in order to get the above working, you may have to open up the output template file and remove the `Parameters: null` field because SAM is silly.
