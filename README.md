# ActiveRecord Associations in Sinatra

##TEACHER OUTLINE
+ Creating multiple tables
+ Describe has many/belongs to relationships
+ Setting up has_many, belongs_to relationship between models
+ Discuss the use of primary keys as the link between models in ActiveRecord
+ Should allude to other types of relationships (many to many, one to one, etc) but not discuss join tables.


## Objectives

1. Create tables with ActiveRecord.
2. Understand the primary key and foreign key.
4. Understand the has many/ belongs to relationship.


### Primary Keys

Let's assume we have two tables in our database `cats` and `owners`, which we created from the command line using rake.

#### How to create a table with ActiveRecord

Example on how to create a cats table from the command line:
`rake db:create_migration NAME="create_cats"`

This will give us an empty migration in our `db/migrate/` folder. Now lets give our cats table attributes: `name`, `age` and `breed`. This will go into our up method. In the down method we will also tell the migration what should happen, if for any reason we want to rollback our migration. Here, it would be the opposite of `create table` which is `drop table`.

```ruby
class CreateCats < ActiveRecord::Migration
  def up
    create_table :cats do |t|
      t.string :name
      t.integer :age
      t.string :breed
    end
  end
  
  def down
    drop_table :cats
  end
end
```
Like we said in the beginning, lets assume we already 
