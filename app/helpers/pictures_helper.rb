module PicturesHelper
  def choose_new_or_edit
    if action_name == 'new'
      comfirm_pictures_path
    elsif action_name == 'edit'
      pictures_path
    end
  end
end