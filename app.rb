require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')
require('./lib/definition')

get('/') do
  erb(:index)
end

get('/words/new') do
  erb(:form)
end

get('/words/:id') do
  @word = Word.find(params.fetch('id').to_i())
  erb(:word)
end

post('/words/:id') do
  definition = params.fetch("definition")
  @definition = Definition.new(definition)
  @word = Word.find(params.fetch('id').to_i())
  @word.add_definition(@definition)
  @word.save()
  erb(:word)
end

get('/words') do
  @words = Word.all()
  erb(:words)
end

post('/words') do
  word = params.fetch("word")
  definition = params.fetch("definition")
  @word = Word.new(word)
  @definition = Definition.new(definition)
  @word.add_definition(@definition)
  @word.save()
  @words = Word.all()
  erb(:words)
end
