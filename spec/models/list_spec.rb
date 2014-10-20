require 'spec_helper'

describe List do
   before do
    @list = List.new(title: "My List", list_type: "private")
  end

  subject { @list }

  it { should respond_to(:title) }
  it { should respond_to(:list_type) }
  it { should be_valid }
end
