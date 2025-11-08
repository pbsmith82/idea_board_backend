class ComponentsController < ApplicationController

    def index
        component = Component.all
        render json: ComponentSerializer.new(component)
    end

    def show 
        component = Component.find(params[:id])
        render json: ComponentSerializer.new(component)
    end

    def create
        component = Component.new(component_params)
        if component.save
            render json: ComponentSerializer.new(component)
        else 
            render json: {error: "Component Couldn't Be Saved!", errors: component.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def update
        component = Component.find(params[:id])
        if component.update(component_params)
            render json: ComponentSerializer.new(component)
        else 
            render json: {error: "Component Couldn't Be Updated!", errors: component.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def destroy
        component = Component.find(params[:id])
        if component.destroy
            render json: {message: "Component '#{component.name}' was successfully deleted!"}
        else
            render json: {error: "Component Couldn't Be Deleted!"}, status: :unprocessable_entity
        end
    end

    private

    def component_params
        params.require(:component).permit(:name)
    end

end
