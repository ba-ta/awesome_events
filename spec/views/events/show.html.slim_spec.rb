require 'rails_helper'

RSpec.describe "events/show", :type => :view do
  context '未ログインユーザがアクセスした時' do
    before do
      allow(view).to receive(:logged_in?)   { false }
      allow(view).to receive(:current_user) { nil }
    end

    context 'かつ、@event.ownerがnilのとき' do
      before do
        assign(:event, create(:event, owner: nil))
        assign(:tickets, [])
      end

      it '"退会したユーザです"と表示されていること' do
        render
        expect(rendered).to match /退会したユーザです/
      end
    end
  end

  context 'ログインユーザがアクセスした時' do

  end


end
