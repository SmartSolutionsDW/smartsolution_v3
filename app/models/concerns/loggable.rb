module Loggable 
     extend ActiveSupport::Concern
  
    included do
   
      after_validation :check_incidents 
      after_rollback :log_incidents 
   end
  
    # This will keep validation messages for last creation/update try   
     @last_validation_messages = nil   
  
     # This method updates last_validation_messages attribute
    def check_incidents   
       @last_validation_messages = self.errors.full_messages 
     end   
  
     # This method sends a message to Incident for adding an entry to Log
    def log_incidents     
       Incident.log(self.class.name, @last_validation_messages) 
     end
  end