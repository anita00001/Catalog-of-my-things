require_relative '../classes/label'
require_relative 'item_module'

module LabelModule
  include ItemModule

  def create_label
    puts 'Title:'
    title = gets.chomp
    puts 'Color:'
    color = gets.chomp

    new_label = Label.new(title, color)
    @labels << new_label

    puts 'Select item to add to label [Choose by index] (NOT ID): '
    list_items
    item_idx = gets.chomp.to_i
    new_label.add_item(@items[item_idx - 1])
    puts 'Label created successfully!'
  end

  def list_labels
    @labels.each_with_index do |label, index|
      puts "#{index + 1} #{label}"
    end
  end
end
