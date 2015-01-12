class Contact < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :email, :title
  validates_uniqueness_of :email
end
