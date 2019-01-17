defmodule Consume do
  import Models.Datum
  import Consume.Repo
  import Ecto.Query

  @moduledoc """
  Documentation for Consume. This is the main module which is doing all work
  """

  def insert(kinesis_data) do
    Consume.Repo.insert! %Models.Datum{kinesis_data: kinesis_data}
  end

  def show do
    query = from data in Models.Datum, select: data
    Consume.Repo.all(query)
  end

end
