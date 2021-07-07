class CommentsController < ApplicationController

    def index
        if params[:idea_id] && idea = Idea.find_by_id(params[:idea_id])
            comments = idea.comments
            render json: CommentSerializer.new(comments)
          else
            comments = Comment.all
            render json: CommentSerializer.new(comment)
          end  
    end

    def show 
        comment = Comment.find(params[:id])
        render json: CommentSerializer.new(comment, {include: [:idea]})
    end 

    def create
        if params[:idea_id] && idea = Idea.find_by_id(params[:idea_id])
            comment = idea.comments.new(comment_params)
            if comment.save
                render json: CommentSerializer.new(comment, {include: [:idea]})
            else 
                render json: {error: "Comment Couldn't Be Saved!"}
            end 
        else
            render json: {error: "Comment Couldn't Be Saved!"}
        end

    end 

    def destroy 
        story = Story.find(params[:id])
        story.destroy 
        render json: {message: "Successfully Deleted Story: #{story.title}!"}
    end 

    def update 
        story = Story.find(params[:id])
        if story.update(story_params)
            render json: StorySerializer.new(story)
        else 
            render json: {error: "Story Couldn't Be Saved!"}
        end
    end 

    private 

    def comment_params
        params.require(:comment).permit(:description, :idea_id)
    end

end



