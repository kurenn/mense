# frozen_string_literal: true

RSpec.describe Mense::Person do
  describe '.enrich' do
    before do
      sample_json_data = File.read('spec/fixtures/profile.json')
      response = JSON.parse(sample_json_data)

      allow(Mense::Person).to receive(:get).with('/person/enrich',
                                                 query: { email: 'sample@sample.com' },
                                                 headers: { "X-API-Key" => Mense.api_key }).and_return(response)
    end

    it 'fetches from the API and maps into a Person object' do
      person = Mense::Person.enrich(email: 'sample@sample.com')

      expect(person.id).to eql 'qEnOZ5Oh0poWnQ1luFBfVw_0000'
    end

    it 'maps the emails to the Email class' do
      person = Mense::Person.enrich(email: 'sample@sample.com')

      expect(person.emails.map(&:class)).to eql [Mense::Person::Email, Mense::Person::Email, Mense::Person::Email]
    end

    it 'maps the experience to the Experience class' do
      person = Mense::Person.enrich(email: 'sample@sample.com')

      expect(person.experience.map(&:class)).to eql [Mense::Experience, Mense::Experience]
    end

    it 'maps the education to the Education class' do
      person = Mense::Person.enrich(email: 'sample@sample.com')

      expect(person.education.map(&:class)).to eql [Mense::Education, Mense::Education]
    end

    it 'maps the profiles to the Education class' do
      person = Mense::Person.enrich(email: 'sample@sample.com')

      expect(person.profiles.map(&:class)).to eql [Mense::Profile, Mense::Profile, Mense::Profile]
    end
  end

  describe '.retrieve' do
    before do
      sample_json_data = File.read('spec/fixtures/profile.json')
      response = JSON.parse(sample_json_data)

      allow(Mense::Person).to receive(:get).with('/person/retrieve/qEnOZ5Oh0poWnQ1luFBfVw_0000',
                                                 query: {},
                                                 headers: { "X-API-Key" => Mense.api_key }).and_return(response)
    end

    it 'fetches from the API and maps into a Person object' do
      person = Mense::Person.retrieve('qEnOZ5Oh0poWnQ1luFBfVw_0000')

      expect(person.id).to eql 'qEnOZ5Oh0poWnQ1luFBfVw_0000'
    end

    it 'responds to an alis of find' do
      person = Mense::Person.find('qEnOZ5Oh0poWnQ1luFBfVw_0000')

      expect(person.id).to eql 'qEnOZ5Oh0poWnQ1luFBfVw_0000'
    end

    it 'maps the emails to the Email class' do
      person = Mense::Person.retrieve('qEnOZ5Oh0poWnQ1luFBfVw_0000')

      expect(person.emails.map(&:class)).to eql [Mense::Person::Email, Mense::Person::Email, Mense::Person::Email]
    end

    it 'maps the experience to the Experience class' do
      person = Mense::Person.retrieve('qEnOZ5Oh0poWnQ1luFBfVw_0000')

      expect(person.experience.map(&:class)).to eql [Mense::Experience, Mense::Experience]
    end

    it 'maps the education to the Education class' do
      person = Mense::Person.retrieve('qEnOZ5Oh0poWnQ1luFBfVw_0000')

      expect(person.education.map(&:class)).to eql [Mense::Education, Mense::Education]
    end

    it 'maps the profiles to the Education class' do
      person = Mense::Person.retrieve('qEnOZ5Oh0poWnQ1luFBfVw_0000')

      expect(person.profiles.map(&:class)).to eql [Mense::Profile, Mense::Profile, Mense::Profile]
    end
  end
end
