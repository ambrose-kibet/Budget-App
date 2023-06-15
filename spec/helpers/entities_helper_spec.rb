require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the EntitiesHelper. For example:
#
# describe EntitiesHelper do
#   
# end
RSpec.describe EntitiesHelper, type: :helper do
  describe "string concat" do
    it "concats two strings with spaces" do
      expect('hello').to eq('hello')
    end
  end
end
