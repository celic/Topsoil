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

class Idea < ActiveRecord::Base

  # Attributes
  attr_accessible :description, :name

  # Validations
  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 140 }
  validates :description, presence: true

  # Relationships
  belongs_to :user

  # Scope
  default_scope order: 'ideas.created_at DESC'

  def self.search(search, page)
    paginate :per_page => 20, :page => page,
             :conditions => ['name like ?', "%#{search}%"], :order => 'name'
  end

end
