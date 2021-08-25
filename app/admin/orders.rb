ActiveAdmin.register Order do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :payment_type, :order_ref, :user_id, :address, :product_id
  #
  # or
  #
  filter :order_ref
  filter :payment_type
  filter :product_id

  index do
    id_column
    column :order_ref
    column :product_id do |p|
      product = Product.find(p.product_id)
      link_to product.name, admin_product_path(p.product_id)
    end
    column :user_id do |u|
      usr = User.find(u.user_id)
      link_to usr.email, admin_user_path(u.user_id)
    end 
    column :payment_type
    column "Order date", :created_at
    actions
  end

  permit_params do
    permitted = [:payment_type, :order_ref, :user_id, :address, :product_id]
    permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end
  
end
