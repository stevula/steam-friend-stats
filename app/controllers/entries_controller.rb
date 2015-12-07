# route handlers dealing with the collection
get '/entries' do
  @entries = Entry.most_recent
  erb :'entries/index'
end

post '/entries' do
  @entry = Entry.new(params[:entry])
  @entry.author = current_user

  if @entry.save
    redirect "/entries/#{@entry.id}"
  else
    @errors = @entry.errors.full_messages
    erb :'entries/new'
  end
end

get '/entries/new' do
  if current_user
    erb :'entries/new'
  else
    erb :'404'
  end
end


# route handlers dealing with a specific entry
before '/entries/:id' do
  find_and_ensure_entry
end

get '/entries/:id' do
  erb :'entries/show'
end

put '/entries/:id' do
  if current_user
    @entry.assign_attributes(params[:entry])

    if @entry.save
      redirect "entries/#{@entry.id}"
    else
      @errors = @entry.errors.full_messages
      erb :'entries/edit'
    end
  else
    erb :'404'
  end
end

delete '/entries/:id' do
  if current_user
    @entry.destroy
    redirect '/entries'
  else
    erb :'404'
  end
end

get '/entries/:id/edit' do
  if current_user
    find_and_ensure_entry
    erb :'entries/edit'
  else
    erb :'404'
  end

end
