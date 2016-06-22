class Topic < ActiveRecord::Base
  has_many :comments
  belongs_to :vacation


  def ordered_comments
    comments.order(:id)
  end
end
