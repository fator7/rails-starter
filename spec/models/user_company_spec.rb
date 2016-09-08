require 'rails_helper'

RSpec.describe UserCompany, type: :model do
  before :all do
    @user_company = FactoryGirl.create(:user_company)
  end

  subject { @user_company }

  it { should be_valid }

  context "validation" do
    it "rejects nil values" do
      expect(
        FactoryGirl.build(:user_company, company: nil, user: nil)
      ).to_not be_valid
    end
  end

end
