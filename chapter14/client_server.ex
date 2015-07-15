defmodule Server do
  def say do
    receive do
      {sender, message} ->
        send sender, {:ok, "I say :#{message}"}
        say
    end
  end
end


defmodule Client do
  def make_client do
    spawn(__MODULE__, :answer, [])
  end

  def ask(server_pid, client_pid, message) do
    send(server_pid, {client_pid, message})
  end

  def answer do
    receive do
      {:ok, message} ->
        IO.puts message
        answer
    end
  end
end

server_pid = spawn(Server, :say, [])
