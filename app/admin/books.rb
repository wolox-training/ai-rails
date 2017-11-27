ActiveAdmin.register Book do
  permit_params :title, :year, :publisher, :description, :author, :image, :genre

  index do
    selectable_column
    id_column
    column :title
    column :author
    column :genre
    column :publisher
    column :description
    column :image
    actions
  end

  filter :title
  filter :author
  filter :genre
  filter :publisher
  filter :description
end
