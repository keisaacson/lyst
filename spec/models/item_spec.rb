require 'spec_helper'

describe Item do
   before do
    @list = List.new(title: "My List", list_type: "private")
    @item = Item.new(list_id: @list.id, content: "Test Item")
  end

  subject { @item }

  it { should respond_to(:content) }
  it { should respond_to(:list_id) }
  it { should be_valid }
end
