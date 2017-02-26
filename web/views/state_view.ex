defmodule StateSaver.StateView do
  use StateSaver.Web, :view

  def render("index.json", %{states: states}) do
    %{
      states: Enum.map(states, &state_json/1)
    }
  end

  def render("show.json", %{state: state}) do
    %{
      state: state_json(state)
    }
  end

  def state_json(state) do
    %{
      id: state.id,
      state: state.state,
      hash: state.hash,
      inserted_at: state.inserted_at,
      updated_at: state.updated_at
    }
  end
end
