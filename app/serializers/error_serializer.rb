class ErrorSerializer
  def self.format_error(errors)
    return if errors.nil? 

    { 
      message: errors
    }
  end
end