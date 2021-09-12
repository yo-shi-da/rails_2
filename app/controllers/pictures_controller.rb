class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]

  def index
    @pictures = current_user.pictures
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = current_user.pictures.new(picture_params)
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
    # @picture = current_user.pictures.find(params[:id])
  end

  def edit
    # @picture = current_user.pictures.find(params[:id])
  end

  def update
    # @picture = current_user.pictures.find(params[:id])
    if @picture.update(picture_params)
      redirect_to pictures_path, notice: "編集しました！"
    else
      render :edit
    end
  end

  def destroy
    # @picture = current_user.pictures.find(params[:id])
    @picture.destroy
    redirect_to pictures_url, notice: "削除しました。"
  end

  def comfirm
    @picture = current_user.pictures.new(picture_params)
  end

  private
  
  def picture_params
    params.require(:picture).permit(:content, :image, :image_cache, :user_id)
  end

  def set_picture
    @picture = current_user.pictures.find(params[:id])
  end


end

