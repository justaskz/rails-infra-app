class CrudApp::Records::Update
  def self.for(worker_id)
    record = CrudApp::Record.order('RAND()').limit(1)&.first
    return unless record

    CrudApp::Record.update(record.id, version: record.version + 1, worker_id: worker_id)
    updated_record = CrudApp::Record.find(record.id)

    raise('Record version was not updated') if updated_record.version <= record.version
    raise('Received outdated record') if updated_record.updated_at <= record.updated_at

    true
  end
end
