deploy:
	aws cloudformation deploy \
    --template-file infrastructure/server.yml \
    --stack-name simple-deploy \
    --region us-east-1 \
    --profile personal