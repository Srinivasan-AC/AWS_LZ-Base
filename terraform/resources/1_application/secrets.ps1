aws s3 ls --profile awscli
$data = Get-Content C:\Users\dk00932866\.aws\cli\cache\*.json | ConvertFrom-Json
$accesskey = $data.Credentials.AccesskeyId
$SecretAccessKey = $data.Credentials.SecretAccessKey
$SessionToken = $data.Credentials.SessionToken
[Environment]::SetEnvironmentVariable("AWS_ACCESS_KEY_ID",$accesskey)
[Environment]::SetEnvironmentVariable("AWS_SECRET_ACCESS_KEY",$SecretAccessKey)
[Environment]::SetEnvironmentVariable("AWS_SESSION_TOKEN",$SessionToken)
