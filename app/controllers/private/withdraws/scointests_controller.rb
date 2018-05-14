module Private
  module Withdraws
    class ScointestsController < ::Private::Withdraws::BaseController
      include ::Withdraws::Withdrawable
    end
  end
end
