class ErrorSerializer
  def self.format_error(errors)
    { 
      message: errors
    }
  end
end