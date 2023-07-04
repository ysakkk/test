class ClientlistController < ApplicationController
  unloadable
  before_action :find_project
  before_action :authorize, only: :index

  def index
    db_config = Rails.configuration.database_configuration
    project = Project.find(params[:project_id])
    db_host = db_config[Rails.env]["host"]
    db_user = db_config[Rails.env]["username"]
    db_pass = db_config[Rails.env]["password"]
    db_name = db_config[Rails.env]["database"]
    client_redmine = Mysql2::Client.new(
        :host => db_host,
        :username => db_user,
        :password => db_pass,
        :database => db_name
    )

    result = client_redmine.query("select * from redmine_cl_view_settings where project_name = '#{project}'")
    file =  result.to_a[0]["access_key"].to_s
    print sprintf"[project aws list file] : %s_with_row\n", file
    @cl = Hash.new
    @cl[:date] = `date`
    @cl[:aws] = `cat ./files/#{file}_with_row`
  end

  def update
    project = Project.find(params[:project_id])
    db_host = ENV["REDMINE_DB_MYSQL"]
    db_user = ENV["REDMINE_DB_USERNAME"]
    db_pass = ENV["REDMINE_DB_PASSWORD"]
    db_name = ENV["REDMINE_DB_DATABASE"]
    Rails.logger.debug `ruby ./plugins/redmine_cl_view/list-instance.rb #{project.identifier} #{db_host} #{db_user} #{db_pass} #{db_name}`
    #Rails.logger.debug `aws --profile dartslive ec2 describe-instances --region ap-northeast-1 | php /var/lib/redmine/plugins/redmine_cl_view/jq.php | sort -f -k2 > /var/lib/redmine/plugins/redmine_cl_view/awslist/server.list`
    # sleep(5)
    #Rails.logger.info `/var/lib/redmine/plugins/redmine_cl_view/make-aws-lab`
    redirect_to :back
  end

  def find_project
    @project = Project.find(params[:project_id])
  rescue ActiveRecord::RecordNotFound
    render_404
  end


end
