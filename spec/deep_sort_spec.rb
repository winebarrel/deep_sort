require 'spec_helper'

describe DeepSort do
  let(:hash) do
    {"firstName"=>"John",
     "lastName"=>"Smith",
     "age"=>25,
     "address"=>
      {"streetAddress"=>"21 2nd Street",
       "city"=>"New York",
       "state"=>"NY",
       "postalCode"=>"10021"},
     "phoneNumber"=>
      [{"type"=>"home", "number"=>"212 555-1234"},
       {"type"=>"fax", "number"=>"646 555-4567"}],
     "gender"=>{"type"=>"male"},
     "number"=>[5, 4, 9, 7],
     "tags"=>Set["staff", "engineer", {"joined_at"=>"2016", "emp_no"=>10}, "writer"]}
  end

  let(:sorted_hash) do
    {"address"=>
      {"city"=>"New York",
       "postalCode"=>"10021",
       "state"=>"NY",
       "streetAddress"=>"21 2nd Street"},
     "age"=>25,
     "firstName"=>"John",
     "gender"=>{"type"=>"male"},
     "lastName"=>"Smith",
     "phoneNumber"=>
      [{"number"=>"212 555-1234", "type"=>"home"},
       {"number"=>"646 555-4567", "type"=>"fax"}],
     "number" => [4, 5, 7, 9],
     "tags"=>Set["staff", "engineer", {"joined_at"=>"2016", "emp_no"=>10}, "writer"]}
  end

  let(:sorted_hash_with_enum) do
    new_hash = sorted_hash.dup
    new_hash["tags"] = ["engineer", "staff", "writer", {"emp_no"=>10, "joined_at"=>"2016"}]
    new_hash
  end

  specify 'deep_sort' do
    expect(hash.deep_sort.pretty_inspect).to eq sorted_hash.pretty_inspect
    expect(hash.pretty_inspect).to_not eq sorted_hash.pretty_inspect
  end

  specify 'deep_sort!' do
    expect(hash.deep_sort!.pretty_inspect).to eq sorted_hash.pretty_inspect
    expect(hash.pretty_inspect).to eq sorted_hash.pretty_inspect
  end

  specify 'sort_enum' do
    expect(hash.deep_sort(sort_enum: true).pretty_inspect).to eq sorted_hash_with_enum.pretty_inspect
  end
end
