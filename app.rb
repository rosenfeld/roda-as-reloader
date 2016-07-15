require 'roda'

class App < Roda
  route do
    'output' # change this to 'output changed' and it should be autoreloaded
  end
end
