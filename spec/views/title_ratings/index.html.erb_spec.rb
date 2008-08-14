require File.dirname(__FILE__) + '/../../spec_helper'

describe "/title_ratings/index.html.erb" do
  include TitleRatingsHelper
  
  before(:each) do
    title_rating_98 = mock_model(TitleRating)
    title_rating_98.should_receive(:action).and_return("1")
    title_rating_98.should_receive(:comedy).and_return("1")
    title_rating_98.should_receive(:drama).and_return("1")
    title_rating_98.should_receive(:scifi).and_return("1")
    title_rating_98.should_receive(:romance).and_return("1")
    title_rating_98.should_receive(:musical).and_return("1")
    title_rating_98.should_receive(:kids).and_return("1")
    title_rating_98.should_receive(:adventure).and_return("1")
    title_rating_98.should_receive(:mystery).and_return("1")
    title_rating_98.should_receive(:suspense).and_return("1")
    title_rating_98.should_receive(:horror).and_return("1")
    title_rating_98.should_receive(:fantasy).and_return("1")
    title_rating_98.should_receive(:tv).and_return("1")
    title_rating_98.should_receive(:war).and_return("1")
    title_rating_98.should_receive(:western).and_return("1")
    title_rating_98.should_receive(:sports).and_return("1")
    title_rating_98.should_receive(:premise).and_return("1")
    title_rating_98.should_receive(:plot).and_return("1")
    title_rating_98.should_receive(:score).and_return("1")
    title_rating_98.should_receive(:acting).and_return("1")
    title_rating_98.should_receive(:special_effects).and_return("1")
    title_rating_98.should_receive(:pace).and_return("1")
    title_rating_98.should_receive(:character_development).and_return("1")
    title_rating_98.should_receive(:cinematography).and_return("1")
    title_rating_99 = mock_model(TitleRating)
    title_rating_99.should_receive(:action).and_return("1")
    title_rating_99.should_receive(:comedy).and_return("1")
    title_rating_99.should_receive(:drama).and_return("1")
    title_rating_99.should_receive(:scifi).and_return("1")
    title_rating_99.should_receive(:romance).and_return("1")
    title_rating_99.should_receive(:musical).and_return("1")
    title_rating_99.should_receive(:kids).and_return("1")
    title_rating_99.should_receive(:adventure).and_return("1")
    title_rating_99.should_receive(:mystery).and_return("1")
    title_rating_99.should_receive(:suspense).and_return("1")
    title_rating_99.should_receive(:horror).and_return("1")
    title_rating_99.should_receive(:fantasy).and_return("1")
    title_rating_99.should_receive(:tv).and_return("1")
    title_rating_99.should_receive(:war).and_return("1")
    title_rating_99.should_receive(:western).and_return("1")
    title_rating_99.should_receive(:sports).and_return("1")
    title_rating_99.should_receive(:premise).and_return("1")
    title_rating_99.should_receive(:plot).and_return("1")
    title_rating_99.should_receive(:score).and_return("1")
    title_rating_99.should_receive(:acting).and_return("1")
    title_rating_99.should_receive(:special_effects).and_return("1")
    title_rating_99.should_receive(:pace).and_return("1")
    title_rating_99.should_receive(:character_development).and_return("1")
    title_rating_99.should_receive(:cinematography).and_return("1")

    assigns[:title_ratings] = [title_rating_98, title_rating_99]
  end

  it "should render list of title_ratings" do
    render "/title_ratings/index.html.erb"
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", "1", 2)
  end
end
