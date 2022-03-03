# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'should follow and unfollow a user' do
    kamiokan = users(:kamiokan)
    hoge = users(:hoge)
    assert_not kamiokan.following?(hoge)
    kamiokan.follow(hoge)
    assert kamiokan.following?(hoge)
    assert hoge.followers.include?(kamiokan)
    kamiokan.unfollow(hoge)
    assert_not kamiokan.following?(hoge)
  end
end
