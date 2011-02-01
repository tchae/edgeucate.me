# == Schema Information
# Schema version: 20110201092819
#
# Table name: links
#
#  id         :integer         not null, primary key
#  cat        :string(255)
#  subcat     :string(255)
#  industry   :string(255)
#  author     :string(255)
#  linkurl    :string(255)
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

class Link < ActiveRecord::Base
  attr_accessible :linkurl, :cat, :subcat, :industry, :author
  
  belongs_to :user
  
  link_regex = /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$/
  
  validates :linkurl,    :presence     => true,
                         :format       => { :with => link_regex },
                         :uniqueness   => true
  validates :cat,        :presence     => true
  validates :subcat,     :presence     => false
  validates :industry,   :presence     => false
  validates :author,     :presence     => false,
                         :length       => { :within => 2..40 }
end
