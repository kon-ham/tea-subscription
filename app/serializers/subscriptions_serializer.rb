class SubscriptionsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :price, :status, :frequency

  set_type :subscription
end
