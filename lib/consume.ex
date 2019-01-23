defmodule Consume do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    tree = [worker(Consume.Repo, [])]
    opts = [name: Consume.Sup, strategy: :one_for_one]
    Supervisor.start_link(tree, opts)
  end

end
