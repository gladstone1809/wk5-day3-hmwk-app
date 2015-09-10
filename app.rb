class Tunr < Sinatra::Base

  # General route actions
  get '/' do
    erb :home
  end

  get '/about' do
    erb :about
  end

  # index
  get '/styles' do
    @styles = Style.all
    erb(:"styles/index")
  end

  # new
  get '/styles/new' do
    @style = Style.new
    erb(:"styles/new")
  end

  # create
  post '/styles/' do
    @style = Style.new(params[:style])
    if @style.save
      redirect("/styles/#{@style.id}")
    else
      erb(:"styles/new")
    end
  end

  # show
  get '/styles/:id' do
    @style = Style.find(params[:id])
    erb(:"styles/show")
  end

  # edit
  get '/styles/:id/edit' do
    @style = Style.find(params[:id])
    erb(:"styles/edit")
  end

  # update
  put '/styles/:id' do
    @style = Style.find(params[:id])
    if @style.update_attributes(params[:style])
      redirect("/styles/#{style.id}")
    else
      erb(:"styles/edit")
    end
  end

  # delete
  delete '/styles/:id/delete' do
    @style = Style.find(params[:id])
    if @style.destroy
      redirect('/styles')
    else
      redirect("/styles/#{@style.id}")
    end
  end

end
