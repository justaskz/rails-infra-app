class CrudApp::Worker < ApplicationRecord
  CREATE = 0
  UPDATE = 1
  DELETE = 2

  enum :job_type, {
    creator: CREATE,
    updater: UPDATE,
    deleter: DELETE,
  }

  def running?
    is_running == 1
  end
end
