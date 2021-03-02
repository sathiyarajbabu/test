class Profile < ApplicationRecord
    # %i[email first_name last_name age].each do |e|
    #     validates_presence_of e
    # end
    validates :email, presence: true
    validates :first_name, presence: true
end
