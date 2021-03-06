defmodule Receive do
  def wait_for_messages do
    receive do
      {:basic_deliver, payload, meta} ->
        IO.puts(" [X] Received #{payload}")
        IO.puts(" [X] Meta: #{inspect(meta, limit: :infinity)}")

        wait_for_messages()
    end

  end
end

{:ok, connection} = AMQP.Connection.open
{:ok, channel} = AMQP.Channel.open(connection)

AMQP.Queue.declare(channel, "hello")
AMQP.Basic.consume(channel, "hello", nil, no_ack: true)
IO.puts(" [X] Waiting for new messages. To exit press CTRL + C, CTRL + C")

Receive.wait_for_messages()
