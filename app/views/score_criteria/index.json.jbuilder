json.array!(@score_criteria) do |score_criterium|
  json.extract! score_criterium, :id, :name, :amount
  json.url score_criterium_url(score_criterium, format: :json)
end
