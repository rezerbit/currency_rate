# frozen_string_literal: true

RSpec.describe Rate, type: :model do
  it 'has a valid factory' do
    expect(create(:rate)).to be_truthy
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:value) }
    it { is_expected.to validate_numericality_of(:value) }
    it { is_expected.to allow_value('1234.1234').for(:value) }
    it { is_expected.not_to allow_value('12345.1234').for(:value) }
  end
end
