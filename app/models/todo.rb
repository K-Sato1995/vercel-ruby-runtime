require 'httparty'
require 'json'

class Todo
  SUPABASE_URL = "#{ENV['SUPABASE_URL']}/rest/v1/todos"
  SUPABASE_API_KEY = ENV['SUPABASE_API_KEY']

  def self.all
    headers = {
      "apikey" => SUPABASE_API_KEY,
      "Authorization" => "Bearer #{SUPABASE_API_KEY}",
      "Accept-Encoding" => "identity"
    }
    response = HTTParty.get(SUPABASE_URL, headers: headers)
    response.success? ? JSON.parse(response.body) : []
  end

  def self.create(text)
    headers = {
      "apikey" => SUPABASE_API_KEY,
      "Authorization" => "Bearer #{SUPABASE_API_KEY}",
      "Content-Type" => "application/json",
      "Accept-Encoding" => "identity"
    }
    body = { text: text }.to_json
    response = HTTParty.post(SUPABASE_URL, headers: headers, body: body)
    response.success? ? "ok" : "error"
  end
end