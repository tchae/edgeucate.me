require 'spec_helper'

describe LinksController do

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'sjow'" do
    it "should be successful" do
      get 'sjow'
      response.should be_success
    end
  end

end
