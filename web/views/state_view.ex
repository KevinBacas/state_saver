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

  def render("error.json", %{changeset: changeset}) do
    errors = Enum.map(changeset.errors, fn {field, detail} ->
      %{
        source: %{ pointer: "/data/attributes/#{field}" },
        title: "Invalid Attribute",
        detail: render_detail(detail)
      }
    end)

    %{errors: errors}
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

  def render_detail({message, values}) do
    Enum.reduce values, message, fn {k, v}, acc ->
      String.replace(acc, "%{#{k}}", to_string(v))
    end
  end

  def render_detail(message) do
    message
  end
end
