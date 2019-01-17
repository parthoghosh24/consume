defmodule Setup do
  def init_mongo do
    {:ok, _} = Mongo.start_link(database: "consume", name: :db)
  end
end
