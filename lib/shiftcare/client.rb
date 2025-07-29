module Shiftcare
  class Client
    attr_reader :id, :full_name, :email

    def initialize(attrs)
      @id = attrs['id']
      @full_name = attrs['full_name']
      @email = attrs['email']
    end

    def formatted_info
      "ID:#{id}, Full Name: #{full_name}, Email: #{email}"
    end
  end
end
