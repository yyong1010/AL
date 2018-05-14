module Private
  module Deposits
    class ScointestsController < ::Private::Deposits::BaseController
      include ::Deposits::CtrlCoinable
    end
  end
end