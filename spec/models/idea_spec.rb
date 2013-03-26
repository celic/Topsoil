# == Schema Information
#
# Table name: ideas
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'spec_helper'

describe Idea do
  pending "add some examples to (or delete) #{__FILE__}"
end
