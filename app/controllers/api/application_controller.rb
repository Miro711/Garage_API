class Api::ApplicationController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

    def record_invalid(error)
        record = error.record # Instance of model that failed validation

        errors = record.errors.map do |field, message|
          {
            type: error.class.to_s,
            record_type: record.class.to_s,
            field: field,
            message: message
          }
        end

        render(
          json: { status: 422, errors: errors },
          status: 422
        )
    end
end
