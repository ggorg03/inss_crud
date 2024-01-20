require 'test_helper'

class WorkersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @worker = workers(:one)
  end

  test "should get index" do
    get workers_path
    assert_response :success
  end

  test "should get workers index" do
    get workers_path
    assert_response :success
  end

  test "should get new" do
    get  new_worker_path
    assert_response :success
  end

  test "should create worker" do
    ## TODO
    # assert_difference('Worker.count') do
    #  post workers_url, params: {
    #      name: "John Doe",
    #      cpf: "123.456.789-09",
    #      birthdate: Date.new(1990, 1, 1),
    #      salary: 50000.0,
    #      street: "Example Street",
    #      number: "42",
    #      district: "Example District",
    #      city: "Example City",
    #      state: "EX",
    #      zip_code: "12345-678",
    #      personal_phone: "(99)12345-6789",
    #      reference_phone: "(99)98765-4321"
    #    }
    # end

    # assert_redirected_to worker_url(Worker.last)
  end

  test "should show worker" do
    # TODO
  end

  test "should get edit" do
    # TODO
  end

  test "should update worker" do
    # TODO
  end

  test "should destroy worker" do
    # TODO
  end
end
