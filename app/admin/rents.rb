ActiveAdmin.register Rent do
  permit_params :to, :from, :user_id, :book_id

  index do
    selectable_column
    id_column
    column :book
    column :user
    column :from
    column :to
    column :created_at
    actions
  end

  filter :book
  filter :user
  filter :from
  filter :to
end
