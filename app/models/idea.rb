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
#  private     :boolean          default(FALSE)
#

class Idea < ActiveRecord::Base

  # Accessible attributes
  attr_accessible :description, :name, :private

  # Validations
  validates :name, presence: true
  validates :user_id, presence: true

  # Relationships
  belongs_to :user

  # Member methods
  def creator_name
    self.user.name
  end

end
