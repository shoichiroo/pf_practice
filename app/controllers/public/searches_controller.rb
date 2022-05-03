class Public::SearchesController < ApplicationController
  def search
    @content = params[:content]
    @posts = Post.where('title LIKE ?', '%' + @content + '%')
  end
end
