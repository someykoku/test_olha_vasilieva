require "nested_form/engine"
require "nested_form/builder_mixin"

RailsAdmin.config do |config|

  config.authorize_with :cancancan

  config.current_user_method { current_user }

  config.actions do
    dashboard
    index
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
  end
end
