require 'aws-sdk'
require 'json'
require 'date'
require 'mysql2'

$host = ARGV[1]
$username = ARGV[2]
$password = ARGV[3]
$database = ARGV[4]

client_redmine = Mysql2::Client.new(
    :host => $host,
    :username => $username,
    :password => $password,
    :database => $database
)

query = client_redmine.query("select * from redmine_cl_view_settings where project_name = \'#{ARGV[0]}\'")
query.each do |value|
  PROJECT_NAME = value["project_name"]
  ACCESS_KEY_ID = value["access_key"]
  SECRET_ACCESS_KEY = value["secret_key"]
  AWS_REGION = value["aws_region"]
end
`./plugins/redmine_cl_view/redmine_plugin #{PROJECT_NAME} #{ACCESS_KEY_ID} #{SECRET_ACCESS_KEY} #{AWS_REGION}`

