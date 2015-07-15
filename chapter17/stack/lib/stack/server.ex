defmodule Stack.Server do
  use GenServer

  def start_link(stack) do
    GenServer.start_link(__MODULE__, stack, name: __MODULE__)
  end

  def pop do
    GenServer.call __MODULE__, :pop
  end

  def push(item) do
    GenServer.cast __MODULE__, {:push, item}
  end

  def handle_call(:init, _from, stack) do
    { :reply, stack, stack }
  end

  def handle_call(:pop, _from, stack) do
    [h|t] = stack
    { :reply, h, t }
  end

  def handle_cast({:push, item}, stack) do
    {:noreply, [item] ++ stack}
  end

  def terminate(reason, state) do
    IO.puts "ZOMG!"
  end
end
