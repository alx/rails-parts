require 'parts/default_layout'

module Parts
  class Base < AbstractController::Base
    attr_reader :params

    include AbstractController::Layouts
    include AbstractController::Translation
    include ActionController::Helpers
    include AbstractController::Rendering
    include ActionController::ImplicitRender
    include DefaultLayout
    include AbstractController::Callbacks

    def initialize(controller, params)
      @params = params
      self.formats = controller.formats
    end

    def self.inherited(klass)
      super
      klass.helper :all
    end
  end
end
