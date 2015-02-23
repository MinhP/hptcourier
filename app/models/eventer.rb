class Eventer < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
end
