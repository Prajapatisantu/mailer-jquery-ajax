ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :category_id, :price
  #
  # or
  #
  index do
    id_column
    column :name
    column :price
    column :category_id
    actions
  end

    filter :name
    filter :price
    filter :category_id

  permit_params do
    permitted = [:name, :category_id, :price]
    permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end 
end
