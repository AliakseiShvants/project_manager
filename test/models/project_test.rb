require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  def setup
    @project = Project.new(
                          name: "Write a tests",
                          summary: "write a models and integration tests",
                          start_date: DateTime.now,
                          end_date: DateTime.now + 1.day
    )
  end

  test "should be valid" do
    assert @project.valid?
  end

  test "name should be present" do
    @project.name = "     "
    assert_not @project.valid?
  end

  test "summary should be present" do
    @project.summary = "     "
    assert_not @project.valid?
  end

  test "start date should be present" do
    @project.start_date = ""
    assert_not @project.valid?
  end

  test "name should not be too long" do
    @project.name = "n" * 101
    assert_not @project.valid?
  end

  test "summary should not be too long" do
    @project.summary = "s" * 1001
    assert_not @project.valid?
  end

end
