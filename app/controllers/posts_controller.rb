# encoding: utf-8

class PostsController < ApplicationController
  def index
    @posts = Post.published.primary.before_now.newest_first
    @secondary_posts = Post.published.secondary.before_now.newest_first
  end

  def show
    @post = Post.find_for_show(params[:id])
  end
end