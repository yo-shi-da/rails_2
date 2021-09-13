module PicturesHelper
  def choose_new
    if action_name == 'new'
      comfirm_pictures_path
    end
  end
end