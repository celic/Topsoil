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
#  rating      :integer          default(0)
#

class Idea < ActiveRecord::Base

  # Accessible attributes
  attr_accessible :description, :name, :private, :rating

  # Validations
  validates :name, presence: true
  validates :user_id, presence: true

  # Relationships
  belongs_to :user
  #has_many :comments

  # Member methods
  def upvote
    rating += 1;
  end

  def downvote
    rating -= 1;
  end

  def public?
    !private
  end

  def self.search(search, page)
    paginate :per_page => 20, :page => page,
             :conditions => ['name like ?', "%#{search}%"], :order => 'name'
  end

end
