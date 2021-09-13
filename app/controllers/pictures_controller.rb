class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]

  def index
    @pictures = current_user.pictures
  end

  def new
    if params[:back]
      @picture = Picture.new(picture_params)
    else
      @picture = Picture.new
    end
  end

  def create
    @picture = current_user.pictures.new(picture_params)
    if @picture.save
      redirect_to pictures_path, notice: "作成しました！"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @picture.update(picture_params)
      redirect_to pictures_path, notice: "編集しました！"
    else
      render :edit
    end
  end

  def destroy
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

