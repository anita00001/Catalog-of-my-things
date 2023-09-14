require 'rspec'
require_relative '../classes/label'

describe Label do
  let(:label) { Label.new('Ruby', 'red') }
  let(:item) { double('Item') }

  context 'when initializing a label' do
    it 'should set the title and color' do
      expect(label.title).to eq('Ruby')
      expect(label.color).to eq('red')
    end

    it 'should have an empty items list' do
      expect(label.items).to be_empty
    end
  end

  context 'when adding an item to the label' do
    it 'should add the item to the label' do
      allow(item).to receive(:label=)
      label.add_item(item)

      expect(label.items).to include(item)
    end

    it 'should set the label of the added item to itself' do
      item = Item.new('Item Title')
      label.add_item(item)

      expect(item.label).to eq(label)
    end

    it 'should not add the same item twice' do
      allow(item).to receive(:label=)
      label.add_item(item)
      label.add_item(item)

      expect(label.items.size).to eq(1)
    end
  end

  context 'when converting the label to a string' do
    it 'should return a string representation of the label' do
      expected_string = "Id: #{label.id}, Title: Ruby, Color: red"
      expect(label.to_s).to eq(expected_string)
    end
  end

  context 'when converting the label to JSON' do
    it 'should return a valid JSON representation' do
      expected_json = "{\"json_class\":\"Label\",\"id\":#{label.id},\"title\":\"Ruby\",\"color\":\"red\",\"items\":[]}"
      expect(label.to_json).to eq(expected_json)
    end
  end
end
