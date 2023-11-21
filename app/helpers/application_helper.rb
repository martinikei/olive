module ApplicationHelper
    def calculate_age(birthdate)
        return nil if birthdate.nil?
    
        today = Date.current
        age = today.year - birthdate.year - ((today.month > birthdate.month || (today.month == birthdate.month && today.day >= birthdate.day)) ? 0 : 1)
        age.positive? ? age : nil
      end
end
