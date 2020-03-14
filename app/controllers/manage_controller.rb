class ManageController < ApplicationController
  def index
    list
    render :action=> 'list'
  end
  def list
    @item_pages, @item = paginate :items, :per_page => 10
  end
  def show
    @item = Item.find(params[:id])
  end
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(params[:item])
    if @item.save
      flash[:notice] = 'Item successfully created.'
      redirect :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update_attributes(params[:item])
      flash[:notice] = 'Item was successfully updated'
      redirect_to :action => 'show', :id =>@item
    else
      render :action => 'edit'
    end
  end

  def destroy
    Item.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
