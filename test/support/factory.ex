# Create the factory in test/support/factory.ex
defmodule StateSaver.Factory do
  use ExMachina.Ecto, repo: StateSaver.Repo

  def state_factory do
    state = "{\"a\": \"a\"}"
    %StateSaver.State{
      state: state,
      hash: :crypto.hash(:sha256, state) |> Base.encode16,
    }
  end
end
