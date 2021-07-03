class ComponentsController < ApplicationController

    def index
        component = Component.all
        render json: ComponentSerializer.new(component)
    end

    def show 
        component = Component.find(params[:id])
        render json: ComponentSerializer.new(component)
    end 

end
