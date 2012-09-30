REMOTE_HOST = "mikker@detersmart.dk"
REMOTE_PATH = "w/sites/dr.brnbw.com/public"

desc "Build all"
task :build do
  system "middleman build"
end

desc "Clean all"
task :clean do
  system 'rm -rf build'
end

namespace :remote do
  desc "Clean all (remote)"
  task :clean do
    system "ssh #{REMOTE_HOST} 'cd #{REMOTE_PATH} && rm -r *'"
  end
  desc "Sync to remote"
  task :deploy do
    system "rsync -ruv --no-perms build/* #{REMOTE_HOST}:#{REMOTE_PATH}"
  end
  desc "Setup directory"
  task :setup do
    system "ssh #{REMOTE_HOST} 'mkdir -p #{REMOTE_PATH}'"
  end
  desc "Clean remote then deploy to remote"
  task :clean_deploy => [ 'remote:clean', 'remote:deploy' ]
end

desc "Clean local then clean remote then deploy"
task :full_update => [ :clean, :build, 'remote:clean_deploy']

task :deploy => [ :build, 'remote:deploy' ]
