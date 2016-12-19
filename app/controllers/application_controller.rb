require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do 
    @posts = Post.all
    erb :index
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/new' do
    erb :new
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end


  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    @post2 = @post
    @post.delete
    erb :deleted
  end

  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.name = params[:post][:name]
    @post.content = params[:post][:content]
    @post.save
    redirect "/posts/#{@post.id}"
  end

  post '/post' do
    @post = params[:post]
    Post.new(@post).save
    redirect '/posts'
  end





end