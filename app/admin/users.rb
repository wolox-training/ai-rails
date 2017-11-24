ActiveAdmin.register User do
  permit_params :email, :first_name, :last_name, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :email
    column :display_name
    column :created_at
    actions
  end

  filter :email
  filter :first_name
  filter :last_name

  form do |f|
    f.inputs do
      f.input :email
      f.input :first_name
      f.input :last_name
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
