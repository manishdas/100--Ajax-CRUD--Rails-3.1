class PostsController < ApplicationController
    def index
        @post  = Post.new
        load
    end

    def edit
        @post = Post.find(params[:id])
    end

    def create
        @post = Post.new(params[:post])
        if @post.save
            flash[:notice] = 'Post was successfully created.'
            load
        end
    end

    def update
        @post = Post.find(params[:id])
        if @post.update_attributes(params[:post])
            flash[:notice] = 'Post was successfully updated.'
            load
        end
    end

    def destroy
        @post = Post.find(params[:id])
        if @post.destroy
            flash[:notice] = 'Successfully destroyed post.'
            load
        end
    end
    
    private
        def load
            @posts = Post.all
        end
end