namespace :inspect do
  desc 'TODO'
  task models: :environment do
    # `bundle exec rspec spec/models`
    # `rubocop app/models`
    # `bundle exec rubocop spec/models`
    puts "#{ENV['var']}"
  end
end
