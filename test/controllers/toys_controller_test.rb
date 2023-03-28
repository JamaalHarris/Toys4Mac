require "test_helper"

class ToysControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/toys.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Toy.count, data.length
  end

  test "create" do
    assert_difference "Toy.count", 1 do
      post "/toys.json", params: { name: "teddy bear", price: 80, image: "" }
      assert_response 200
    end
  end

  test "show" do
    get "/toys/#{Toy.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["name", "price", "image"], data.keys
  end

  test "update" do
    toy = Toy.first
    patch "/toys/#{toy.id}.json", params: { name: "Updated name" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated name", data["name"]
  end

  test "destroy" do
    assert_difference "Toy.count", -1 do
      delete "/toys/#{Toy.first.id}.json"
      assert_response 200
    end
  end
end
