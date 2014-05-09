# encoding: utf-8

class PostsController < ApplicationController
  def index
    @posts = Post.published.newest_first
  end

  def show
    @post = Post.find_for_show(params[:id])
  end
end