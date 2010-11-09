# put this in any .rb file in config/initializers , make up your own, put it in an
# existing one, whatever works for you.

# As with many things in rails/Blacklight, there are many ways to do this, but
# this is one, it looks kinda complicated becuase it's trying to deal with
# cache_classes=false business.

module LocalAssetInclude
  def add_local_assets
#     # my_local_stylesheet.css should be found in your app's public/stylesheets/
#     stylesheet_links << "my_local_stylesheet"
     # my_local_script.js should be found in your app's public/javascripts/
     javascript_includes << "my_local_javascript"
  end
end

# We use Dispatcher.to_prepare to deal with cache_classes=false, when the
# controller may (or may not) be reloaded on every request. to_prepare
# will be called on every request, but then it checks to see if the
# controller has our local module, and if not adds it and adds the before
# filter.
#
# To add just for certain controller(s) instead of all, use specific
# controller(s) instead of ApplicationController
ActionController::Dispatcher.to_prepare do
  unless ApplicationController.kind_of?( LocalAssetInclude )
     ApplicationController.send(:include, LocalAssetInclude )
     ApplicationController.before_filter(:add_local_assets)
  end
end
