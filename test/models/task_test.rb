require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  def setuo
    @task = Task.new(
                    title: "test #1",
                    description: "task model test",
                    status: "NEW"
    )
  end


end
