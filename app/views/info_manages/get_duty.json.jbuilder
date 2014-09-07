json.array! @duty do |d|
  json.date d.date.to_s.to_date.strftime("%Y%m%d")
  json.duty d.duty
end

