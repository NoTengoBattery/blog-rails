progressbar = ProgressBar.create
progressbar.total = 20

until progressbar.progress >= progressbar.total
  begin
    FactoryBot.create(:article)
    progressbar.increment
  rescue ActiveRecord::RecordInvalid
    puts "\n#{$!}, skipping..."
  end
end

puts "Created a total of #{progressbar.progress} records"
