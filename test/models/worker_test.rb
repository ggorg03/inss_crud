require 'test_helper'

class WorkerTest < ActiveSupport::TestCase
  def setup
    @worker = Worker.new(
      name: "John Doe",
      cpf: "123.456.789-09",
      birthdate: Date.new(1990, 1, 1),
      salary: 50_000.0,
      street: "Example Street",
      number: "42",
      district: "Example District",
      city: "Example City",
      state: "EX",
      zip_code: "12345-678",
      personal_phone: "(99)12345-6789",
      reference_phone: "(99)98765-4321"
    )
  end

  test "initial worker should be valid" do
    assert @worker.valid?
  end

  # Validating name
  test "name should be present" do
    @worker.name = ""
    assert_not @worker.valid?
  end

  test "name should have minimum length of 2" do
    @worker.name = "A"
    assert_not @worker.valid?
  end

  test "name should contain only letters" do
    @worker.name = "John123"
    assert_not @worker.valid?
  end

  # validating cpf
  test "cpf should be present" do
    @worker.cpf = ""
    assert_not @worker.valid?
  end

  test "cpf should be unique" do
    duplicate_worker = @worker.dup
    @worker.save

    assert_not duplicate_worker.valid?
  end

  test "cpf should have valid format" do
    @worker.cpf = "123.456.789"
    assert_not @worker.valid?
  end

  # validating bithdate
  test "bithdate should be present" do
    @worker.birthdate = nil
    assert_not @worker.valid?
  end

  # validating salary
  test "salary should be present" do
    @worker.salary = nil
    assert_not @worker.valid?
  end

  test "salary should be greather than equal to 0" do
    @worker.salary = -1
    assert_not @worker.valid?

    @worker.salary = 0
    assert @worker.valid?
  end

  # validating street
  test "street should be present" do
    @worker.street = nil
    assert_not @worker.valid?
  end

  test "street should have minimum length of 5" do
    @worker.street = "qwee"
    assert_not @worker.valid?

    @worker.street = "qweee"
    assert @worker.valid?
  end

  # validating number
  test "number should be present" do
    @worker.number = nil
    assert_not @worker.valid?
  end

  test "number should have minimun length of 2" do
    @worker.number = "1"
    assert_not @worker.valid?
  end

  test "number should have valid format" do
    @worker.number = "qwe"
    assert_not @worker.valid?

    @worker.number = "qwe123"
    assert_not @worker.valid?

    @worker.number = "123qwe123"
    assert_not @worker.valid?
  end

  # validating district
  test "district should be present" do
    @worker.district = nil
    assert_not @worker.valid?
  end

  test "district should have minimun length of 2" do
    @worker.district = "e"
    assert_not @worker.valid?
  end

  # validating city
  test "city should be present" do
    @worker.city = nil
    assert_not @worker.valid?
  end

  test "city should have minimun length of 2" do
    @worker.city = "e"
    assert_not @worker.valid?
  end

  # validating state
  test "state should be present" do
    @worker.state = nil
    assert_not @worker.valid?
  end

  test "state should have minimun length of 2" do
    @worker.state = "e"
    assert_not @worker.valid?
  end

  # validating zip_code
  test "zip_code should be present" do
    @worker.zip_code = nil
    assert_not @worker.valid?
  end

  test "zip_code should have valid format" do
    @worker.zip_code = "12345-1234"
    assert_not @worker.valid?

    @worker.zip_code = "12345-12"
    assert_not @worker.valid?

    @worker.zip_code = "12345123"
    assert_not @worker.valid?
  end

  # validating personal_phone
  test "personal_phone should be present" do
    @worker.personal_phone = nil
    assert_not @worker.valid?
  end

  test "personal_phone should have valid format" do
    @worker.personal_phone = "(12)12345-123"
    assert_not @worker.valid?

    @worker.personal_phone = "(12)1234-12345"
    assert_not @worker.valid?

    @worker.personal_phone = "12123451234"
    assert_not @worker.valid?
  end

  # validating reference_phone
  test "reference_phone should be present" do
    @worker.reference_phone = nil
    assert_not @worker.valid?
  end

  test "reference_phone should have valid format" do
    @worker.reference_phone = "(12)12345-123"
    assert_not @worker.valid?

    @worker.reference_phone = "(12)1234-12345"
    assert_not @worker.valid?

    @worker.reference_phone = "12123451234"
    assert_not @worker.valid?
  end
end
