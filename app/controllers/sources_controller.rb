class SourcesController < ApplicationController
  def top
    render layout: false
  end
  
  def index
    if params[:tag_name]
      @sources = Source.tagged_with("#{params[:tag_name]}")
    else
      @sources = current_user.sources
    end
  end

  def show
    @source = current_user.sources.find(params[:id])
  end

  def new
    @source = Source.new
  end

  def create
    @source = Source.new(source_params.merge(user_id: current_user.id))
    
    if @source.save
      redirect_to @source, notice: "ソース「#{@source.name}」を登録しました。"
    else
      render :new
    end
  end

  def edit
    @source = current_user.sources.find(params[:id])
  end

  def update
    @source = current_user.sources.find(params[:id])
    if @source.update(source_params)
      redirect_to @source, notice: "ソース「#{@source.name}」を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    source = current_user.sources.find(params[:id])
    source.destroy
    redirect_to sources_url, notice: "ソース「#{source.name}」を削除しました。"
  end

  private

  def source_params
    params.require(:source).permit(:name, :url, :description, :client_list, :category_list)
  end
end
