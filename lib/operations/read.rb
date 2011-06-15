module TroleGroups
  class Operations
    module Read      
      def roles
        
      end

      def roles_for *names
        rolegroup_subject.roles_for *names
      end
      
      # The roles list of the role subject
      # @return [Array<Symbol>] the list of roles
      def list
        rolegroup_subject.rolegroup_list
      end

      # Test if the role subject has exactly the given roles
      # @param [Array<Symbol>] role list to test
      # @return [true, false] true if role subject has exactly those roles, false otherwise 
      def has? *rolegroups
        list == rolegroups.to_symbols_uniq
      end

      # Which of the given roles are used by the role subject
      # @param [Array<Symbol>] roles to test for inclusion      
      #
      # Usage:
      #  - user.roles.used(:admin, :editor).include? :editor
      #
      def used *rolegroups
        list & rolegroups.to_symbols_uniq
      end
    end
  end
end