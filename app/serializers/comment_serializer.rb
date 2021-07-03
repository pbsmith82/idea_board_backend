class CommentSerializer
  include FastJsonapi::ObjectSerializer

  belongs_to :idea
  attributes :id, :description

  attribute :idea_title do |object|

    idea = Idea.find_by_id(object.idea_id)
    idea.title
  end
  
end
