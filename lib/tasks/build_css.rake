namespace :build do
  desc "Build CSS"
  task :css do
    system "yarn build:css"
  end
end

Rake::Task["assets:precompile"].enhance ["build:css"]