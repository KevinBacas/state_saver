defmodule StateSaver.StateTest do
  use StateSaver.ModelCase

  alias StateSaver.State

  @valid_attrs %{hash: "some content", state: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = State.changeset(%State{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = State.changeset(%State{}, @invalid_attrs)
    refute changeset.valid?
  end
end
