defmodule Link1 do
  import :timer, only: [sleep: 1]

  def sad_function
    sleep 500
    exit(:boom)
  end

  def run
end