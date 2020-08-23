class LikesController < ApplicationController
    def create
        @image = Image.find(params[:image_id])
        @alreadylike = Like.find_by(ip: request.remote_ip, image_id: params[:image_id])
        if @alreadylike
            redirect_back(fallback_location: root_path)
            flash[:notice] = "すでにいいねしています"
        else
            redirect_back(fallback_location: root_path)
        end
    end
end
