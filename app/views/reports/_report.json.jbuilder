json.extract! report, :id, :title, :content, :published, :created_at, :updated_at
json.url report_url(report, format: :json)
