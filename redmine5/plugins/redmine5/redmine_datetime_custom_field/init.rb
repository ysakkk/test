require 'redmine'

Rails.logger.info 'o=>'
Rails.logger.info 'o=>Starting Redmine Datetime Custom Field plugin for Redmine'

Redmine::Plugin.register :redmine_datetime_custom_field do
  name 'Redmine Datetime Custom Field plugin'
  author 'Anthony LEGIRET <anthony.legiret@smile.fr>, Jérôme BATAILLE <jerome.bataille@smile.fr>'
  description 'This plugin adds the DateTime type to Redmine custom fields'
  version '1.0.0'
  requires_redmine :version_or_higher => '3.1.1'
end

# Custom patches
#require_dependency 'hooks'
require_dependency File.expand_path('../lib/redmine_datetime_custom_field', __FILE__)

Rails.application.config.to_prepare do

  #require_dependency 'datetime_custom_field_application_helper_patch'
  #require_dependency 'datetime_custom_field_field_format_patch'
  #require_dependency 'datetime_custom_field_custom_fields_helper_patch'

  #require_dependency 'datetime_custom_field_query_patch'

  require_dependency File.expand_path('../lib/application_helper', __FILE__)
  require_dependency File.expand_path('../lib/redmine/field_format', __FILE__)
  require_dependency File.expand_path('../lib/custom_fields_helper', __FILE__)
  require_dependency File.expand_path('../lib/datetime_custom_field_query_patch', __FILE__)

  Query.send(:prepend, DatetimeCustomFieldQueryPatch)
end
