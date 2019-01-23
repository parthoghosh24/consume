defmodule Consume.Work do
  alias Models.Datum
  alias Consume.Repo
  alias ExAws.Kinesis
  import Ecto.Query

  @moduledoc """
  Documentation for Consume. This is the main module which is doing all work
  """

  def pump_data_to_kinesis do
  	records = for n <- 1..10, do: %{data: "data#{Enum.random(1..1000)}#{n}", partition_key: "123"}	
  	put_request = Kinesis.put_records("test_stream", records) |> ExAws.request
  end

  def read_kinesis do
  	{:ok, shard_iterator_response} = Kinesis.get_shard_iterator("test_stream", "shardId-000000000001", :trim_horizon) |> ExAws.request
  	shard_iterator = shard_iterator_response["ShardIterator"]
  	data_response = Kinesis.get_records(shard_iterator) |> ExAws.request
  	{:ok, final_data} = Kinesis.decode_records(data_response)

  	insert(final_data)
  end

  def insert(kinesis_data) do
    Repo.insert! %Datum{kinesis_data: kinesis_data}
  end

  def show do
    query = from data in Datum, select: data
    Repo.all(query)
  end
end
