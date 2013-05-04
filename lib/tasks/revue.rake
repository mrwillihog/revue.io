namespace :revue do
  task :purge => :environment do
    CodeReview.expired.destroy_all
    Stats.gauge "reviews.total", CodeReview.count
  end
end
