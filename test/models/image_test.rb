require 'test_helper'
require 'rubygems'


class ImageTest < ActiveSupport::TestCase
  
  def setup
    @image = Image.new(title: 'hoge', file: open("#{Rails.root}/db/fixtures/test.png"), key: '1234')
  end
  
  test 'タイトルが空の時' do
    @image.title = ''
    assert_not @image.valid?
  end
  
  test 'ファイルが無いとき' do
    @image.file = nil
    assert_not @image.valid?
  end
  
  test '鍵が4桁未満の時' do
    @image.key = '121'
    assert_not @image.valid?
  end
  
  test '鍵が5桁以上の時' do
    @image.key = '12111'
    assert_not @image.valid?
  end
  
  test '鍵が空の時' do
    @image.key = ''
    assert_not @image.valid?
  end
  
  test '適切な値の時saveされる' do
    assert @image.save
  end
  
end
