Redmine::Plugin.register :lcm_auth_helper do
  name 'LCM Auth Helper'
  author 'Rob Bayliss'
  description 'This is a plugin for LDAP related modifications to Redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'

  settings :default => {
      'register_url' => '',
      'lost_password_url' => '',
    },
    :partial => 'settings/lcmauth'

end

AccountController.send(:include, LCMAuthHelper::AccountControllerPatch)