require 'rails_helper'

RSpec.describe Company, type: :model do

  before :all do
    @company = FactoryGirl
              .create(:company, subdomain: 'factorygirl',
                                name:      'FactoryGirl Test')
  end

  subject { @company }

  context 'validation' do

    it { should be_valid }

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

    it 'rejects special char in subdomain' do
      expect(
        FactoryGirl.build(:company, name: 'NewTest', subdomain: 'l-o-l')
      ).to_not be_valid
    end


    it 'rejects www in subdomain' do
      excluded_names = %w{ public admin www private }
      expect(
        FactoryGirl.build(:company, name: 'NewTest', subdomain: excluded_names.sample)
      ).to_not be_valid
    end

  end

  context 'after create' do
    it 'creates Admin and Guest roles' do
      expect {
        FactoryGirl.create(:company)
      }.to change(Role, :count).by(2)
    end
  end

end
