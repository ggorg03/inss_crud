module ApplicationHelper
  def current_path?(test_path)
    return 'active' if request.path == test_path

    ''
  end
end
