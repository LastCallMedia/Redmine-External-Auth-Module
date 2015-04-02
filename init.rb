Redmine::Plugin.register :lcm_auth_helper do
  name 'LCM Auth Helper'
  author 'Rob Bayliss'
  description 'This is a plugin for LDAP related modifications to Redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'

  settings :default => {
      'register_url' => 'https://portal.lastcallmedia.com/register',
      'lost_password_url' => 'https://portal.lastcallmedia.com/forgot',
      'account_edit_message' => '<p style="padding-left:0;">Change your first name, last name, and email settings on the central authentication server: <a href="http://portal.lastcallmedia.com">https://portal.lastcallmedia.com</a></p>'
    },
    :partial => 'settings/lcmauth'

end

AccountController.send(:include, LCMAuthHelper::AccountControllerPatch)