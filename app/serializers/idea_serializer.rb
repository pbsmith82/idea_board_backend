class IdeaSerializer
  include FastJsonapi::ObjectSerializer

  belongs_to :component
  has_many :comments

  attributes :id, :title, :description, :likes
  
  attribute :component_name do |object|
    component = Component.find_by_id(object.component_id)
    component.name
  end

  attribute :comments do |object|
    comments = object.comments
    comments
  end
  
  
end
