class Member::Achievement < ActiveRecord::Base
  attr_accessible :description, :member_id
  belongs_to :member
end
