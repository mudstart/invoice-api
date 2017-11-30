# frozen_string_literal: true

require 'test_helper'

module V1
  class ContactsControllerTest < ActionDispatch::IntegrationTest
    test 'should get only contact for artellectual' do
      account = accounts(:artellectual)

      not_artellectial_contact = contacts(:two)

      get(
        v1_contacts_path(account_id: account.id)
      )

      contacts = JSON.parse(@response.body)['data']
      contact_ids = contacts.map { |contact| contact['id'] }

      assert_response :success
      assert_not_includes contact_ids, not_artellectial_contact.id
    end
  end
end
