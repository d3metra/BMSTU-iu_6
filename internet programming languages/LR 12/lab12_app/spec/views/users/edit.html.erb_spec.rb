# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'users/edit', type: :view do
  let(:user) do
    User.create!(
      username: 'MyString',
      email: 'MyString',
      password_digest: 'MyString'
    )
  end

  before(:each) do
    assign(:user, user)
  end

  it 'renders the edit user form' do
    render

    assert_select 'form[action=?][method=?]', user_path(user), 'post' do
      assert_select 'input[name=?]', 'user[username]'

      assert_select 'input[name=?]', 'user[email]'

      assert_select 'input[name=?]', 'user[password_digest]'
    end
  end
end
