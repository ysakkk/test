class RedmineClViewSettingController < ApplicationController
  unloadable
  layout 'base'

  def new
   @redmine_cl_view_setting = RedmineClViewSetting.new
  end

  def update
   @redmine_cl_view_setting = RedmineClViewSetting.new
    if @redmine_cl_view_setting.update_attribute(project_name: @redmine_cl_view_setting[:project_name], access_key: @redmine_cl_view_setting[:access_key], secret_key: @redmine_cl_view_setting[:secret_key], aws_region: @redmine_cl_view_setting[:aws_region])
      redirect_to :back, notice: "更新されました"
    else
      redirect_to :back, notice: "失敗しました"
    end
  end


  def redmine_params
    params.require(:redmine_cl_view_setting).permit(:project_name, :access_key, :secret_key, :aws_region)
  end

  def create
   @redmine_cl_view_setting = RedmineClViewSetting.new(redmine_params)
   if !params[:update_button]
    if @redmine_cl_view_setting.save
     redirect_to :back, notice: "キーが登録されました"
    else
     render 'new'
    end
   else
     @redmine_cl_view_setting.update(access_key: @redmine_cl_view_setting[:access_key], secret_key: @redmine_cl_view_setting[:secret_key])
     redirect_to :back, notice: "更新されました"
   end


  def find_project
    @project = Project.find(params[:id])
    rescue ActiveRecord::RecordNotFound
     render_404
    end
  end

end
