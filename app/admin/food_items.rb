ActiveAdmin.register FoodItem do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :food_type, :description, :avatar
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :food_type, :description]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form do |f|
    f.inputs "Upload" do
      f.input :title
      f.input :food_type
      f.input :description
      f.input :avatar, required: true, as: :file
    end
    f.actions
  end
  
end
