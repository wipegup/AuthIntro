class User < ApplicationRecord

  validates_presence_of :full_name
  validates_presence_of :password
  validates_presence_of :email


  def self.authenticate(email,password)
    user = User.where(email:email, password:password)
    return nil if user.count == 0
    return user if user.count == 1
    return "Error"
  end
end
