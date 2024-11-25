class PhotosController < ApplicationController
  def index
    matching_photos = Photo.all

    @list_of_photos = matching_photos.order({ :created_at => :desc })

    render({ :template => "photos/index" })
  end

  def show
    @the_photo = Photo.find(params.fetch("path_id"))
    render({ :template => "photos/show" })
  end

  def create
    the_photo = Photo.new
    the_photo.caption = params.fetch("query_caption")
    the_photo.image = params.fetch("query_image")
    the_photo.owner_id = params.fetch("query_owner_id")

    if the_photo.valid?
      the_photo.save
      redirect_to(root_path, { :notice => "Photo added successfully." })
    else
      redirect_to(root_path, { :alert => the_photo.errors.full_messages.to_sentence })
    end
  end

  def update
 the_photo = Photo.find(params.fetch("path_id"))

    the_photo.caption = params.fetch("query_caption")
    the_photo.image = params.fetch("query_image")
    the_photo.owner_id = params.fetch("query_owner_id")

    if the_photo.valid?
      the_photo.save
      redirect_to("/photos/#{the_photo.id}", { :notice => "Photo updated successfully." })
    else
      redirect_to("/photos/#{the_photo.id}", { :alert => the_photo.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_photo = Photo.find(params.fetch("path_id"))

    the_photo.destroy

    redirect_to("/photos", { :notice => "Photo deleted successfully." })
  end
end
