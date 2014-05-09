# encoding: utf-8

class PostsController < ApplicationController
  def index
    @posts = Post.published.newest_first
  end
end