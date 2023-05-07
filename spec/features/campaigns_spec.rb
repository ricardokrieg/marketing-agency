require 'rails_helper'

describe "Campaigns" do
  let!(:campaign) { create(:campaign, title: 'First Campaign') }

  before do
    create(:campaign, title: 'Second Campaign')
  end

  it "lists all campaigns" do
    visit '/campaigns'

    expect(page).to have_content 'First Campaign'
    expect(page).to have_content 'Second Campaign'
  end

  it "shows a campaign" do
    visit "/campaigns/#{campaign.id}"

    expect(page).to have_current_path(campaign_path(campaign))
    expect(page).to have_content 'First Campaign'
    expect(page).to have_content campaign.content
    expect(page).to have_content campaign.target_list.first
  end

  it "creates a new campaign" do
    visit '/campaigns/new'

    fill_in 'Title', with: 'My Campaign'
    fill_in 'Content', with: 'This is my campaign'
    fill_in 'Targets', with: "target1\ntarget2"
    click_button 'Create'

    expect(page).to have_current_path(campaigns_path)
    expect(page).to have_content 'My Campaign'
  end

  it "updates a campaign" do
    visit "/campaigns/#{campaign.id}/edit"

    fill_in 'Title', with: 'My Campaign'
    fill_in 'Content', with: 'This is my campaign'
    fill_in 'Targets', with: "target1\ntarget2"
    click_button 'Update'

    expect(page).to have_current_path(campaign_path(campaign))
    expect(page).to have_content 'My Campaign'
    expect(page).to have_content 'This is my campaign'
    expect(page).to have_content "target1"
    expect(page).to have_content "target2"
  end

  it "deletes a campaign" do
    visit "/campaigns/#{campaign.id}"

    click_button 'Delete'

    expect(page).to have_current_path(campaigns_path)
    expect(page).not_to have_content 'First Campaign'
    expect(page).to have_content 'Second Campaign'
  end

  it "starts a campaign" do
    visit "/campaigns/#{campaign.id}"

    expect(page).not_to have_content 'Messages'

    click_button 'Start'

    expect(page).to have_current_path(campaign_path(campaign))
    expect(page).to have_content 'completed'
    expect(page).not_to have_button 'Start'
    expect(page).to have_content 'Messages'
  end
end