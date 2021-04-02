progressbar = ProgressBar.create
progressbar.total = 500

until progressbar.progress >= progressbar.total
  begin
    article = FactoryBot.build(:article)
    user = User.order("RANDOM()").limit(1).first
    article.author = user
    article.save!
    progressbar.increment
  rescue ActiveRecord::RecordInvalid
    puts "\n#{$!}, skipping..."
  end
end

puts "Created a total of #{progressbar.progress} records"
