# hello

Lambda function that simply outputs a hello message

## dependencies

- ruby
- Docker
- AWS SAM

## build

`sam build --use-container`

## test

`sam local invoke --event event.json --region us-east-1`
The output should show a hello message:
```
sam local invoke --event event.json --region us-east-1
Invoking handler.Handler.handle (ruby2.5)

Fetching lambci/lambda:ruby2.5 Docker container image......
Mounting /Users/ecox/workspace/go/src/github.com/slizco/ab-statemachine/lambda/hello/.aws-sam/build/HelloFn as /var/task:ro,delegated inside runtime container
START RequestId: 4cd16ba0-d516-1f07-b5ec-588d11b017b4 Version: $LATEST
receiving event: {"message"=>"this is a test"}
END RequestId: 4cd16ba0-d516-1f07-b5ec-588d11b017b4
REPORT RequestId: 4cd16ba0-d516-1f07-b5ec-588d11b017b4	Init Duration: 121.18 ms	Duration: 3.93 ms	Billed Duration: 100 ms	Memory Size: 128 MB	Max Memory Used: 18 MB

"hello"
```

## package

`sam package --s3-bucket slizco-sam-artifacts --output-template-file template.yaml.out`

## deploy

`sam deploy --template-file template.yaml.out --stack-name slizco-hello-lambda --region us-east-1 --capabilities CAPABILITY_IAMi`
Note that in order to get the above working, you may have to open up the output template file and remove the `Parameters: null` field because SAM is silly.
