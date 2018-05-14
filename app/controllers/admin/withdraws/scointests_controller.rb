module Admin
  module Withdraws
    class ScointestsController < ::Admin::Withdraws::BaseController
      load_and_authorize_resource :class => '::Withdraws::Scointest'

      def index
        start_at = DateTime.now.ago(60 * 60 * 24)
        @one_scointests = @scointests.with_aasm_state(:accepted).order("id DESC")
        Rails.logger.info @scointests
        Rails.logger.info "----------------------"
        Rails.logger.info @one_scointests
        @all_scointests = @scointests.without_aasm_state(:accepted).where('created_at > ?', start_at).order("id DESC")
        Rails.logger.info "----------------------"
        Rails.logger.info @all_scointests
      end

      def show
      end

      def update
        @scointest.process!
        redirect_to :back, notice: t('.notice')
      end

      def destroy
        @scointest.reject!
        redirect_to :back, notice: t('.notice')
      end
    end
  end
end
