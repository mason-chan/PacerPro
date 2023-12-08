class Item < ApplicationRecord
    validates :name, presence: true

    # Default scope to exclude "deleted" items from normal queries
    default_scope -> { where(deleted_at: nil) }

    # Add method "soft_delete" that updates the "deleted_at" attribute with the current timestamp
    def soft_delete
        update(deleted_at: Time.now)
    end

    # Add method "restore" that sets the "deleted_at" attribute to nil
    def restore
        update(deleted_at: nil)
    end
end
