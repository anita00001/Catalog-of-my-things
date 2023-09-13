require_relative '../classes/label'

module LabelModule
  def create_label(item = nil)
    puts 'Title:'
    title = gets.chomp
    puts 'Color:'
    color = gets.chomp

    if item.nil?
      @labels << Label.new(title, color)
    else
      new_label = Label.new(title, color)
      new_label.add_item(item)
      @labels << new_label
    end
    puts 'Label created successfully!'
  end

  def list_labels
    @labels.each_with_index do |label, index|
      puts "#{index + 1} #{label}"
    end
  end
end
