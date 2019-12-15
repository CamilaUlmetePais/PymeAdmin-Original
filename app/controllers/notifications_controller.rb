class NotificationsController < ApplicationController
	before_action :set_notification, only: [:show, :edit, :update, :destroy]

	def index
  	@notifications = Notification.all
	end

	def show
	end

	def edit
	end

	def new
		@notification = Notification.new
	end

	def create

	end

	def update
		respond_to do |format|
			if @notification.update(notification_params)
				format.html { redirect_to @notification, notice: I18n.t('activerecord.controllers.actions.updated', model_name: I18n.t('activerecord.models.notification.one') ) }
				format.json { render :show, status: :ok, location: @notification }
			else
				format.html { render :edit }
				format.json { render json: @notification.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@notification.destroy
		respond_to do |format|
			format.html { redirect_to notifications_url, notice: I18n.t('activerecord.controllers.actions.destroyed', model_name: I18n.t('activerecord.models.notification.one') ) }
			format.json { head :no_content }
		end
	end

	private

		def set_notification
			@notification = Notification.find(params[:id])
		end

		def notification_params
			params.require(:notification).permit(:title, :text, :done)
		end

end