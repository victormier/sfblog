# encoding: utf-8

class Admin::PostPicturesController < Admin::ApplicationController
  before_filter :find_post_picture, only: [:destroy, :sort]
  before_filter :load_post, :only => [ :index, :new, :create ]

  def new
    @post_picture = PostPicture.new
  end

  def create
    if(params[:post_picture])
      @post_picture = @post.post_pictures.new(params[:post_picture])
    else
      @post_picture = @post.post_pictures.new(picture: params[:file])
    end

    if @post_picture.save
      if(params[:post_picture])
        respond_to do |format|
          format.html{redirect_to admin_post_post_pictures_path(@post)}
          format.js{render json: @post_picture}
        end
      else
        render :text => { :filelink => @post_picture.picture.three_cols.url }.to_json
      end
    else
      fail_response
    end
  end

  def index
    respond_to do |format|
      format.html
      format.js { render json: @post.post_pictures, each_serializer: PostPictureSerializer, root: false }
    end
  end

  def destroy
    @post_picture.destroy
    flash[:notice] = "Imatge eliminada correctament"
    redirect_to :back
  end

  private

  def load_post
    @post = Post.find_for_show(params[:post_id])
  end

  def find_post_picture
    @post_picture = PostPicture.find(params[:id])
  end
end