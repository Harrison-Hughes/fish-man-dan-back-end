class Request < ApplicationRecord
  belongs_to :item
  belongs_to :order

  def self.make_requests(order, request_objects) # request objects => [{item_id: ~, amount: ~, note: ~}, ...]
    output = request_objects.map{ |r| Request.create(order: order, item: Item.find_by(id: r["item_id"].to_i), amount: r["amount"], note: r["note"])}
    return output
  end

  def self.update_requests(request_objects)
    return request_objects.map{ |r| update_request(r)}
  end

  def update_request(request_object)
    req = Request.find_by(id: request_object["item_id"].to_i)

    # delete request
    if request_object["amount"] == "0"
      if req.destroy
        return true
      else 
        return false
    end

    # update request
    if req.update(amount: request_object["amount"], note: request_object["note"])
      return req
    else 
      return false
    end
  end
end
