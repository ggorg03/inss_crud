# Update Workers
class UpdateWorkersJob < ApplicationJob
  queue_as :default

  def perform(id, params)
    worker = Worker.find(id)
    worker&.update(permit_params(params))
  end

  def permit_params(params)
    params.permit(:name, :cpf, :birthdate, :personal_phone, :salary, :reference_phone, :street, :number, :district, :city, :state, :zip_code)
  end
end
