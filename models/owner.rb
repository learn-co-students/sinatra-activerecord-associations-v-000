class Owner < ActiveRecord::Base
  has_many :cats
end

# always the "belongs to" has the "tags"... the foreign key
