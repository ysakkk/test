#require_dependency 'redmine_slack_integration/hooks'
#require_dependency 'redmine_slack_integration/issue_relations_controller_patch'

require_dependency File.expand_path('../lib/redmine_slack_integration/hooks', __FILE__)
require_dependency File.expand_path('../lib/redmine_slack_integration/issue_relations_controller_patch', __FILE__)


################################################################################
## Register Plugin
################################################################################
Redmine::Plugin.register :redmine_slack_integration do
  name 'Redmine Slack Integration plugin'
  author 'Future Corporation'
  description 'This is a plugin for Redmine Slack Integration'
  version '0.2.4'
  url 'https://www.future.co.jp/'
  author_url 'https://www.future.co.jp/'

  settings :default => {:slack_api_url => 'https://slack.com/api/chat.postMessage'}, :partial => 'settings/slack_integration_settings'
end
