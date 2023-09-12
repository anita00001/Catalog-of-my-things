require 'json'

class SaveDataToFile
  def self.save_to_json(file_path, data)
    serialized_data = data.map do |item|
      item.instance_variables.each_with_object({}) do |var, hash|
        hash[var.to_s.delete('@')] = item.instance_variable_get(var)
      end
    end

    File.open(file_path, 'w') do |file|
      file.puts(serialized_data.to_json)
    end
  end
end
