# encoding: utf-8
require File.expand_path("../spec_helper", __FILE__)

describe "FileField" do

  before :each do
    browser.goto(WatirSpec.files + "/forms_with_input_elements.html")
  end

  describe "#value=" do
    it "sends content as correct content type for common file types" do
      browser.file_field(:name, "new_user_portrait").value = "foo.doc"
      obj = browser.file_field(:name, "new_user_portrait").locate
      obj.getContentType.should == "application/msword"
    end
  end

end
