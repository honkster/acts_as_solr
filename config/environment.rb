ENV['RAILS_ENV']  = (ENV['RAILS_ENV'] || 'development').dup 
# RAILS_ROOT isn't defined yet, so figure it out.
rails_root_dir = "#{File.dirname(File.expand_path(__FILE__))}/../../../../"
SOLR_PATH = "#{File.dirname(File.expand_path(__FILE__))}/../solr" unless defined? SOLR_PATH

SOLR_LOGS_PATH = "#{rails_root_dir}/log" unless defined? SOLR_LOG_PATH
SOLR_PIDS_PATH = "#{rails_root_dir}/tmp/pids" unless defined? SOLR_PID_PATH
SOLR_DATA_PATH = "#{rails_root_dir}/solr/#{ENV['RAILS_ENV']}" unless defined? SOLR_DATA_PATH

unless defined? SOLR_PORT
  SOLR_PORT = ENV['PORT'] || case ENV['RAILS_ENV']
              when 'test' then 8981
              when 'production' then 8983
              else 8982
              end
end

if ENV['RAILS_ENV'] == 'test'
  DB = (ENV['DB'] ? ENV['DB'] : 'mysql') unless defined? DB
  MYSQL_USER = (ENV['MYSQL_USER'].nil? ? 'root' : ENV['MYSQL_USER']) unless defined? MYSQL_USER
  require File.join(File.dirname(File.expand_path(__FILE__)), '..', 'test', 'db', 'connections', DB, 'connection.rb')
end