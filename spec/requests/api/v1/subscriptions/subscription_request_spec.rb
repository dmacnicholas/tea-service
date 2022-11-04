require 'rails_helper'

RSpec.describe "Subscription endpoints" do
  it 'can list all subscriptions of one customer' do
    customer = create(:customer)
    customer2 = create(:customer)
    tea = create(:tea)
    create_list(:subscription, 5, customer_id: customer.id, tea_id: tea.id)
    create_list(:subscription, 5, customer_id: customer2.id, tea_id: tea.id)

    get '/api/v1/subscriptions', params: { customer_id: customer.id }

    subscriptions = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq 200
    expect(subscriptions).to be_a(Hash)
    expect(subscriptions[:data].count).to eq(5)

    first = subscriptions[:data].first

    expect(first).to include(:id)
    expect(first).to include(:type)
    expect(first).to include(:attributes)
    expect(first[:attributes]).to include(:title)
    expect(first[:attributes]).to include(:price)
    expect(first[:attributes]).to include(:status)
    expect(first[:attributes][:status]).to eq("Active")
    expect(first[:attributes]).to include(:frequency)
    expect(first[:attributes][:tea]).to include(:title)
    expect(first[:attributes][:tea]).to include(:description)
    expect(first[:attributes][:tea]).to include(:temperature)
    expect(first[:attributes][:tea]).to include(:brew_time)
    expect(first[:attributes][:customer]).to include(:first_name)
    expect(first[:attributes][:customer]).to include(:last_name)
    expect(first[:attributes][:customer]).to include(:email)
    expect(first[:attributes][:customer]).to include(:address)
  end

  it 'can create a new subscription' do
   customer = create(:customer)
   tea = create(:tea)
   subscription_params = {
                       customer_id: customer.id,
                       tea_id: tea.id,
                        title: "Beginner Program",
                        price: 30.00,
                        status: "Active",
                        frequency: "Monthly"
                     }

   post '/api/v1/subscriptions', params: subscription_params

   subscription = JSON.parse(response.body, symbolize_names: true)

   expect(response).to be_successful
   expect(response.status).to eq 201
   expect(subscription).to be_a(Hash)

   expect(subscription[:data]).to include(:id)
   expect(subscription[:data]).to include(:type)
   expect(subscription[:data]).to include(:attributes)

   attributes = subscription[:data][:attributes]

   expect(attributes).to include(:title)
   expect(attributes).to include(:price)
   expect(attributes).to include(:status)
   expect(attributes[:status]).to eq("Active")
   expect(attributes).to include(:frequency)
   expect(attributes[:customer]).to include(:first_name)
   expect(attributes[:customer]).to include(:last_name)
   expect(attributes[:customer]).to include(:email)
   expect(attributes[:customer]).to include(:address)
   expect(attributes[:tea]).to include(:title)
   expect(attributes[:tea]).to include(:description)
   expect(attributes[:tea]).to include(:temperature)
   expect(attributes[:tea]).to include(:brew_time)
 end
end
