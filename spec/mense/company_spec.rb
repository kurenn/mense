
# frozen_string_literal: true

RSpec.describe Mense::Company do
  describe '.enrich' do
    before do
      sample_json_data = File.read('spec/fixtures/company.json')
      response = JSON.parse(sample_json_data)

      allow(Mense::Company).to receive(:get).with('/company/enrich',
                                                 query: { website: 'google.com' },
                                                 headers: { "X-API-Key" => Mense.api_key,
                                                            "Content-Type" => "application/json"}).and_return(response)
    end

    it 'fetches from the API and maps into a Company object' do
      company = Mense::Company.enrich(website: 'google.com')

      expect(company.id).to eql 'google'
    end

    it 'sets the Location class for the location nested attribute' do
      company = Mense::Company.enrich(website: 'google.com')

      expect(company.location.class).to eql Mense::Company::Location
    end
  end
end
