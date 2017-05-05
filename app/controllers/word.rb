get '/words/new' do
  requires_login
  erb :'words/new'
end

post '/words' do
  @word = params[:word]
  words = Datamuse.new(rhymes_with: params[:word], max:10)

  @rhymes = words.get_rhymes.map(&:word)

  if request.xhr?
    erb :'words/_show', layout: false
  else
    if @rhymes
      erb :'words/_show'
    else
      @errors = ["No rhymes found for this word"]
      erb :'words/new'
    end
  end
end
