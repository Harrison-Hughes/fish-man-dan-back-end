class Request < ApplicationRecord
  belongs_to :item
  belongs_to :order

  def self.make_requests(order, request_objects) # request objects => [{item_id: ~, amount: ~, note: ~}, ...]
    output = request_objects.map{ |r| Request.create(order: order, item: Item.find_by(id: r["item_id"].to_i), amount: r["amount"], note: r["note"])}
    return output
  end

  def self.update_requests(order, request_objects)
    return request_objects.map{ |r| update_request(order, r)}
  end

end

def update_request(order, request_object)
  req = Request.find_by(order_id: order.id, item_id: request_object["item_id"].to_i)

  # create request 
  if req.nil? && request_object["amount"] != "0"
    if Request.create(order: order, item: Item.find_by(id: request_object["item_id"].to_i), amount: request_object["amount"], note: request_object["note"])
      return 1
    else
      return 0
    end
  end

  # if try to add object with no amount
  if req.nil? && request_object["amount"] == "0"
    return 1
  end

  # delete request
  if !req.nil? && request_object["amount"] == "0"
    if req.destroy
      return 1
    else return 0
    end
  end

  # update request
  if req.update(amount: request_object["amount"], note: request_object["note"])
    return 1
  else return 0
  end

  return 0

end
