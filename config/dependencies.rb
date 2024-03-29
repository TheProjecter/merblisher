# Make the app's "gems" directory a place where gems are loaded from
Gem.clear_paths
Gem.path.unshift(MERB_ROOT / "gems")

# Make the app's "lib" directory a place where ruby files get "require"d from
$LOAD_PATH.unshift(MERB_ROOT / "lib")

### Merb doesn't come with database support by default.  You need
### an ORM plugin.  Install one, and uncomment one of the following lines,
### if you need a database.

### Uncomment for DataMapper ORM
# use_orm :datamapper

### Uncomment for ActiveRecord ORM
use_orm :activerecord

### Uncomment for Sequel ORM
# use_orm :sequel


### This defines which test framework the generators will use
### rspec is turned on by default
# use_test :test_unit
use_test :rspec

### Add your other dependencies here

# These are some examples of how you might specify dependencies.
# 
# dependencies "RedCloth", "merb_helpers"
# OR
# dependency "RedCloth", "> 3.0"
# OR
# dependencies "RedCloth" => "> 3.0", "ruby-aes-cext" => "= 1.0"

Merb::Server.after_app_loads do
  ### Add dependencies here that must load after the application loads:

  # dependency "magic_admin" # this gem uses the app's model classes
end
