namespace :revue do
  task :purge => :environment do
    CodeReview.expired.destroy_all
  end
end
