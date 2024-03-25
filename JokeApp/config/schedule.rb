every 1.hours do
    runner "UserCleanupJob.perform_now"
end