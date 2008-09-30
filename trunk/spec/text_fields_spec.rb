require File.dirname(__FILE__) + '/spec_helper.rb'

describe "TextFields" do

  before :all do
    @browser = Browser.new
  end

  before :each do
    @browser.goto(TEST_HOST + "/forms_with_input_elements.html")
  end

  describe "#length" do
    it "should return the number of text fields" do
      @browser.text_fields.length.should == 9
    end
  end

  describe "#[]" do
    it "should return the text field at the given index" do
      @browser.text_fields[1].id.should == "new_user_first_name"
      @browser.text_fields[2].id.should == "new_user_last_name"
      @browser.text_fields[3].id.should == "new_user_email"
    end
  end

  describe "#each" do
    it "should iterate through text fields correctly" do
      index = 1
      @browser.text_fields.each do |r|
        r.name.should == @browser.text_field(:index, index).name
        r.id.should ==  @browser.text_field(:index, index).id
        r.value.should == @browser.text_field(:index, index).value
        index += 1
      end
      @browser.text_fields.length.should == index - 1
    end
  end

  after :all do
    @browser.close
  end
end

