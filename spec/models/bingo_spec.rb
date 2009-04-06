require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Bingo do
  before(:each) do
    @valid_attributes = {
      :linhas => 3,
      :colunas => 5,
      :quantidade => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Bingo.create!(@valid_attributes)
  end
end
