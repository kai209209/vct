json.applies(@applies) do |apply|
  json.apply apply
  
  json.applicant apply.author, :name, :avatar
end