%w(acts_as_authentable authentable_entity authenticated_system).each do |file|
  require file
end

ActionController::Base.send :include, AuthenticatedSystem
ActionController::Base.send :filter_parameter_logging, :password
ActiveRecord::Base.send :include, ActiveRecord::Acts::Authentable
