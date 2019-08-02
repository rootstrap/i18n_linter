# frozen_string_literal: true

class Logger < ApplicationRecord
  def action_log(action)
    Rails.logger.info 'Action name: ' + action.name
    Rails.logger.debug('Status: ' + action.status)
    Rails.logger.info { 'Class name: ' + action.class_name }
  end

  def user_log(user)
    logger = Rails.logger
    logger.info 'Current user: ' + user.name
    logger.debug { 'Status: ' + user.status }
    logger.info('Role: ' + user.role)
  end
end
