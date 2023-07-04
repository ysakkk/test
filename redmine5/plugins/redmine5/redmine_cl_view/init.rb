##require_dependency 'serverlist_projects_helper_patch'
#require_dependency File.expand_path('../lib/serverlist_projects_helper_patch', __FILE__)
require_dependency File.expand_path('../lib/redmine_cl_view_patch', __FILE__)

#Dir::foreach(File.join(File.dirname(__FILE__), "lib")) do |file|
#  next unless /\.rb$/ =~ file
#  require file
#end
require 'dispatcher'
#Rails.configuration.to_prepare do
Rails.configuration.after_initialize do
  require_dependency 'projects_helper'
  unless ProjectsHelper.included_modules.include? RedmineClViewPatch
    ProjectsHelper.send(:include, RedmineClViewPatch)
  end
end

Redmine::Plugin.register :redmine_cl_view do
  name 'Redmine Server View'
  description 'view details for ServerList'
  version '4.2.0'
  url 'https://github.com/RHEMS-Japan/redmine-cl-view'
  author_url 'https://rhems-japan.co.jp'

  menu :project_menu, :serverlist, { :controller => 'clientlist', :action => 'index' }, :param => :project_id


  project_module :redmine_cl_view do
       permission :view_clientlist, :clientlist => [:index]
       permission :manage_default_query, { default_custom_query_setting: [ :update ] }, require: :member
  end
end

