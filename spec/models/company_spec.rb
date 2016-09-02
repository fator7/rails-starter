require 'rails_helper'

RSpec.describe Company, type: :model do

  before :all do
    @company = FactoryGirl
              .create(:company, subdomain: 'factorygirl',
                                name:      'FactoryGirl Test')
  end

  subject { @company }

  context 'validation' do

    it 'rejects duplicate subdomain' do
      expect(
        FactoryGirl.build(:company, subdomain: 'factorygirl')
      ).to_not be_valid
    end

    it 'rejects nil to subdomain and name' do
      expect(
        FactoryGirl.build(:company, name: nil, subdomain: nil)
      ).to_not be_valid
    end

  end
end
