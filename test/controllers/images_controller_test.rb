require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  
  setup do
    @image = images(:testimage)
  end
  
  test 'imageを一覧表示すること' do
    get "/"
    assert_response :success
  end
  
  test 'imageを1つ表示すること' do
    get "/images/#{@image.id}"
    assert_response :success
  end
  
  test 'newテンプレートをrenderすること' do
    get "/images/new"
    assert_response :success
  end
  
  test "editテンプレートをrenderすること" do
    get "/images/#{@image.id}/edit"
    assert_response :success
  end
  
  test "imageを更新すること" do
    patch "/images/#{@image.id}", params: {image: {title: "hoge",  file: open("#{Rails.root}/db/fixtures/test.png"), key: "1234"}}
    assert_redirected_to '/'
  end
  
  
end
