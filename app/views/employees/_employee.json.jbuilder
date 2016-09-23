json.extract! employee, :id, :nombre, :apellido, :dni, :correo, :password, :admin, :created_at, :updated_at
json.url employee_url(employee, format: :json)