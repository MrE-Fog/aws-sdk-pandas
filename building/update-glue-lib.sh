#!/usr/bin/env bash
set -ex

pushd ..
rm -fr awswrangler.zip

# Zip the library
git archive HEAD:awswrangler --format zip --prefix awswrangler/awswrangler/ --output awswrangler.zip

# Upload the Zip file
s3_location=$(aws cloudformation describe-stacks --stack-name aws-sdk-pandas-glueray --query "Stacks[0].Outputs[?OutputKey=='AWSSDKforpandasZIPLocation'].OutputValue" --output text)
aws s3 cp awswrangler.zip $s3_location

rm -fr awswrangler.zip
