defmodule Models.Datum do
  use Ecto.Schema

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "data" do
    field :kinesis_data, :map
    timestamps()
  end
end
