class ApplicationController < Sinatra::Base

  # add routes
  get "/bakeries" do
    content_type "application/json"
    
    bakeries = Bakery.all
    bakeries.to_json
  end
  get "/bakeries/:id" do
    content_type "application/json"
    bakery = Bakery.find(params[:id])
    bakery.to_json(include: :baked_goods)
  end

  get "/baked_goods/by_price" do
    content_type "application/json"
    baked_goods = BakedGood.order(:price => :desc)
    baked_goods.to_json
  end
  get "/baked_goods/most_expensive" do
    baked_good = BakedGood.order(price: :desc).first
    baked_good.to_json
  end


end
