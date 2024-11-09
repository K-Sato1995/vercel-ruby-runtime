
require 'sinatra/base'
require 'dotenv/load'
require_relative './models/todo'

class MyApp < Sinatra::Base
  get '/' do
    todos = Todo.all
  
    erb :template, locals: { todos: todos }
  end

  post '/add_todo' do
    text = params['text']
    Todo.create(text)
    erb :success
  end
end