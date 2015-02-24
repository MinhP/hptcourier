class Eventer < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
  enum event_status: [ :going, :notgoing, :maybe, :courier, :nocourier ]
end
