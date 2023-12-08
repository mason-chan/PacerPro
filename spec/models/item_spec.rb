require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'soft delete functionality' do
    let(:item) { Item.create(name: 'Test Item') }

    it 'item instantiated with nil deleted_at' do
      expect(item.deleted_at).to be_nil
    end

    it 'soft deletes an item' do
      item.soft_delete
      expect(item.deleted_at).to be_present
    end

    it 'restores a soft-deleted item' do
      #item.soft_delete
      item.restore
      expect(item.deleted_at).to be_nil
    end

    it 'excludes soft-deleted items from normal queries' do
      soft_deleted_item = Item.create(name: 'Soft Deleted Item')
      soft_deleted_item.soft_delete

      regular_item = Item.create(name: 'Regular Item')

      items = Item.all
      expect(items).to include(regular_item)
      expect(items).not_to include(soft_deleted_item)
    end
  end
end
