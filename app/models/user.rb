# == Schema Information
# Schema version: 20110131051851
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  attr_accessible :name, :username, :email
  
  username_regex = /^\w+$/i
  email_regex    = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :name,       :presence   => true,
                         :length     => { :maximum => 50 }
  validates :username,   :presence   => true,
                         :length     => { :maximum => 15 },
                         :format     => { :with => username_regex },
                         :uniqueness => { :case_sensitive => false }
  validates :email,      :presence   => true,
                         :format     => { :with => email_regex },
                         :uniqueness => { :case_sensitive => false }
end
