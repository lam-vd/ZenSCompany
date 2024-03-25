class UserCleanupJob < ApplicationJob
  queue_as :default

  def perform(*args)
    users_to_delete = User.where(active: false)
    users_to_delete.destroy_all
  end
end
