Redmine::Plugin.register :lcm_auth_helper do
  name 'LCM Auth Helper'
  author 'Rob Bayliss'
  description 'This is a plugin for LDAP related modifications to Redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'

  settings :default => {
      'register_url' => 'http://registry.lcmdev.com:8083',
      'lost_password_url' => 'http://registry.lcmdev.com:8083/forgot',
      'account_edit_message' => '<p>Change your first name, last name, and email settings on the central authentication server: <a href="http://registry.lcmdev.com:8083">http://registry.lcmdev.com:8083</a></p>'
    },
    :partial => 'settings/lcmauth'

end

AccountController.send(:include, LCMAuthHelper::AccountControllerPatch)