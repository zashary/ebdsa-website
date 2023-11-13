module PaperTrail
    class Version < ActiveRecord::Base
  
      def self.ransackable_attributes(auth_object = nil)
        %w[created_at event id item_id item_type object object_changes whodunnit]
      end
  
      def user
        User.where(id: self.whodunnit.to_i).first
      end
    end
  end
  
  PaperTrail::Model::ClassMethods.module_eval do
    alias_method :old_has_paper_trail, :has_paper_trail
    def has_paper_trail(options = {})
      options[:ignore] ||= []
      options[:ignore] += [:created_at, :updated_at, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip, :sign_in_count]
      old_has_paper_trail(options)
    end
  end