#!/bin/bash
cat << "EOF" | bundle exec rails console production
Setting.ui_theme="rhems"
Setting.default_language="ja" 
Setting.mail_from="redmine@rhems-japan.co.jp"
Setting.emails_footer="RHEMS Japan redmine"
Setting.self_registration='0'

user = User.find_by_login("admin")
user.auth_source_id = nil
user.password = 'Yqr7KJo5'
user.mail = 'support@rhems-japan.co.jp'
user.must_change_passwd = 'false'
user.firstname = 'RHEMS'
user.lastname = "Japan"
user.save!
quit
EOF
rake redmine:load_default_data RAILS_ENV=production REDMINE_LANG=ja
rake redmine:plugins:migrate   RAILS_ENV=production
