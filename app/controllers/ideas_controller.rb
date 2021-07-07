class IdeasController < ApplicationController

    def index
        ideas = Idea.all
        render json: IdeaSerializer.new(ideas) #, {include: [:component]}
    end

    def show 
        idea = Idea.find(params[:id])
        render json: IdeaSerializer.new(idea)
    end 

    def create
        idea = Idea.new(idea_create_params)
        if idea.save
            render json: IdeaSerializer.new(idea)
        else 
            render json: {error: "Idea Couldn't Be Saved!"}
        end 

    end
    
    def update 
        idea = Idea.find(params[:id])
        if idea.update(idea_create_params)
            render json: IdeaSerializer.new(idea)
        else 
            render json: {error: "Idea Couldn't Be Saved!"}
        end
    end 

    def destroy 
        idea = Idea.find(params[:id])
        idea.destroy 
        render json: {message: "Successfully Deleted Project: #{idea.title}!"}
    end
    
    def update 
        idea = Idea.find(params[:id])
        if idea.update(idea_create_params)
            render json: IdeaSerializer.new(idea)
        else 
            render json: {error: "Idea Couldn't Be Saved!"}
        end
    end 

    private 

    def idea_create_params
        params.require(:idea).permit(:title, :description, :likes, :component_id)
    end
    
end
