FactoryGirl.define do
  factory :company do
    name "FactoryGirl Test"
    subdomain {"factorygirl#{('a'..'z').to_a.shuffle.join}"}
  end
end
