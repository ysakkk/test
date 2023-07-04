require 'redmine'

#require_dependency 'redmine_bluehub/listener'
#require_dependency File.expand_path('../lib/redmine_bluehub/listener', __FILE__)
#require_dependency File.expand_path('../lib/redmine_bluehub/slack_listener', __FILE__)
require_dependency File.expand_path('../lib/slack_listener', __FILE__)

Redmine::Plugin.register :redmine_bluehub do
	name 'Redmine bluehub'
	author ''
	url ''
	author_url ''
	description ''
	version '0.1'

	requires_redmine :version_or_higher => '0.8.0'
end
