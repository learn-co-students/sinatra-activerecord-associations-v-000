# ActiveRecord Associations in Sinatra

## Objectives

1. Understand primary and foreign key.
2. Understand the has many/ belongs to relationship.


### Introduction 

Previously, we learned about foreign and primary keys in SQL and how they relate tables to one another. In this lesson, we're going to learn how to do this using ActiveRecord. This lab has pre-written code that you can follow along with - feel free to fork and clone the repo locally.

### Primary Keys

Let's assume we have two tables in our database: `cats` and `owners`, which we created from the command line using rake.

#### Review: Creating a table with ActiveRecord

First, we create a cats table from the command line:
`rake db:create_migration NAME="create_cats"`

This will give us an empty migration in our `db/migrate/` folder. Now lets give our cats table attributes: `name`, `age` and `breed`. This will go into our `up` method. In the `down` method we tell the migration what should happen if for any reason we want to roll back our migrations. Our instruction in the `down` method is the opposite of `create table`- `drop table`.

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

#### Review: Primary Keys
 
A primary key uniquely identifies each record in a table. it must be unique and cannot have NULL values. Luckily, ActiveRecord will create the primary key for us and will also auto-increment it every time we save a new row in our table.

Our `cats` table looks like this:

| id  | name    | age | breed         |
|-----|-----    |-----|------         |
| 1   | Maru    | 3   | Scottish Fold |
| 2   | Hannah  | 2   | Tabby         |
| 3   | Patches | 2   | Calico        |


Our `owners` table:

| id  | name      |
|-----|-----      |
| 1   | Sophie    |
| 2   | Ann       |

Now, we need to tell our tables how to relate to each other. This is where we'll use a foreign key.

#### Using Foreign Keys

A foreign key points to a primary key in another table. In ActiveRecord we will use the `tablename_id` convention. To add the foreign key to our cats table, we will create another migration.

```ruby
class AddColumnToCats < ActiveRecord::Migration
  def up
    add_column :cats, :owner_id, :integer
  end

  def down
    remove_column :cats, :owner_id
  end
end
```

Our `cats` table should look like this:

| id  | name    | age | breed         | owner_id |
|-----|-----    |-----|------         |-----     |
| 1   | Maru    | 3   | Scottish Fold | 1        |
| 2   | Hannah  | 2   | Tabby         | 2        |
| 3   | Patches | 2   | Calico        | 1        |


We now know what our table should look like. However, we haven't told our application how to relate the models to each other.


#### `belong_to` and `has_many` 

Before we write our association let's think about our table structure: A cat belongs to an owner, and an owner can have many cats.

This translates into ruby like this:

```ruby
class Cat
  belongs_to :owner
end
```

```ruby
class Owner
  has_many :cats
end
```
Whenever we use a `has_many` we also have to use the `belongs_to` (and vice-versa) in the other model. ***Keep in mind:*** The model with the `belongs_to` association also has the foreign key.

#### Creating objects

After setting our associations, we can create a cat and a owner and save them to our database. 

```ruby
sophie = Owner.create(name: "Sophie")
maru = Cat.new(name: "Maru", age: 3, breed: "Scottish Fold")
maru.owner = sophie
maru.save
```

We used the `.create` method to instantiate and save the owner to our database. To instantiate the cat object we used the `.new` method, after that we set "Maru's" owner to the owner we created. Because the `.new` method did not save the cat object to our database the last line will persist the cat object to our database.


The `has_many`/`belongs_to` relationship is the most used association, but there are others as well. You can read more about ActiveRecord Associations [here](http://guides.rubyonrails.org/association_basics.html).

