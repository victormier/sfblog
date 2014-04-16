# encoding: utf-8

class Admin::PostsController < Admin::ApplicationController
  before_filter :find_post, only: [:edit, :update, :destroy, :toggle_published]

  def index
    @posts = Post.newest_first
  end

  def new
    @post = Post.new
    @post.date = DateTime.now
  end

  def create
    @post = Post.new(params[:post])

    if @post.save
      # Add all post pictures without post
      PostPicture.no_post.update_all(post_id: @post.id)

      flash[:notice] = "Post succesfully created"
      redirect_to admin_posts_path
    else
      flash[:alert] = "Correct the errors guapita ;)"
      render :action => :new
    end
  end

  def update
    if @post.update_attributes(params[:post])
      flash[:notice] = "Post has been updated succesfully"
      redirect_to admin_posts_path
    else
      flash[:alert] = "Correct the errors"
      render :action => :edit
    end
  end

  def destroy
    @post.destroy
    flash[:notice] = "Post succesfully removed"
    redirect_to :back
  end

  def toggle_published
    @post.toggle!(:published)

    redirect_to :back
  end

  private

  def find_post
    @post = Post.find_for_show(params[:id])
  end
end