Yabeda.configure do
  default_tag :rails_environment, 'production'

  group :prometheus_app do
    counter :simple_count, comment: 'Demo'
  end
end

Yabeda.configure!
