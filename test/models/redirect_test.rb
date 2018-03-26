# == Schema Information
#
# Table name: redirects
#
#  id         :integer          not null, primary key
#  from_path  :string
#  to_url     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  clicks     :integer          default(0)
#

require 'test_helper'

class RedirectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
