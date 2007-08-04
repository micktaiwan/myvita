class UsersController < ApplicationController
	
  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @users_pages, @users = paginate :users, :per_page => 10
  end

  def show
    @users = Users.find(params[:id])
  end

  def new
    @users = Users.new
  end

  def create
    @users = Users.new(params[:users])
    if @users.save
      flash[:notice] = 'Users was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @users = Users.find(params[:id])
  end

  def update
    @users = Users.find(params[:id])
    if @users.update_attributes(params[:users])
      flash[:notice] = 'Users was successfully updated.'
      redirect_to :action => 'show', :id => @users
    else
      render :action => 'edit'
    end
  end

  def destroy
    Users.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
