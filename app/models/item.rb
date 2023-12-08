class Item < ApplicationRecord
    validates :name, presence: true

    # Soft delete 
    default_scope -> { where(deleted_at: nil) }

    def soft_delete
        update(deleted_at: Time.now)
    end

    def restore
        update(deleted_at: nil)
    end
end
