class PicturesController < ApplicationController
  # before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @pictures = current_user.pictures
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = current_user.pictures.new(post_params)
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
    @picture = current_user.pictures.find(params[:id])
  end

  def edit
    @picture = current_user.pictures.find(params[:id])
  end

  def update
    @picture = current_user.pictures.find(params[:id])
    if @picture.update(post_params)
      redirect_to pictures_path, notice: "編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @picture = current_user.pictures.find(params[:id])
    @picture.destroy
    redirect_to pictures_url, notice: "削除しました。"
  end

  def confirm
    @picture = Picture.new(post_params)
    render :new if @picture.invalid?
  end

  private
  
  def post_params
    params.require(:picture).permit(:content, :image, :image_cache, :user_id)
  end

  def set_picture
    @picture = Picture.find(params[:id])
  end


end

