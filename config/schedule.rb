# Purge expired reviews every 6 hours
every 6.hours do
  rake "revue:purge"
end