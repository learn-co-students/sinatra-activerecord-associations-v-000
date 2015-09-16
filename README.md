# ActiveRecord Associations in Sinatra

## Objectives

1. Understand primary and foreign key.
2. Understand the has many/ belongs to relationship.


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

#### What are primary keys
 
A primary key uniquely identifies each record in a table, it must be unique and cannot have NULL values. Luckily, ActiveRecord will create the primary key for us and will also autoincrement it every time we save a new row in our table.

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

#### What are foreign keys

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


We now know how our table should look like, but we did not tell our application how to relate our models to each other.


#### `belong_to` and `has_many` 

Before we write our association, let us think for a minute. The way we  built our tables is, a cat belongs to an owner and an owner can have many cats.

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
Whenever we use a `has_many` we also have to use the `belongs_to` and vise versa in the other model. ***Keep in mind:*** The model with the `belongs_to` association also has the foreign key.

The `has_many`/`belongs_to` is the most used association, but there are others as well. You can read more about ActiveRecord Associations [here](http://guides.rubyonrails.org/association_basics.html).

To take a look at the files we talk about, fork and clone this repo.