# PacerPro Coding Test 

## Description
Ruby on Rails project that implements a basic soft delete functionality for a model named "Item". Soft delete is a mechanism that allows records to be marked as deleted without actually removing them from the database. In this implementation, a "deleted_at" attribute is added to the "Item" model, and soft delete is achieved by updating this attribute with the current timestamp.

## Setup and Installation
Make sure to have the following installed on your machine:
* Ruby
* Ruby on Rails
* SQLite

### Clone repo
```console
git clone https://github.com/mason-chan/PacerPro.git
cd PacerPro
```

### Install Dependencies
```console
bundle install
``` 

### Database Setup
```console
rails db:migrate
```

## Usage

### Soft Delete Mechanism 
The model includes a "soft_delete" method that updates the "deleted_at" attribute with the current timestamp, and a "restore" method that sets the "deleted_at" attribute to "nil". A default scope is added to the model to exclude "deleted" items from normal queries.

Example:
```ruby
item = Item.create(name: 'Example')
item.soft_delete # Soft deletes the item
item.restore # Restores the soft-deleted item
```

## Running Tests

```console
bundle exec rspec
```

This command runs RSPec tests to ensure the soft delete functionality works correctly. Tests include checking if instantiated item is nil, soft deleting an item, restoring a soft-deleted item, and verifying that soft-deleted items are excluded from normal queries.