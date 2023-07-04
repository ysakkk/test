#FROM redmine:3.4.11
#FROM redmine:4.2.10
FROM redmine:5.0.5

### setup redmine
# themes
COPY ./themes/rhems /usr/src/redmine/public/themes/rhems
COPY ./themes/rhems_client /usr/src/redmine/public/themes/rhems_client

#   # plugins
RUN gem install httpclient
RUN gem install dispatcher
COPY ./plugins/redmine5/redmine_bluehub /usr/src/redmine/plugins/redmine_bluehub
COPY ./plugins/redmine5/redmine_cl_view/ /usr/src/redmine/plugins/redmine_cl_view
COPY ./plugins/redmine5/redmine_datetime_custom_field /usr/src/redmine/plugins/redmine_datetime_custom_field
COPY ./plugins/redmine5/redmine_slack_integration /usr/src/redmine/plugins/redmine_slack_integration
#  
COPY ./config/boot.sh /usr/src/redmine/boot.sh
COPY ./config/configuration.5.0.5.yml /usr/src/redmine/config/configuration.yml
#COPY ./config/settings.yml /usr/src/redmine/config/settings.yml
#COPY ./config/redmine.rb /usr/src/redmine/lib/redmine.rb
#  
RUN chown -R redmine:redmine /usr/src/redmine
