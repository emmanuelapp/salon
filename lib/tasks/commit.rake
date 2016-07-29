namespace :commit do
  task github: :environment do
    `git add --all`
    `git commit -m '#{ENV['message']}'`
    `git push origin #{ENV['branch']}`
  end
end
