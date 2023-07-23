# Redmine Local Avatars plugin
#
# Copyright (C) 2010  Andrew Chaika, Luca Pireddu
# 
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

require 'redmine'

Redmine::Plugin.register :redmine_local_avatars do
  name 'Redmine Local Avatars plugin'
  author 'Andrew Chaika and Luca Pireddu'
  author_url 'https://github.com/ncoders/redmine_local_avatars'
  description 'This plugin lets users upload avatars directly into Redmine'
  version '1.0.6'
end

# Caution: Reloader is not supported in development mode for Redmine 4 or lower

helper_klass = ApplicationHelper.method_defined?(:avatar) ? ApplicationHelper : AvatarsHelper

AccountController.send(:include,  RedmineLocalAvatars::Patches::AccountControllerPatch)
helper_klass.send(:include,  RedmineLocalAvatars::Patches::ApplicationHelperAvatarPatch)
MyController.send(:include,  RedmineLocalAvatars::Patches::MyControllerPatch)
User.send(:include,  RedmineLocalAvatars::Patches::UsersAvatarPatch)
UsersController.send(:include,  RedmineLocalAvatars::Patches::UsersControllerPatch)
UsersHelper.send(:include,  RedmineLocalAvatars::Patches::UsersHelperAvatarPatch)

require File.expand_path('../lib/redmine_local_avatars/local_avatars', __FILE__)

# patches to Redmine
require File.expand_path('../lib/redmine_local_avatars/patches/account_controller_patch.rb', __FILE__)
require File.expand_path('../lib/redmine_local_avatars/patches/application_helper_avatar_patch.rb', __FILE__)
require File.expand_path('../lib/redmine_local_avatars/patches/my_controller_patch.rb', __FILE__)
require File.expand_path('../lib/redmine_local_avatars/patches/users_avatar_patch.rb', __FILE__)   # User model
require File.expand_path('../lib/redmine_local_avatars/patches/users_controller_patch.rb', __FILE__)
require File.expand_path('../lib/redmine_local_avatars/patches/users_helper_avatar_patch.rb', __FILE__)  # UsersHelper

# hooks
require File.expand_path('../lib/redmine_local_avatars/hooks', __FILE__)
