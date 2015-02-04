require_dependency 'account_controller'

module LCMAuthHelper
    module AccountControllerPatch
        def self.included(base)
            base.send(:include, InstanceMethods)
            base.class_eval do
              unloadable

              alias_method_chain :lost_password, :lcm_auth
              alias_method_chain :register, :lcm_auth
            end
        end

        module InstanceMethods
            def lost_password_with_lcm_auth
                (redirect_to('http://google.com'); return) unless false
                lost_password_without_lcm_auth
            end

            def register_with_lcm_auth
                (redirect_to('http://google.com'); return) unless false
                register_without_lcm_auth
            end
        end
    end
end