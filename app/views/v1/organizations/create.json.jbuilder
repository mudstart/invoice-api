json.data do
  json.organization do
    json.partial! 'v1/organizations/organization', organization: organization
  end
end
