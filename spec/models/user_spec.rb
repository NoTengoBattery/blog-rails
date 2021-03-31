require "rails_helper"
require "shared_rutines"

RSpec.describe User, type: :model do
  # Most of the code for the user is already tested by Devise
  context "validations" do
    subject { FactoryBot.build(:user) }

    it { is_expected.to validate_presence_of(:display) }
    it { is_expected.to validate_length_of(:display).is_at_least(User::DISPLAY_MIN).is_at_most(User::DISPLAY_MAX) }
  end
end
