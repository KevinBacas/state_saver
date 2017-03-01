defmodule StateSaver.State do
  use StateSaver.Web, :model

  schema "states" do
    field :state, :string
    field :hash, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:state, :hash])
    |> validate_required([:state])
    |> generate_hash
    |> unique_constraint(:hash)
  end

  defp generate_hash(changeset) do
    state = if (changeset.changes[:state] == nil), do: "", else: changeset.changes[:state]
    put_change(changeset, :hash, :crypto.hash(:sha256, state) |> Base.encode16)
  end
end
