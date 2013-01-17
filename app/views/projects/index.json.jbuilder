json.array!(@projects) do |project|
  json.extract! project, :name, :priority, :project, :completion, :status, :notes, :user_id
  json.url project_url(project, format: :json)
end