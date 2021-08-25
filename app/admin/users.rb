ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :firstname, :lastname, :role, :provider, :uid
  #
  # or
  #

  index do
    id_column
    column :email
    column :firstname
    column :lastname
    actions
  end


    filter :email
    filter :firstname
    filter :lastname

    form do |f|
      f.inputs "Create New User" do
        f.input :firstname
        f.input :lastname
        f.input :email
        f.input :password
        f.input :password_confirmation
      end
      f.actions
    end


  permit_params do
    permitted = [:email, :password, :password_confirmation, :remember_created_at, :firstname, :lastname, :role, :provider, :uid]
    permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end
  
end
