namespace :commit do
  task github: :environment do
    `git add --all`
    `git commit -m 'auto commit'`
    `git push origin master`
  end
end
