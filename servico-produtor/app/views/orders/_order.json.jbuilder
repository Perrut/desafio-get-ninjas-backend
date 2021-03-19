json.id order.id

json.user_info do
    json.phone order.user_info.phone
    json.name order.user_info.name
    json.email order.user_info.email
end

json.address_attributes do
    json.city order.address_attribute.city
    json.neighborhood order.address_attribute.neighborhood
    json.street order.address_attribute.street
    json.uf order.address_attribute.uf
    json.zip_code order.address_attribute.zip_code
end

json.request_info do
    json.question1 order.request_info.question1
    json.question2 order.request_info.question2
    json.question3 order.request_info.question3
end
