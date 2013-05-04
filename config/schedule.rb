# Purge expired reviews every 6 hours
every 1.hours do
  rake "revue:purge"
end