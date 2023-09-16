module ItemModule
  def list_items
    @items.each_with_index do |item, index|
      puts "[#{index + 1}] [#{item.class}] #{item}"
    end
  end
end
