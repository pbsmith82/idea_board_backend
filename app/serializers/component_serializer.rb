class ComponentSerializer
  include FastJsonapi::ObjectSerializer
  
  has_many :ideas
  attributes :id, :name



end
