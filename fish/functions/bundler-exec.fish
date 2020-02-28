# This function was taken from https://gist.github.com/glv/440a5a368b95a2a06466cf1a567422e5

# This sets up fish so that, if you type a command that should be
# run using Bundler, it first automatically prepends "bundle exec"
# to the command line buffer before executing it. Works for all
# commands found in the "bin" directory of the current bundle.
#
# To override this behavior and run such a command without Bundler,
# prefix with "command" (e.g., `command rake -T`)
#
# Pros (vs binstubs or aliases):
# * automatically adjusts to bundle changes
# * explicit (the command visible on your terminal and in your history is
#   "bundle exec whatever", and it's a nice reminder that Bundler magic is
#   happening with those commands)
#
# Cons:
# * Might be surprising at first ("I didn't type that!")
# * Slows down `cd` and other directory change operations a bit (to recompute
#   the `RUN_WITH_BUNDLER` environment variable)
# * Only works if the first token on the command line needs to be run with
#   Bundler. (For example, if you try `env RAILS_ENV=test rake db:create`,
#   that won't work because `env` doesn't need to run under Bundler. But in
#   that very common case, I just use Rake's ability to take environment
#   overrides in *its* argument list instead: `rake RAILS_ENV=test db:create`.)
# * Effectively puts a relative directory in your path (in fact, it works best
#   if you actually do that). This *can* open an attack vector for someone to
#   gain access to your machine, but this is generally not an issue if you
#   aren't root and are not sharing directories with other users. Plus, the
#   altered command line will at least help you notice if something unexpected
#   happened (such as a bundled executable shadowing the `ls` command).
#
# Deficiencies:
# * If you work simultaneously in projects that use Bundler and other projects
#   that use a similar tool, you might want to have things set up to work
#   appropriately with both tools. Currently this is not implemented so as
#   to compose well with similar packages.
#
# Configuration:
#
# 1. Drop this file in `~/.config/fish/bundler-exec.fish`
#
# 2. In `.config/fish/config.fish`, include these lines:
#
#        if test -f ~/.config/fish/bundler-exec.fish
#          source ~/.config/fish/bundler-exec.fish
#        end
#
# 3. Add `~/.config/fish/functions/fish_user_key_bindings.fish` with
#    these lines:
#
#        function fish_user_key_bindings
#          if functions -q _maybe-add-bundle-exec-and-execute
#            bind \r _maybe-add-bundle-exec-and-execute
#          end
#        end
#
#    (or just add the inner if/end block to that function if you're
#    already defining it).
#
# 4. This *effectively* puts your bundle's "bin" directory at the
#    start of `$PATH`, so you may as well actually put it there so
#    that completions and suggestions will also work. You can find
#    that path by going to a project directory that uses Bundler and
#    running `bundle config path`, and then append "/bin" to the
#    value that is displayed. I have Bundler configured to always
#    put the project bundle in `.bundle`, but YMMV. (Note: don't do
#    this step without steps 1-3, because the scripts in the bundle's
#    bin directory are not binstubs, so they won't load the bundle if
#    executed directly.)
#
# Author: Glenn Vanderburg <glenn@vanderburg.org>

begin
  # Support Functions

  function _bundler-installed
    which bundle > /dev/null 2>&1
  end

  function _within-bundled-project
    set -l dir (pwd)
    while test (dirname $dir) != "/"
      if test -f "$dir/Gemfile" -o -f "$dir/gems.rb"
        return
      end
      set -l dir (dirname $dir)
    end
    false
  end

  # Keep RUN_WITH_BUNDLER updated on directory changes
  function _discover_bundle --on-variable PWD
    if _bundler-installed
       and _within-bundled-project

      # This version is slow but simple and safe.
      # set -l bundler_path (bundle exec gem environment path)

      # This version is faster but complex and probably brittle. If
      # you're seeing flaky behavior around all of this, switch to the
      # slow version above and see if that fixes it.
      set -l bundle_path (bundle config path | sed -e '/^Set /!d;s/^.*: "\(.*\)".*$/\1/')

      set -gx RUN_WITH_BUNDLER (command ls "$bundle_path/bin")
    else
      set -ge RUN_WITH_BUNDLER
    end
  end

  # Before executing the current commandline buffer, prepend
  # "bundle exec" if the first token is one of the commands in
  # RUN_WITH_BUNDLER.
  #
  # (This depends on _discover_bundle running correctly on each
  # directory change, and on \r being re-bound to this function in
  # fish_user_key_bindings.)
  function _maybe-add-bundle-exec-and-execute
    set -l toks (commandline --tokenize)
    if contains $toks[1] $RUN_WITH_BUNDLER
      commandline "bundle exec $toks"
      commandline -f repaint
    end
    commandline -f execute
  end
end

_discover_bundle
