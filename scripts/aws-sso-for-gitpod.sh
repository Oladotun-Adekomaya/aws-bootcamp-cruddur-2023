# watch the demo at https://youtu.be/cGUNf1FMNvI
#
# customize these variables
#
DEFAULT_PROFILE='default'
DEFAULT_REGION='us-east-1'
DEFAULT_OUTPUT='text'
SSO_START_URL=process.env.SSO_START_URL
SSO_REGION='us-east-1'
SSO_ACCOUNT_ID=process.env.SSO_ACCOUNT_ID
SSO_ROLE_NAME=process.env.SSO_ROLE_NAME



#
# default variables
#

AWS_CLI_V2_URL="https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip"

PROJECT_DIR="${PWD}"
GITPOD_LOCAL_BIN='/home/gitpod/.local/bin'

# install aws-cli v2
mkdir /tmp/awscliv2 && cd /tmp/awscliv2
curl "${AWS_CLI_V2_URL}" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install -b /usr/local/bin --update
rm -rf /tmp/awscliv2
cd $OLDPWD
aws --version


echo "generate the ~/.aws/config"
mkdir -p ~/.aws

cat << EOF > ~/.aws/config
[${DEFAULT_PROFILE}]
sso_session = sso
sso_account_id = ${SSO_ACCOUNT_ID}
sso_role_name =${SSO_ROLE_NAME}
region = ${DEFAULT_REGION}
output = ${DEFAULT_OUTPUT}

[sso-session sso]
sso_start_url = ${SSO_START_URL}
sso_region = ${SSO_REGION}
sso_registration_scopes = sso:account:access
EOF

# login to authenticate again
#aws sso login