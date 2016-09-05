# awsmarusa

## What's this

Finds AWS resources that you forgot to delete.

## Installation

```sh
$ bundle install --path vendor/bundle
```

## Usage

### Set credentials

Use environmental variables (`AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, `AWS_REGION`, `AWS_PROFILE`).

### List tasks

```sh
$ bundle exec rake --tasks
```

### Check all

```sh
$ bundle exec rake _all
```

or

```sh
$ bundle exec rake
```

## TODO:

```
- elasticache
- elb
- elbv2
- es
- iam
- lambda
- logs
- opsworks
- redshift
- route53
- s3
- ses
- sns
- sqs
```
