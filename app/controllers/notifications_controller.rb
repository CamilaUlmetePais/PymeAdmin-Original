class NotificationsController < ApplicationController
	before_action :set_notification, only: [:show, :edit, :update, :destroy]

	def create
		@notification = Notification.new(notification_params)
		respond_to do |format|
			if @notification.save
				format.html {redirect_to notifications_path, notice: {message: I18n.t('activerecord.controllers.actions.created', model_name: I18n.t('activerecord.models.notification.one') ), html_class: 'success' } }
			else
				format.html { render :new }
				format.json { render json: @notification.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@notification.destroy
		respond_to do |format|
			format.html { redirect_to notifications_path, notice: { message: I18n.t('activerecord.controllers.actions.destroyed', model_name: I18n.t('activerecord.models.notification.one') ), html_class: 'danger' } }
			format.json { head :no_content }
		end
	end

	def edit
	end

	def index
  	@notifications = Notification.all
	end

	def new
		@notification = Notification.new
	end

	def show
	end

	def update
		respond_to do |format|
			if @notification.update(notification_params)
				format.html { redirect_to notifications_path, notice: { message: I18n.t('activerecord.controllers.actions.updated', model_name: I18n.t('activerecord.models.notification.one') ), html_class: 'success' } }
				format.json { render :show, status: :ok, location: @notification }
			else
				format.html { render :edit }
				format.json { render json: @notification.errors, status: :unprocessable_entity }
			end
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