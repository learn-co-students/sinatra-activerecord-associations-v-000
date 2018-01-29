## ActiveRecord Associations
+ goal: owners have many cats and cats belong to an owners

# Primary key
uniquely identifies each record in a table
+ must be !
+ cannot have null values
+ ActiveRecord creates this for us

# Foreign key
points to primary key in another table
+ use tablename_id convention
+ sits on the table of the object that belongs to
+ cats belong to an owner so the owner_id becomes a column in cats table
