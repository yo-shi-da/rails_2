class PicturesController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(post_params)
    if params[:back]
      render :new
    else
      if @picture.save
        redirect_to pictures_path, notice: "作成しました！"
      else
        render :new
      end
    end
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])
    if @picture.update(post_params)
      redirect_to pictures_path, notice: "編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @picture.destroy
    redirect_to pictures_url, notice: "削除しました。"
  end

  def confirm
    @picture = Picture.new(post_params)
    render :new if @picture.invalid?
  end

  private
  
  def post_params
    params.require(:picture).permit(:content, :image)
  end

  def set_picture
    @picture = Picture.find(params[:id])
  end


end

