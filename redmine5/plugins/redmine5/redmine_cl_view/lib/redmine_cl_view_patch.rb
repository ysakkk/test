require_dependency 'projects_helper'
module RedmineClViewPatch
  def self.included(base) 
    base.prepend(ProjectsHelperMethodsRedmineClView)
  end
end

module ProjectsHelperMethodsRedmineClView
  def project_settings_tabs
    tabs = super
    action = {
      :name => 'redmine_cl_view', 
      :controller => 'redmine_cl_view_settings', 
      :action => :show, 
      :partial => 'redmine_cl_view_settings/show', 
      :label => :redmine_cl_view}
    tabs << action 
    tabs
  end
end
