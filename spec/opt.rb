# A simple manual test for delayed keys.
# Run with various keys enabled.
require 'tracing'

(0..1).each do |i|
  trace :pass?, "Pass #{i}" do
    trace :right?, "Right #{i}" do
      trace :by, "on by #{i}"
      trace :and, "and #{i}"
    end
    trace :and, "say nothing #{i}"
  end
end
