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
                redirection = Setting.plugin_lcm_auth_helper['lost_password_url']
                (redirect_to(redirection); return) unless redirection.empty?
                lost_password_without_lcm_auth
            end

            def register_with_lcm_auth
                redirection = redirection = Setting.plugin_lcm_auth_helper['register_url']
                (redirect_to(redirection); return) unless redirection.empty?
                register_without_lcm_auth
            end
        end
    end
end