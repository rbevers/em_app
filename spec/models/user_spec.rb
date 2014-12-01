require 'rails_helper'

describe User do
  describe 'authentication' do
    let(:gollum) { create(:user, email: 'smeagol@onering.com', password: 'myPrecious') }

    it 'can be found for database authentication by email' do
      user = User.find_for_database_authentication(email: gollum.email)
      expect(user).to be_present
      expect(user.id).to eq(gollum.id)
    end

    it 'checks valid_password? against plain string' do
      expect(gollum.valid_password?('myPrecious')).to be_truthy
    end
  end
end
