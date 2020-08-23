class ImagesController < ApplicationController
    def index
        @images = Image.all()
    end
    
    def new
        @image = Image.new
    end
    

    def create
      if params[:image][:file] == nil
        @image = Image.new(title: params[:image][:title], file: nil, key: params[:image][:key])
      else
        @image = Image.new(title: params[:image][:title], file: params[:image][:file].read(), key: params[:image][:key])
      end  
      
      if @image.save
        flash[:notice] = "1レコード追加しました"
        redirect_to '/'
      else
        render 'new'
      end
    end
        
    def destroy
      @image = Image.find(params[:id])
      if @image.key == params[:key]
        @image.destroy
        flash[:notice] = "削除に成功しました"
        redirect_to '/'
      else
        flash[:notice] = "削除キーが違います"
        redirect_back(fallback_location: root_path)
      end
    end
        
    
    def edit
        @image = Image.find(params[:id])
    end
    
    def update
      image = Image.find(params[:id])
      if image.key == params[:key]
        image = Image.find(params[:id])
        title = params[:image][:title]
        file = params[:image][:file].read
        image.update(title: title, file: file )
        flash[:notice] = "変更に成功しました"
        redirect_to '/'
      else
        flash[:notice] = "変更・削除キーが違います"
        redirect_back(fallback_location: root_path)
      end
    end
    
    def get_image
        image = Image.find(params[:id])
        send_data image.file, disposition: :inline, type: 'image/png'
    end
    
    def show
      @image = Image.find(params[:id])
    end
end
